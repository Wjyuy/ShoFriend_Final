package com.boot.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.boot.dto.MemDTO;
import com.boot.service.MemService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class MemController {
	@Autowired
	private MemService service;
	
	@RequestMapping("/login")
	public String login() {
		log.info("@# login()");
		
		return "login";
	}
	
	@RequestMapping("/login_yn")
	public String loginYn(@RequestParam HashMap<String, String> param, HttpServletRequest request) {
		log.info("@# loginYn()");
		
		ArrayList<MemDTO> dtos = service.loginYn(param);
		
		if (dtos.isEmpty()) {
			return "redirect:login";
		} else {
//			if (request.getParameter("mem_pwd").equals(dtos.get(0).getMem_pwd())) {
			if (param.get("mem_pwd").equals(dtos.get(0).getMem_pwd())) {
				request.getSession().setAttribute("loginMember", dtos.get(0));
				return "redirect:login_ok";
			}
			return "redirect:login";
		}
	}
	
	@RequestMapping("/login_ok")
	public String login_ok() {
		log.info("@# login_ok()");
		
		return "login_ok";
	}
	
	@RequestMapping("/register")
	public String register() {
		log.info("@# register()");
		
		return "register";
	}
	
	@RequestMapping("/registerOk")
	public String registerOk(@RequestParam HashMap<String, String> param) {
		log.info("@# registerOk()");

		service.write(param);
		
		return "redirect:login";
	}
	
	
//	내가 추가하는 부분
	@RequestMapping("/member_info")
	public String memberInfo() {
	    log.info("@# memberInfo()");
	    return "member_info";  // member_info.jsp로 이동
	}
	
	@RequestMapping("/main")
	public String main() {
		return "main"; // main.jsp 는 WEB-INF/views/main.jsp 에 있어야 함
	}
	
	@RequestMapping("/change_pwd")
	public String changePwd() {
	    return "change_pwd";
	}
	
	@RequestMapping("/changePwdOk")
	public String changePwdOk(@RequestParam("new_pwd") String newPwd, HttpSession session) {
	    MemDTO loginMember = (MemDTO) session.getAttribute("loginMember");

	    if (loginMember != null) {
	        HashMap<String, String> param = new HashMap<String, String>();
	        param.put("mem_uid", loginMember.getMem_uid());
	        param.put("new_pwd", newPwd);

	        service.updatePwd(param);
	        loginMember.setMem_pwd(newPwd); // 세션도 업데이트
	        return "redirect:member_info";
	    } else {
	        return "redirect:login";
	    }
	}
	
	@RequestMapping("/logout")
	public String logout(HttpSession session) {
	    session.invalidate();  // 현재 로그인된 세션 모두 삭제
	    return "redirect:login";  // 로그인 페이지로 이동
	}
}









