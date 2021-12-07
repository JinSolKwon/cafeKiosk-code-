package com.kiosk.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kiosk.service.PosOrderListService;
import com.kiosk.vo.ManagerVo;
import com.kiosk.vo.OrderListVo;

@Controller
public class PosOrderListController {
	
	private static final Logger logger = LoggerFactory.getLogger(PosOrderListController.class);
	
	@Inject
	private PosOrderListService posOrderListService;
	
	@RequestMapping(value = "/pos/orderList", method = RequestMethod.GET)
	public String orderList(Model model, HttpSession session, RedirectAttributes rttr) {
		logger.info("orderList 기본 경로 요청");
		
		// order_list 테이블, payment 테이블에 있는 정보 가져와야됨
		// order_list : 모든 칼럼
		// payment : 제공여부
		// 바티스에서 조인으로 조건만 잡아주면 가능?
		
		ManagerVo loginCheck = (ManagerVo) session.getAttribute("login");
		
		if(loginCheck == null) {
			rttr.addFlashAttribute("orderListLogin", false);
			return "redirect:/pos/main";
		}
		
		List<OrderListVo> notProvidedOrder =  posOrderListService.notProvidedOrder();
		
		if(notProvidedOrder.isEmpty()) {
			logger.info("notProvidedOrder : null");
			model.addAttribute("notProvidedOrder", null);
		} else {
			logger.info(notProvidedOrder.toString());
			model.addAttribute("notProvidedOrder", notProvidedOrder);
		}
		
		return "/pos/orderList";
	}
	
}
