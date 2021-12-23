package com.kiosk.controller;

import java.util.Collections;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kiosk.service.MemberService;
import com.kiosk.HSvo.MemberVo;

@Controller
@RequestMapping("/managerPage/*")
public class MemberController {
	
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
		
	private static final String FILE_PATH ="d:\\javastudy\\jspupload";
	
	@Inject
	MemberService service;
	
	// 회원관리 페이지
	@RequestMapping("memberControl")
	public String member(@RequestParam(name="pageNum", required=false, defaultValue="0")int pageNum, 
			@RequestParam(name="backNumber", required=false, defaultValue="")String backNumber
			, Model model, HttpSession session) throws Exception{
		if (pageNum == 0) {
			pageNum = 1;
		}
		if (backNumber == "" || backNumber == null) {
			backNumber = "";
		}
		int pageSize = 10;
		int currentPage = pageNum;
		
		String startRow = Integer.toString((currentPage - 1) * pageSize + 1);
		String endRow = Integer.toString(currentPage * pageSize);
		int count = 0;
		int number = 0;
		List<MemberVo> memberList = null;
		count = service.memberCount(backNumber);
		
		if(count > 0) {
			memberList = service.list(backNumber, startRow, endRow);
		} else {
			memberList = Collections.emptyList();
		}
		number = 1;
		if (currentPage >= 2) {
		number = (currentPage - 1) * 10 + 1;
		}
		
		model.addAttribute("currentPage",new Integer(currentPage));
		model.addAttribute("startRow",new Integer(startRow));
		model.addAttribute("endRow",new Integer(endRow));
		model.addAttribute("count",new Integer(count));
		model.addAttribute("pageSize",new Integer(pageSize));
		model.addAttribute("number",new Integer(number));
		model.addAttribute("memberList",memberList);
		
		session.setAttribute("pageNum", pageNum);
		
		return "managerPage/memberControl";
	}
	
	// 회원 탈퇴
	@PostMapping("deleteMember")
	public String deleteMember(HttpSession session, HttpServletRequest request) {
		
		String[] ajaxMsg = request.getParameterValues("valueArr");
		for (int i = 0 ; i < ajaxMsg.length; i++) {
			MemberVo vo = service.member(Integer.parseInt(ajaxMsg[i]));
			service.insertQuitMember(vo);
			service.delete(ajaxMsg[i]);
		}
		
		return "redirect:memberControl";
	}
	
	// 회원 정보 수정
	@PostMapping("updateMember")
	public String updateMember(HttpSession session, HttpServletRequest request) {
		
		String num = request.getParameter("num");
		String phone = request.getParameter("phone");
		String name = request.getParameter("name");
		
		MemberVo vo = new MemberVo();
		vo.setNum(Integer.parseInt(num));
		vo.setPhone(phone);
		vo.setName(name);

		service.updateMember(vo);
		
		return "redirect:memberControl";
	}
	
	// 탈퇴 회원관리 페이지
	@RequestMapping("deleteMemberControl")
	public String quitMember(@RequestParam(name="pageNum", required=false, defaultValue="0")int pageNum, 
			@RequestParam(name="backNumber", required=false, defaultValue="")String backNumber
			, Model model, HttpSession session) throws Exception{
		
		if (pageNum == 0) {
			pageNum = 1;
		}
		if (backNumber == "" || backNumber == null) {
			backNumber = "";
		}
		int pageSize = 10;
		int currentPage = pageNum;
		
		String startRow = Integer.toString((currentPage - 1) * pageSize + 1);
		String endRow = Integer.toString(currentPage * pageSize);
		int count = 0;
		int number = 0;
		List<MemberVo> quitMemberList = null;
		count = service.quitMemberCount(backNumber);
		
		if(count > 0) {
			quitMemberList = service.quitMemberList(backNumber, startRow, endRow);
		} else {
			quitMemberList = Collections.emptyList();
		}
		number = 1;
		if (currentPage >= 2) {
		number = (currentPage - 1) * 10 + 1;
		}
		
		model.addAttribute("currentPage",new Integer(currentPage));
		model.addAttribute("startRow",new Integer(startRow));
		model.addAttribute("endRow",new Integer(endRow));
		model.addAttribute("count",new Integer(count));
		model.addAttribute("pageSize",new Integer(pageSize));
		model.addAttribute("number",new Integer(number));
		model.addAttribute("quitMemberList",quitMemberList);
		
		session.setAttribute("pageNum", pageNum);
		
		return "managerPage/deleteMemberControl";
	}
	
	// 탈퇴회원 복구
	@PostMapping("restoreMember")
	public String restoreMember(HttpSession session, HttpServletRequest request) {
		
		String[] ajaxMsg = request.getParameterValues("valueArr");
		for (int i = 0 ; i < ajaxMsg.length; i++) {
			MemberVo vo = service.quitMember(Integer.parseInt(ajaxMsg[i]));
			service.insertRestoreMember(vo);
			service.quitMemberDelete(ajaxMsg[i]);
		}
		
		return "redirect:deleteMemberControl";
	}
	
	// 탈퇴회원 영구 삭제
	@PostMapping("deleteQuitMember")
	public String deleteQuitMember(HttpSession session, HttpServletRequest request) {
		
		String[] ajaxMsg = request.getParameterValues("valueArr");
		for (int i = 0 ; i < ajaxMsg.length; i++) {
			service.quitMemberDelete(ajaxMsg[i]);
		}
		
		return "redirect:deleteMemberControl";
	}
	
	// 탈퇴회원 정보 수정
	@PostMapping("updateQuitMember")
	public String updateQuitMember(HttpSession session, HttpServletRequest request) {
		
		String num = request.getParameter("num");
		String phone = request.getParameter("phone");
		String name = request.getParameter("name");
		
		MemberVo vo = new MemberVo();
		vo.setNum(Integer.parseInt(num));
		vo.setPhone(phone);
		vo.setName(name);

		service.updateQuitMember(vo);
		
		return "redirect:deleteMemberControl";
	}
	
	//========================================아래는 페이지 이동용============================================
	
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
	
}
