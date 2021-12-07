package com.kiosk.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kiosk.service.IMemberService;
import com.kiosk.vo.MemberVo;

@Controller
@RequestMapping(value="/cafeCarp/")
public class MemberController {

	@Autowired
	private IMemberService memberService;
	
	@RequestMapping(value="main")
	String mainPage(HttpSession session) {
		session.invalidate();
		return "user/main";
	}
	
	@RequestMapping(value="regist", method=RequestMethod.GET)
	String regist() {
		return "user/registForm";
	}
	
	@RequestMapping(value="regist", method=RequestMethod.POST)
	String registPost(MemberVo member, String month, String day, RedirectAttributes rttr, HttpSession session) throws Exception {
		if(member.getName() == null || member.getName() == "" || member.getBirthYear() == "" || month == "" || day == "") {
			rttr.addFlashAttribute("member", member);			
			rttr.addFlashAttribute("month", month);
			rttr.addFlashAttribute("day", day);		
			rttr.addFlashAttribute("check", "입력하지 않은 정보가 존재합니다.");
			rttr.addFlashAttribute("next", "next");
			return "redirect:/cafeCarp/regist";
		}else {
			if(month.length() <2) month = "0"+month;
			if(day.length() <2) day = "0"+day;
			member.setBirth(month + day);
			memberService.registMember(member);
			MemberVo exist = memberService.checkPhoneNumber(member.getPhone());
			session.setAttribute("member", exist);
			rttr.addFlashAttribute("success", "hello");			
			return "redirect:/cafeCarp/order";
		}
	}
	
	@RequestMapping(value="phoneCheck", method=RequestMethod.POST)
	String registCheck(MemberVo member, String month, String day, RedirectAttributes rttr) throws Exception {
		if(member.getPhone() == null || member.getPhone().length()!=11) {
			rttr.addFlashAttribute("check", "번호를 알맞게 입력해주세요.");
			return "redirect:/cafeCarp/regist";			
		}
		MemberVo exist = memberService.checkPhoneNumber(member.getPhone());
		if(exist != null) {
			rttr.addFlashAttribute("check", "이미 등록된 번호입니다.");
			return "redirect:/cafeCarp/regist";
		}
			rttr.addFlashAttribute("checkOK", "noexist");
			rttr.addFlashAttribute("member", member);
			rttr.addFlashAttribute("month", month);
			rttr.addFlashAttribute("day", day);
			rttr.addFlashAttribute("next", "next");
			return "redirect:/cafeCarp/regist";
	}
	
	
	@RequestMapping(value="login", method=RequestMethod.GET)
	String login(String phone) {
		return "user/loginForm";
	}
	
	@RequestMapping(value="login", method=RequestMethod.POST)
	String login(String phone, HttpSession session, RedirectAttributes rttr) throws Exception {
		if(phone.equals(null) || phone == "" || phone.isEmpty() || phone.length()!=11) {
			return "redirect:/cafeCarp/login";
		}
		MemberVo exist = memberService.checkPhoneNumber(phone);
		if(exist == null) {
			rttr.addFlashAttribute("fail", "no");
			return "redirect:/cafeCarp/main";
		}
		session.setAttribute("member", exist);
		rttr.addFlashAttribute("success", "hello");
		return "redirect:/cafeCarp/order";
	}
	
}
