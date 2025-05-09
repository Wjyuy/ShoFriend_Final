package com.boot.controller;

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
import com.boot.dto.ProductDTO;
import com.boot.service.CheckOutService;
import com.boot.service.ProductService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/pay")
public class CheckOutController {
	@Autowired
    private CheckOutService kakaoPayService;
	
	@Autowired
	private ProductService productService;
	
	@RequestMapping("/checkout")
	public String checkout(Model model,@RequestParam("contentId") int product_id,@RequestParam("quantity") String quantity,HttpSession session,RedirectAttributes redirectAttributes) {
		log.info("checkout()");
		log.info("product_id=>"+product_id);
		log.info("quantity=>"+quantity);
		
		CustomerDTO customer = (CustomerDTO) session.getAttribute("loginCustomer");
		if (customer == null) {
			redirectAttributes.addFlashAttribute("msg", "로그인후 이용해 주세요 😭");
			return "redirect:../log/login";
		}
	    ProductDTO product = productService.getProductById(product_id);
	    model.addAttribute("product", product);
	    log.info("product=>"+product);
	    

	    return "pay/checkout";
	}
	
	@PostMapping("/ready")
    public String kakaoPay() {
        String redirectUrl = kakaoPayService.kakaoPayReady();
        log.info("redirectUrl=>"+redirectUrl);
        return "redirect:" + redirectUrl;
    }

    @GetMapping("/success")
    public String success(@RequestParam("pg_token") String pgToken, Model model) {
    	String result = kakaoPayService.kakaoPayApprove(pgToken);
        model.addAttribute("result", result); // JSP에서 결제 결과 출력 가능
        return "pay/success";
    }

    @GetMapping("/cancel")
    public String cancel() {
        return "pay/cancel";
    }

    @GetMapping("/fail")
    public String fail() {
        return "pay/fail";
    }
}
