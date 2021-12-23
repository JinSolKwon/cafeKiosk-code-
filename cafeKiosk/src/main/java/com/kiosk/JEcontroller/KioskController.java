package com.kiosk.JEcontroller;

import java.util.regex.Pattern;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kiosk.JEservice.IKioskService;
import com.kiosk.HSvo.MemberVo;

@Controller
@RequestMapping(value="/kiosk/")
public class KioskController {

	@Autowired
	private IKioskService kioskService;
	
	@RequestMapping(value="main")
	String mainPage(HttpSession session) {
		session.invalidate();
		return "kiosk/main";
	}
	
	@RequestMapping(value="regist", method=RequestMethod.GET)
	String regist() {
		return "kiosk/registForm";
	}
	
	@RequestMapping(value="regist", method=RequestMethod.POST)
	String registPost(MemberVo member, String month, String day, RedirectAttributes rttr, HttpSession session) throws Exception {
		String namePattern = "^[ㄱ-ㅎ가-힣a-zA-Z]*$";
		if(member.getName() == null || member.getName() == "" || member.getBirthYear() == "" || month == "" || day == "") {
			rttr.addFlashAttribute("member", member);			
			rttr.addFlashAttribute("month", month);
			rttr.addFlashAttribute("day", day);		
			rttr.addFlashAttribute("check", "입력하지 않은 정보가 존재합니다.");
			rttr.addFlashAttribute("next", "next");
			return "redirect:/kiosk/regist";
		}else if(!(Pattern.matches(namePattern, member.getName()))){
			rttr.addFlashAttribute("member", member);			
			rttr.addFlashAttribute("month", month);
			rttr.addFlashAttribute("day", day);		
			rttr.addFlashAttribute("check", "이름을 알맞게 입력해주세요.");
			rttr.addFlashAttribute("next", "next");		
			return "redirect:/kiosk/regist";
		}else {
			if(month.length() <2) month = "0"+month;
			if(day.length() <2) day = "0"+day;
			member.setBirth(month + day);
			kioskService.registMember(member);
			MemberVo exist = kioskService.checkPhoneNumber(member.getPhone());
			session.setAttribute("member", exist);
			rttr.addFlashAttribute("success", "hello");			
			return "redirect:/kiosk/order";
		}
	}
	
	@RequestMapping(value="phoneCheck", method=RequestMethod.POST)
	String registCheck(MemberVo member, String month, String day, RedirectAttributes rttr) throws Exception {
		String phonePattern = "^01(?:0|1|[6-9])-(?:\\d{3}|\\d{4})-\\d{4}$";
		if(member.getPhone() == null || member.getPhone().length()!=13 || !(Pattern.matches(phonePattern, member.getPhone()))) {
			rttr.addFlashAttribute("check", "번호를 알맞게 입력해주세요.");
			return "redirect:/kiosk/regist";			
		}
		MemberVo exist = kioskService.checkPhoneNumber(member.getPhone());
		if(exist != null) {
			rttr.addFlashAttribute("check", "이미 등록된 번호입니다.");
			return "redirect:/kiosk/regist";
		}
			rttr.addFlashAttribute("checkOK", "noexist");
			rttr.addFlashAttribute("member", member);
			rttr.addFlashAttribute("month", month);
			rttr.addFlashAttribute("day", day);
			rttr.addFlashAttribute("next", "next");
			return "redirect:/kiosk/regist";
	}
	
	
	@RequestMapping(value="login", method=RequestMethod.GET)
	String login(String phone) {
		return "kiosk/loginForm";
	}
	
	@RequestMapping(value="login", method=RequestMethod.POST)
	String login(String phone, HttpSession session, RedirectAttributes rttr) throws Exception {
		String phonePattern = "^01(?:0|1|[6-9])-(?:\\d{3}|\\d{4})-\\d{4}$";
		if(phone.equals(null) || phone == "" || phone.isEmpty() || phone.length()!=13 || !(Pattern.matches(phonePattern, phone))) {
			return "redirect:/kiosk/login";
		}
		MemberVo exist = kioskService.checkPhoneNumber(phone);
		if(exist == null) {
			rttr.addFlashAttribute("fail", "no");
			return "redirect:/kiosk/login";
		}
		session.setAttribute("member", exist);
		rttr.addFlashAttribute("success", "hello");
		return "redirect:/kiosk/order";
	}
	
}
