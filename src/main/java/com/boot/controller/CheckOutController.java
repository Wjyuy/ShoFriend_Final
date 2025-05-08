package com.boot.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class CheckOutController {
	
	@RequestMapping("/checkout")
	public String checkout() {
		log.info("checkout()");

	    return "checkout";
	}
}
