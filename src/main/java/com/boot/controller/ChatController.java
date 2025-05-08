package com.boot.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class ChatController {

	@GetMapping("/chat/test")
	public String chatTestPage(HttpSession session) {
		log.info("@# chat_test_A()");
		
		session.setAttribute("loginId", "userA"); // 임시 로그인
		
		return "chat/chat_test"; // /WEB-INF/views/chat/chat_test.jsp
	}
	
	@GetMapping("/chat/test-b")
	public String chatTestBPage(HttpSession session) {
		log.info("@# chat_test_B()");
		
		session.setAttribute("loginId", "userB"); // 임시 로그인
		
		return "chat/chat_test_b";
	}

}
