package com.kiosk.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kiosk.service.MemberService;

@Controller
@RequestMapping("/managerPage/*")
public class MemberController {
	
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
		
	private static final String FILE_PATH ="d:\\javastudy\\jspupload";
	
	@Inject
	MemberService service;
	
	// 회원관리 페이지
	@GetMapping("memberControl")
	public String member(Model model, HttpSession session) throws Exception{
		
		return "managerPage/memberControl";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	//========================================아래는 페이지 이동용============================================
	// 탈퇴회원 관리 페이지
	@GetMapping("deleteMemberControl")
	public String deleteMember(Model model, HttpSession session) throws Exception{
		
		return "managerPage/deleteMemberControl";
	}
	
	// 당일 매출 관리 페이지
	@GetMapping("salesToday")
	public String salesToday(Model model, HttpSession session) throws Exception{
			
		return "managerPage/salesToday";
	}	
	
	// 이전 매출 관리 페이지
	@GetMapping("salesPast")
	public String salesPast(Model model, HttpSession session) throws Exception{
			
		return "managerPage/salesPast";
	}
	
	// 메뉴 관리 페이지
	@GetMapping("menuControl")
	public String menu(Model model, HttpSession session) throws Exception{
			
		return "managerPage/menuControl";
	}
	
	// 이전 매출 관리 페이지
	@GetMapping("idControl")
	public String managerId(Model model, HttpSession session) throws Exception{
			
		return "managerPage/idControl";
	}
}
