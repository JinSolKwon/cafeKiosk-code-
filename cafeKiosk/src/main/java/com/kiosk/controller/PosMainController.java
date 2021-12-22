package com.kiosk.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kiosk.service.PosMainService;
import com.kiosk.vo.ManagerVo;

@Controller
public class PosMainController {
	
	private static final Logger logger = LoggerFactory.getLogger(PosMainController.class);
	
	@Inject
	private PosMainService posMainService;
	
	@RequestMapping(value = "/pos", method = RequestMethod.GET)
	public String pos() {
		logger.info("pos 메인으로 redirect요청");
		return "redirect:/pos/main";
	}
	
	@RequestMapping(value = "/pos/main", method = RequestMethod.GET)
	public String posMain(HttpSession session) {
		logger.info("pos 메인 요청 : 관리자 로그인 페이지");
		
		session.removeAttribute("categoryNum");
		session.removeAttribute("menuOrderList");
		session.removeAttribute("paymentInfo");
		
		ManagerVo loginCheck = (ManagerVo) session.getAttribute("login");
		
		if(loginCheck == null) {
			logger.info("pos get요청 시 로그인된 정보가 없음");
			
			return "/pos/posMain";
		} else {
			logger.info("pos get요청 시 로그인된 정보가 있음");
			return "redirect:/pos/orderList";
		}
		
	}
	
	@RequestMapping(value = "/pos/main", method = RequestMethod.POST)
	public String posLogin(ManagerVo managerVo, HttpSession session, RedirectAttributes rttr) {
		
		// 로그인 과정 복호화작업 추가해야됨
		
		logger.info("관리자 로그인 페이지 POST요청");
		
		if(managerVo != null) {
			System.out.println("post요청 시 manager : " + managerVo.toString());
		}
		
		ManagerVo login = posMainService.managerLogin(managerVo);
		
		if(login != null) {
			session.setAttribute("login", login);
			return "redirect:/pos/orderList";
		} else {
			rttr.addFlashAttribute("msg", false);
			return "redirect:/pos/main";
		}
	}
	
	@RequestMapping(value = "/pos/logout", method = RequestMethod.GET)
	public String posLogout(HttpSession session) {
		session.invalidate();
		return "redirect:/pos/main";
	}
	
	// 에러페이지 설정
	@RequestMapping(value= "/pageError", method = RequestMethod.GET)
	public String error(HttpServletRequest request, Model model) {
		
		int errorCode = (int) request.getAttribute("javax.servlet.error.status_code");
		String errorExceptionType = (String) request.getAttribute("javax.servlet.error.exception_type");
		String errorMsg = (String) request.getAttribute("javax.servlet.error.message");
		String errorRequestUri = (String) request.getAttribute("javax.servlet.error.request_uri");
		String errorException = (String) request.getAttribute("javax.servlet.error.exception");
		String errorServletName = (String) request.getAttribute("javax.servlet.error.servlet_name");
		
		logger.info("#####error");
		logger.info("status_code : " + errorCode);
		logger.info("exception_type : " + errorExceptionType);
		logger.info("message : " + errorMsg);
		logger.info("request_uri : " + errorRequestUri);
		logger.info("exception : " + errorException);
		logger.info("servlet_name : " + errorServletName);
		
		model.addAttribute("errorCode", errorCode);
		
		return "/error/errorPage";
	}
}
