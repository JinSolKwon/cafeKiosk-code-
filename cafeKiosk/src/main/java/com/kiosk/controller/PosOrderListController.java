package com.kiosk.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
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

import com.kiosk.command.RefundPaymentCmd;
import com.kiosk.command.RefundPointCmd;
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
		session.removeAttribute("categoryNum");
		session.removeAttribute("menuOrderList");
		session.removeAttribute("paymentInfo");
		
		Date date = new Date();
		SimpleDateFormat fmtToday = new SimpleDateFormat("yyyyMMdd");
		String today = fmtToday.format(date);
		
		List<OrderListVo> notProvidedOrder = posOrderListService.notProvidedOrder(today);

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

		logger.info("menuRefund메서드 orderNum확인 : " + orderNum);

		boolean payRefundResult = posOrderListService.menuRefund(orderNum);

		if (payRefundResult == true) {
			// payment 테이블의 refund 칼럼 update성공
			
			// orderNum하고 날짜같이 들가야함
			Date date = new Date();
			SimpleDateFormat fmtToday = new SimpleDateFormat("yyyyMMdd");
			String today = fmtToday.format(date);
			
			RefundPaymentCmd refundPaymentCmd = new RefundPaymentCmd(orderNum, today);
			
			PaymentVo paymentVo = posOrderListService.selectPayment(refundPaymentCmd);
			logger.info(paymentVo.toString());

			// 환불정보 테이블에 정보입력
			boolean insertRefundResult = posOrderListService.insertRefund(paymentVo);

			if (insertRefundResult == true) {
				rttr.addFlashAttribute("insertRefundResult", true);

				// 포인트 결제 내역있을 경우 해당 회원에게 포인트 복구
				int refundPoint = paymentVo.getPoint();
				int refundMemberNum = paymentVo.getMemberNum();

				if (refundPoint > 0) {
					// 회원 테이블에 있는 회원에게 포인트 복구
					RefundPointCmd refundPointCmd = new RefundPointCmd(refundPoint, refundMemberNum);

					// 회원번호로 update실행 후 동작 완료 여부에 따라 결과 설정
					boolean refundPointResult = posOrderListService.refundPoint(refundPointCmd);
					rttr.addFlashAttribute("refundPointResult", refundPointResult);
				}
			}
			rttr.addFlashAttribute("insertRefundResult", insertRefundResult);
		}
		rttr.addFlashAttribute("payRefundResult", payRefundResult);

		return "redirect:/pos/orderList";
	}

}
