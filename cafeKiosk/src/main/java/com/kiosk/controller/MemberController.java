package com.kiosk.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
	String mainPage() {
		return "user/main";
	}
	
	@RequestMapping(value="regist", method=RequestMethod.GET)
	String regist() {
		return "user/registForm";
	}
	
	@RequestMapping(value="regist", method=RequestMethod.POST)
	String registPost(MemberVo member, Model model) throws Exception {
		MemberVo exist = memberService.checkPhoneNumber(member.getPhone());
		if(!exist.equals(null)) {
			
		}
		memberService.checkPhoneNumber(member.getPhone());
		memberService.registMember(member);
		return "user/registForm";
	}
	
	@RequestMapping(value="phoneCheck")
	String registCheck(MemberVo member, Model model) throws Exception {
		MemberVo exist = memberService.checkPhoneNumber(member.getPhone());
		if(!exist.equals(null)) {
			
		}
		memberService.checkPhoneNumber(member.getPhone());
		memberService.registMember(member);
		return "user/registForm";
	}
	
	
	@RequestMapping(value="login", method=RequestMethod.GET)
	String login(String phone) {
		return "user/loginForm";
	}
	
	@RequestMapping(value="login", method=RequestMethod.POST)
	String login(String phone, HttpSession session, RedirectAttributes rttr) throws Exception {
		if(phone.equals(null) || phone == "" || phone.isEmpty() || phone.length() < 11) {
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
	
	@RequestMapping(value="order", method=RequestMethod.GET)
	String order(HttpSession session, RedirectAttributes rttr) {
		
		return "user/orderForm";
	}
}
