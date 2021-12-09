package com.kiosk.controller;

import java.util.Map;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kiosk.service.PosMenuOrderService;
import com.kiosk.vo.MemberVo;

@Controller
public class PosMenuOrderController {
	
	private static final Logger logger = LoggerFactory.getLogger(PosMenuOrderController.class);
	
	@Inject
	private PosMenuOrderService posMenuOrderService;
	
	@RequestMapping(value = "/pos/menuOrder", method = RequestMethod.GET)
	public String menuOrder() {
		logger.info("menuOrder 요청");
		return "/pos/menuOrder";
	}
	
	@RequestMapping(value = "/pos/menuOrder/pointCheck", method = RequestMethod.GET)
	public String menuOrederPoint() {
		logger.info("point 조회 페이지 GET 요청");
		return "/pos/pointCheck";
	}

	@RequestMapping(value = "/pos/menuOrder/pointCheck", method = RequestMethod.POST)
	public String memberPointCheck(String phoneNum, Model model) {
		logger.info("point 조회 POST 요청 및 point 조회 결과 페이지 요청");
		
		// 회원 전화번호로 DB조회
		logger.info("pointCheck POST요청 받은 phoneNum : " + phoneNum);
		Map<String, MemberVo> memberPointCheck =  posMenuOrderService.pointCheck(phoneNum);
		model.addAttribute("memberPointCheck", memberPointCheck.get("pointCheck"));
		return "/pos/pointResult";
	}
	
	
}
