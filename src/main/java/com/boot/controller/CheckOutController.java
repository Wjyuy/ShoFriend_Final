package com.boot.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.boot.dto.CustomerDTO;
import com.boot.service.ProductService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class CheckOutController {
	@Autowired
    private ProductService service;
	
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
}
