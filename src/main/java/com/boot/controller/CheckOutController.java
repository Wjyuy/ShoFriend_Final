package com.boot.controller;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.boot.dto.CustomerDTO;
import com.boot.service.CheckOutService;
import com.boot.service.ProductService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class CheckOutController {
	@Autowired
    private CheckOutService kakaoPayService;
	
	@RequestMapping("/checkout")
	public String checkout(HttpSession session,RedirectAttributes redirectAttributes) {
		log.info("checkout()");


	    CustomerDTO customer = (CustomerDTO) session.getAttribute("loginCustomer");
	    if (customer == null) {
	    	redirectAttributes.addFlashAttribute("msg", "로그인후 이용해 주세요 😭");
	    	return "redirect:log/login";
	    }

	    return "checkout";
	}
	
	@PostMapping("/kakaopay/ready")
    public String kakaoPayReady(String itemName, int quantity, int totalAmount, int taxFreeAmount, HttpSession session, Model model) throws Exception {
        Map<String, String> readyResponse = kakaoPayService.prepareKakaoPay(
                "ORDER_" + System.currentTimeMillis(), // partnerOrderId
                session.getId(), // partnerUserId (임시로 세션 ID 사용)
                itemName,
                quantity,
                totalAmount,
                taxFreeAmount,
                "http://localhost:8080/kakaopay/success", // approvalUrl
                "http://localhost:8080/kakaopay/cancel",  // cancelUrl
                "http://localhost:8080/kakaopay/fail"    // failUrl
        );
        session.setAttribute("tid", readyResponse.get("tid"));
        session.setAttribute("partnerOrderId", "ORDER_" + System.currentTimeMillis());
        session.setAttribute("partnerUserId", session.getId());
        model.addAttribute("next_redirect_pc_url", readyResponse.get("next_redirect_pc_url"));
        return "redirect:" + readyResponse.get("next_redirect_pc_url");
    }

    @GetMapping("/kakaopay/success")
    public String kakaoPaySuccess(@RequestParam("pg_token") String pgToken, @RequestParam(value = "tid", required = false) String tidFromRedirect, HttpSession session, Model model) throws Exception {
        String tid = (String) session.getAttribute("tid");
        String partnerOrderId = (String) session.getAttribute("partnerOrderId");
        String partnerUserId = (String) session.getAttribute("partnerUserId");

        if (tid == null && tidFromRedirect != null) {
            tid = tidFromRedirect;
        }

        Map<String, String> approveResponse = kakaoPayService.approveKakaoPay("TC0ONETIME", tid, partnerOrderId, partnerUserId, pgToken);
        model.addAttribute("approveInfo", approveResponse);
        return "kakaopay/success"; // kakaopay/success.jsp
    }

    @PostMapping("/kakaopay/cancel") // POST 요청으로 변경 (취소 정보를 받아야 할 수 있음)
    public String kakaoPayCancel() throws Exception {
        return "kakaopay/cancel"; // 취소 성공 결과를 보여줄 JSP 페이지
    }

    @GetMapping("/kakaopay/fail")
    public String kakaoPayFail()  {
        return "kakaopay/fail"; // kakaopay/fail.jsp
    }
}
