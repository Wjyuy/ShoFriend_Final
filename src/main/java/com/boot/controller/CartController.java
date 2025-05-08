package com.boot.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.boot.dto.CartDTO;
import com.boot.dto.CustomerDTO;
import com.boot.dto.OrdersDTO;
import com.boot.dto.ProductDTO;
import com.boot.service.CartService;
import com.boot.service.OrdersService;
import com.fasterxml.jackson.annotation.JsonCreator.Mode;
import com.mysql.cj.Session;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class CartController {


	@Autowired
	private CartService service;

	@RequestMapping(value = "/addToCart", method = RequestMethod.POST)
	public String addToCart(@RequestParam("product_id") int product_id,
							@RequestParam("product_title") String product_title,
							@RequestParam("price") int price,
							@RequestParam("quantity") int quantity,
							HttpSession session,
							RedirectAttributes redirectAttributes) {
		log.info("addToCart()");

		
		CustomerDTO customer = (CustomerDTO) session.getAttribute("loginCustomer");
	    if (customer == null) {
	    	redirectAttributes.addFlashAttribute("msg", "로그인후 이용해 주세요 😭");
	    	return "redirect:log/login";
	    }
	    

	    log.info("getId", customer.getId());

		
	    HashMap<String, Object> param = new HashMap<>();
	    param.put("user_id", customer.getId());
	    param.put("product_id", product_id);
	    param.put("product_title", product_title);
	    param.put("price", price);
	    param.put("quantity", quantity);
		service.addToCart(param);
		return "redirect:cart_view";
	}
	
	@RequestMapping("/cart_view")
	public String viewCart(HttpSession session, Model model){
		CustomerDTO customer = (CustomerDTO) session.getAttribute("loginCustomer");
		log.info("@# cart_view()");
		
		if (customer == null) {
			return "redirect:login";
		}
		HashMap<String, String> param = new HashMap<String, String>();
		param.put("user_id", String.valueOf(customer.getId()));

		List<CartDTO> items = service.getCartItems(param);
		model.addAttribute("items", items);
		
		

		

		return "cart_view";
	}

}
