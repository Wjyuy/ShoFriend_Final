package com.boot.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

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
import com.boot.dto.OrderItemDTO;
import com.boot.dto.OrdersDTO;
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
	
	@Autowired
	private CheckOutService checkoutService;
	
	@RequestMapping("/checkout")
	public String checkout(Model model,@RequestParam("contentId") int product_id,@RequestParam("quantity") int quantity,HttpSession session,RedirectAttributes redirectAttributes) {
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
	    model.addAttribute("quantity", quantity);
	    log.info("product=>"+product);
	    
	    int price = product.getPrice();
	    int discount = 0;

	    Date now = new Date();
	    if (product.getDiscount_start() != null && product.getDiscount_end() != null &&
	        now.after(product.getDiscount_start()) && now.before(product.getDiscount_end())) {
	        discount = product.getDiscount_percentage();
	    }

	    int finalPrice = price - (price * discount / 100);
	    int totalPrice = finalPrice * quantity;
	    
	    model.addAttribute("finalPrice", finalPrice);
	    model.addAttribute("totalPrice", totalPrice);

	    return "pay/checkout";
	}
	
	@PostMapping("/ready")
	public String kakaoPay(@RequestParam("totalAmount") int totalAmount,
	                       @RequestParam("itemName") String itemName,
	                       @RequestParam(value = "quantity", defaultValue = "1") int quantity,
	                       @RequestParam("productId") int productId, // 상품 ID 파라미터 추가 (필요한 경우)
	                       HttpSession session) {
	    String partnerOrderId = (String) session.getAttribute("partnerOrderId");
	    if (partnerOrderId == null) {
	        partnerOrderId = "order_" + System.currentTimeMillis() + "_" + UUID.randomUUID().toString().substring(0, 8);
	        session.setAttribute("partnerOrderId", partnerOrderId);
	        CustomerDTO loginCustomer = (CustomerDTO) session.getAttribute("loginCustomer");
	        if (loginCustomer != null) {
	            session.setAttribute("partnerUserId", "user_" + loginCustomer.getId());
	        }
	    }
	    session.setAttribute("totalPrice", totalAmount);
	    session.setAttribute("quantity", quantity);
	    session.setAttribute("productId", productId); // 상품 ID 세션에 저장 (필요한 경우)

	    String redirectUrl = kakaoPayService.kakaoPayReady(totalAmount, itemName, quantity);
	    log.info("redirectUrl=>" + redirectUrl);
	    log.info("Session after /ready - totalPrice: {}, quantity: {}, productId: {}, partnerOrderId: {}, partnerUserId: {}",
	             session.getAttribute("totalPrice"), session.getAttribute("quantity"), session.getAttribute("productId"), session.getAttribute("partnerOrderId"), session.getAttribute("partnerUserId"));
	    return "redirect:" + redirectUrl;
	}
	
    @GetMapping("/success")
    public String success(@RequestParam("pg_token") String pgToken, Model model,HttpSession session) {
    	String result = kakaoPayService.kakaoPayApprove(pgToken);
        model.addAttribute("result", result); // JSP에서 결제 결과 출력 가능

        CustomerDTO loginCustomer = (CustomerDTO) session.getAttribute("loginCustomer");
        if (loginCustomer != null) {
            // 주문 정보 생성
            OrdersDTO orderDTO = new OrdersDTO();
            orderDTO.setCustomerId(loginCustomer.getId());
            orderDTO.setTotalPrice((Integer) session.getAttribute("totalPrice")); // 결제 준비 시 저장했던 총 가격
            orderDTO.setTotalQuantity((Integer) session.getAttribute("quantity")); // 결제 준비 시 저장했던 총 수량
            orderDTO.setPartnerOrderId((String) session.getAttribute("partnerOrderId")); // 결제 준비 시 생성했던 주문 번호
            // 배송 정보 설정 (세션에서 CustomerDTO를 통해 가져오기)
            String deliveryAddress = loginCustomer.getAddress() + " " + loginCustomer.getAddress1();
            int deliveryZipcode = loginCustomer.getZipcode();
            String deliveryMemo = (String) session.getAttribute("deliveryMemo"); // 세션에서 배송 메시지 가져오기

            orderDTO.setDeliveryAddress(deliveryAddress);
            orderDTO.setDeliveryZipcode(deliveryZipcode);
            
            // 주문 아이템 정보 생성 (예시: 단일 상품 구매)
            OrderItemDTO orderItemDTO = new OrderItemDTO();
            // 상품 ID는 결제 준비 단계나 checkout 페이지에서 세션에 저장했거나 Model에 담겨왔어야 함
            orderItemDTO.setProductId((Integer) session.getAttribute("productId"));
            orderItemDTO.setQuantity((Integer) session.getAttribute("quantity"));
            orderItemDTO.setSalePrice((Integer) session.getAttribute("totalPrice") / (Integer) session.getAttribute("quantity")); // 개당 가격 계산 (예시)

            List<OrderItemDTO> orderItems = new ArrayList<>();
            orderItems.add(orderItemDTO);

            // 주문 생성 서비스 호출
            checkoutService.createOrder(orderDTO, orderItems);

            session.removeAttribute("partnerOrderId");
            session.removeAttribute("partnerUserId");
            session.removeAttribute("totalPrice");
            session.removeAttribute("quantity");
            session.removeAttribute("productId"); // 필요에 따라 제거
        } else {
            // 로그인 정보가 없는 경우 처리 (예: 에러 메시지 전달)
            model.addAttribute("error", "로그인 정보가 없습니다.");
        }

        return "pay/success";
        
    }
    
    @PostMapping("/saveDeliveryMemo")
    public String saveDeliveryMemo(@RequestParam("delivery_memo") String deliveryMemo, HttpSession session) {
        session.setAttribute("deliveryMemo", deliveryMemo);
        // 결제 진행 페이지로 리다이렉트 또는 다른 처리
        return "redirect:/pay/checkout"; // 예시
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
