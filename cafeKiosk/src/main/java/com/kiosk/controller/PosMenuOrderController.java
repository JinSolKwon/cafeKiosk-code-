package com.kiosk.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kiosk.command.CancelCmd;
import com.kiosk.command.MenuOrderCmd;
import com.kiosk.service.PosMenuOrderService;
import com.kiosk.vo.CategoryVo;
import com.kiosk.vo.MemberVo;
import com.kiosk.vo.MenuVo;
import com.kiosk.vo.OptionListVo;

@Controller
public class PosMenuOrderController {
	
	private static final Logger logger = LoggerFactory.getLogger(PosMenuOrderController.class);
	
	@Inject
	private PosMenuOrderService posMenuOrderService;
	
	@RequestMapping(value = "/pos/menuOrder", method = RequestMethod.GET)
	public String menuOrder(Model model, String categoryNum, HttpSession session) throws Exception {
		logger.info("menuOrder 요청");
		
		// 카테고리 내용 보여줘야됨
		List<CategoryVo> categoryList = posMenuOrderService.getCategory();

		/*
		 * 조건1 : 페이지 최초 접근
		 * - categoryNum == null && session.getAttribute("categoryNum") == null
		 * - 이때는 DB에서 category테이블에서 제일 작은 수 가져와서 categoryNum에 넣어주고 그거로 menu테이블에서 조회
		 * 조건2 : 결제하기페이지를 갔다가 다시 돌아오는 경우
		 * - categoryNum == null && session.getAttribute("categoryNum") != null
		 * - 이때는 category = session.getAttribute("categoryNum") 해줘서 그거로 menu테이블에서 조회
		 * 조건3 : 카테고리 번호가 넘어올 때
		 * - categoryNum != null
		 * - 바로 menu테이블에서 조회
		 * 
		 * 모든 조건에서 categoryNum을 session에 넣어줘야됨
		 * 모든결제가 완료됐을경우, 취소하기를 눌러 저장된 주문내역을 삭제할 경우 categoryNum session을 삭제
		 * 
		 */
		
		if(!categoryList.isEmpty()) {
			model.addAttribute("categoryList", categoryList);
			if(categoryNum == null) {
				if(session.getAttribute("categoryNum") == null) {
					categoryNum = String.valueOf(categoryList.get(0).getNum());
				} else {
					categoryNum = (String)session.getAttribute("categoryNum");
				}
			} //categoryNum == null

			session.setAttribute("categoryNum", categoryNum);
			
			List<MenuVo> menuList = posMenuOrderService.selectMenuList(categoryNum);
			if(menuList.isEmpty()) {
				model.addAttribute("menuList", null);
			} else {
				model.addAttribute("menuList", menuList);
			}
			
		} else {
			model.addAttribute("categoryList", null);
		} // !categoryList.isEmpty()
		
		// 옵션 리스트 DB에서 가져오기
		List<OptionListVo> optionList = posMenuOrderService.selectOptionList();
		model.addAttribute("optionList", optionList);
		
		return "/pos/menuOrder";
	}
	
	@RequestMapping(value = "/pos/menuOrder/order", method = RequestMethod.GET)
	public String order(MenuOrderCmd menuOrderCmd, HttpSession session) {
		
		/*
		 * 옵션선택을 했을 때 2가지 경우를 생각해야됨
		 * 1.메뉴를 주문했을 때 옵션을 선택하면 어떻게 묶어줄 것인지, 
		 * 예를들어 아메리카노를 선택하면 아메리카노가 주문상품에 올라오고
		 * 옵션을 누르면 옵션도 따로 주문상품에 올라오게되서
		 * 하나로 묶어주는 작업이 필요할듯
		 * 2.옵션만 따로 주문했을 때 메뉴명 등 주문테이블에 들어가는 형태를 어떻게 잡아줄 것인지
		 */
		
		logger.info("주문내역 발생");
		
		// List에 주문된 메뉴를 계속 담아줘야함
		List<MenuOrderCmd> menuOrderList = new ArrayList<MenuOrderCmd>();
		Map<String, Integer> paymentInfo = new HashMap<String, Integer>();
		int totalCnt = 0;
		int totalPrice = 0;
		
		if(session.getAttribute("menuOrderList") != null) {
			menuOrderList = (List<MenuOrderCmd>) session.getAttribute("menuOrderList");
		}
		menuOrderList.add(menuOrderCmd);
		session.setAttribute("menuOrderList", menuOrderList);
		
		totalCnt = menuOrderList.size();
		for(int i = 0; i < menuOrderList.size(); i++) {
			totalPrice += menuOrderList.get(i).getPrice();
		}
		
		logger.info("주문 수량" + totalCnt);
		logger.info("총금액" + totalPrice);
		
		paymentInfo.put("totalCnt", totalCnt);
		paymentInfo.put("totalPrice", totalPrice);
		session.setAttribute("paymentInfo", paymentInfo);
		
		return "redirect:/pos/menuOrder";
	}
	
	@RequestMapping(value = "/pos/menuOrder/cancel", method = RequestMethod.GET)
	public String orderCancel(HttpSession session, CancelCmd cancelCmd) {
		
		if(cancelCmd.getType().equals("all")) {
			logger.info("주문내역 전체 취소");
			session.removeAttribute("categoryNum");
			session.removeAttribute("menuOrderList");
			session.removeAttribute("paymentInfo");
		} else if(cancelCmd.getType().equals("single")) {
			logger.info("주문내역 단일 취소");
			List<MenuOrderCmd> menuOrderList = (List<MenuOrderCmd>) session.getAttribute("menuOrderList");
			Map<String, Integer> paymentInfo = (Map<String, Integer>) session.getAttribute("paymentInfo");
			
			int totalCnt = paymentInfo.get("totalCnt");
			paymentInfo.put("totalCnt", --totalCnt);

			int totalPrice = paymentInfo.get("totalPrice");
			int cancelPrice = menuOrderList.get(cancelCmd.getIndex()).getPrice();
			totalPrice -= cancelPrice;
			paymentInfo.put("totalPrice", totalPrice);
			
			session.setAttribute("paymentInfo", paymentInfo);
			
			menuOrderList.remove(cancelCmd.getIndex());
			session.setAttribute("menuOrderList", menuOrderList);
		} else {
			logger.info("주문내역 취소 오류");
		}
		
		return "redirect:/pos/menuOrder";
	}
	
	@RequestMapping(value = "/pos/menuOrder/details", method = RequestMethod.GET)
	public String orderDetails(HttpSession session) {
		logger.info("orderDetails페이지 get요청");
		
		Date date = new Date();
		SimpleDateFormat fmtToday = new SimpleDateFormat("yyyyMMdd");
		String today = fmtToday.format(date);
		
		int orderNum = 0;
		String maxOrderNum = posMenuOrderService.getMaxOrderNum(today);
		if(maxOrderNum == null) {
			orderNum = 1;
		} else {
			orderNum = Integer.parseInt(maxOrderNum) + 1; 
		}
		
		session.setAttribute("orderNum", orderNum);
		
		return "/pos/orderDetails";
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
