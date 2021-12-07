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
import com.kiosk.vo.PaymentVo;

@Controller
public class PosOrderListController {

	private static final Logger logger = LoggerFactory.getLogger(PosOrderListController.class);

	@Inject
	private PosOrderListService posOrderListService;

	@RequestMapping(value = "/pos/orderList", method = RequestMethod.GET)
	public String orderList(Model model, HttpSession session, RedirectAttributes rttr) {
		logger.info("orderList 기본 경로 요청");

		ManagerVo loginCheck = (ManagerVo) session.getAttribute("login");

		if (loginCheck == null) {
			rttr.addFlashAttribute("orderListLogin", false);
			return "redirect:/pos/main";
		}

		List<OrderListVo> notProvidedOrder = posOrderListService.notProvidedOrder();

		if (notProvidedOrder.isEmpty()) {
			logger.info("notProvidedOrder : null");
			model.addAttribute("notProvidedOrder", null);
		} else {
			logger.info(notProvidedOrder.toString());
			model.addAttribute("notProvidedOrder", notProvidedOrder);
		}

		return "/pos/orderList";
	}

	@RequestMapping(value = "/pos/orderList/provided", method = RequestMethod.GET)
	public String menuProvided(int orderNum, RedirectAttributes rttr) {
		logger.info("menuProvided메서드 orderNum확인", orderNum);

		boolean result = posOrderListService.menuProvided(orderNum);

		if (result == false) {
			rttr.addFlashAttribute("providedResult", false);
		} else {
			rttr.addFlashAttribute("providedResult", true);
		}
		return "redirect:/pos/orderList";
	}

	@RequestMapping(value = "/pos/orderList/refund", method = RequestMethod.GET)
	public String menuRefund(int orderNum, RedirectAttributes rttr) {
		/*
		 * 1. payment테이블 refund : N -> Y update 
		 * 2. refund테이블 insert : payment테이블에서 정보 가져와서 사용하기 
		 *	 - 1번이 성공했을 경우 2번 실행 
		 *	 - orderNum으로 payment테이블에서 정보가져오기 
		 *	 - 가져온 payment테이블 정보를 사용해 refund테이블에 입력하기
		 */
		logger.info("menuRefund메서드 orderNum확인 : " + orderNum);

		boolean payRefundResult = posOrderListService.menuRefund(orderNum);

		if (payRefundResult == false) {
			// payment 테이블의 refund 칼럼 update실패
			rttr.addFlashAttribute("payRefundResult", false);
		} else {
			// payment 테이블의 refund 칼럼 update성공
			PaymentVo paymentVo = posOrderListService.selectPayment(orderNum);
			logger.info(paymentVo.toString());
			boolean insertRefundResult = posOrderListService.insertRefund(paymentVo);
			if(insertRefundResult == false) {
				rttr.addFlashAttribute("insertRefundResult", false);
			} else {
				rttr.addFlashAttribute("insertRefundResult", true);
			}
			rttr.addFlashAttribute("payRefundResult", true);
		}

		return "redirect:/pos/orderList";
	}

}
