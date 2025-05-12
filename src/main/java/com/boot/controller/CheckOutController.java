package com.boot.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;
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
	public String checkout(Model model,@RequestParam("product_id") int product_id,@RequestParam("quantity") int quantity,HttpSession session,RedirectAttributes redirectAttributes) {
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
    public String kakaoPay(@RequestParam Map<String, String> params, HttpSession session) {
    	log.info("Session ID in /ready: {}", session.getId());
        int totalAmount = Integer.parseInt(params.get("totalAmount"));
        String itemName = params.get("itemName");
        int quantity = Integer.parseInt(params.get("quantity"));
        int productId = Integer.parseInt(params.get("productId"));
        String zipcode = params.get("zipcode");
        String address = params.get("address");
        String address1 = params.get("address1");
        String deliveryMemo = params.get("delivery_memo");

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
        session.setAttribute("productId", productId);
        session.setAttribute("deliveryZipcode", zipcode); // 배송 정보 세션에 저장
        session.setAttribute("deliveryAddress", address + " " + address1);
        session.setAttribute("deliveryMemo", deliveryMemo);

        String redirectUrl = kakaoPayService.kakaoPayReady(totalAmount, itemName, quantity);
        log.info("redirectUrl=>" + redirectUrl);
        log.info("Session after /ready - totalPrice: {}, quantity: {}, productId: {}, partnerOrderId: {}, partnerUserId: {}, zipcode: {}, address: {}, deliveryMemo: {}",
                 session.getAttribute("totalPrice"), session.getAttribute("quantity"), session.getAttribute("productId"), session.getAttribute("partnerOrderId"), session.getAttribute("partnerUserId"),
                 session.getAttribute("deliveryZipcode"), session.getAttribute("deliveryAddress"), session.getAttribute("deliveryMemo"));
        return "redirect:" + redirectUrl;
    }

    @GetMapping("/success")
    public String success(@RequestParam Map<String, String> params, Model model, HttpSession session) {
        log.info("success()");
        log.info("Session ID in /success: {}", session.getId());
        String pgToken = params.get("pg_token");

        String result = kakaoPayService.kakaoPayApprove(pgToken);
        model.addAttribute("result", result);
        log.info("Session values after kakaoPayApprove - totalPrice: {}, quantity: {}, productId: {}, partnerOrderId: {}, deliveryZipcode: {}, deliveryAddress: {}, deliveryMemo: {}",
                session.getAttribute("totalPrice"), session.getAttribute("quantity"), session.getAttribute("productId"), session.getAttribute("partnerOrderId"),
                session.getAttribute("deliveryZipcode"), session.getAttribute("deliveryAddress"), session.getAttribute("deliveryMemo"));
        
        CustomerDTO loginCustomer = (CustomerDTO) session.getAttribute("loginCustomer");
        if (loginCustomer != null) {
            log.info("Session values in /success - totalPrice: {}, quantity: {}, productId: {}, partnerOrderId: {}, deliveryZipcode: {}, deliveryAddress: {}, deliveryMemo: {}",
                     session.getAttribute("totalPrice"), session.getAttribute("quantity"), session.getAttribute("productId"), session.getAttribute("partnerOrderId"),
                     session.getAttribute("deliveryZipcode"), session.getAttribute("deliveryAddress"), session.getAttribute("deliveryMemo"));

            OrdersDTO orderDTO = new OrdersDTO();
            orderDTO.setCustomer_id(loginCustomer.getId());
            orderDTO.setTotal_price((Integer) session.getAttribute("totalPrice"));
            orderDTO.setTotal_quantity((Integer) session.getAttribute("quantity"));
            orderDTO.setPartner_order_id((String) session.getAttribute("partnerOrderId"));
            orderDTO.setDelivery_zipcode((String) session.getAttribute("deliveryZipcode"));
            orderDTO.setDelivery_address((String) session.getAttribute("deliveryAddress"));
            orderDTO.setDelivery_memo((String) session.getAttribute("deliveryMemo"));

            OrderItemDTO orderItemDTO = new OrderItemDTO();
            orderItemDTO.setProduct_id((Integer) session.getAttribute("productId"));
            orderItemDTO.setQuantity((Integer) session.getAttribute("quantity"));
            orderItemDTO.setSale_price((Integer) session.getAttribute("totalPrice") / (Integer) session.getAttribute("quantity"));

            List<OrderItemDTO> orderItems = new ArrayList<>();
            orderItems.add(orderItemDTO);

            checkoutService.createOrder(orderDTO, orderItems);

            session.removeAttribute("partnerOrderId");
            session.removeAttribute("partnerUserId");
            session.removeAttribute("totalPrice");
            session.removeAttribute("quantity");
            session.removeAttribute("productId");
            session.removeAttribute("deliveryZipcode");
            session.removeAttribute("deliveryAddress");
            session.removeAttribute("deliveryMemo");

        } else {
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
