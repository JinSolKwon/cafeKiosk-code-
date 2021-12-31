package com.kiosk.JEcontroller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kiosk.HSvo.CategoryVo;
import com.kiosk.HSvo.MemberVo;
import com.kiosk.JEcommand.MenuOrderCommand;
import com.kiosk.JEcommand.ReceipeResultCommand;
import com.kiosk.JEservice.IKioskService;

@Controller
@RequestMapping(value = "/kiosk/")
public class OrderController {

	private static final Logger logger = LoggerFactory.getLogger(OrderController.class);
	// logger.info(); sysout 대신

	@Autowired // @Inject
	private IKioskService kioskService;

	@RequestMapping(value = "order", method = RequestMethod.GET)
	String order(@RequestParam(value = "num", defaultValue = "0") int num, HttpSession session, Model model)
			throws Exception {
		int categoryMinNum = kioskService.categoryMinNum();
		if(num == 0) {
			num = categoryMinNum;
		}
		if (session.getAttribute("cateList") == null) {
			List<CategoryVo> cateList = kioskService.categoryList();
			session.setAttribute("cateList", cateList);
		}
		List<HashMap<String, String>> menuList = kioskService.menuList(num);
		model.addAttribute("menuList", menuList);
		if (session.getAttribute("pageNum") != null) {
			session.removeAttribute("pageNum");
		}
		session.setAttribute("pageNum", num);
		session.setAttribute("categoryNum", num-categoryMinNum);
		return "kiosk/orderForm";
	}

	@RequestMapping(value = "option")
	public String option(@RequestParam(value = "num") int num, HttpSession session, Model model) throws Exception {
		if (num == 0) {
			return "redirect:/kiosk/order";
		}
		HashMap<String, String> selectMenu = kioskService.menuOption(num);
		model.addAttribute("selectMenu", selectMenu);
		return "kiosk/optionForm";
	}

	@RequestMapping(value = "orderSet", method = RequestMethod.POST)
	public String orderSet(MenuOrderCommand moc, HttpSession session, Model model, RedirectAttributes rttr) {
		List<MenuOrderCommand> orderList = new ArrayList<>();
		int toNum = moc.getPrice();
		if (session.getAttribute("orderList") != null) {
			orderList = (List<MenuOrderCommand>) session.getAttribute("orderList");
			toNum += (Integer) session.getAttribute("orderTotal");
			session.removeAttribute("orderList");
			session.removeAttribute("orderCount");
			session.removeAttribute("orderTotal");
		}
		if (moc.getType() == 2) {
			moc.setTemperature(null);
			moc.setBeverageSize(null);
			moc.setWhipping(null);
		}
		orderList.add(moc);
		if (session.getAttribute("pageNum") != null) {
			session.removeAttribute("pageNum");
		}
		session.setAttribute("pageNum", moc.getCategoryNum());
		session.setAttribute("orderList", orderList);
		session.setAttribute("orderCount", orderList.size());
		session.setAttribute("orderTotal", toNum);
		return "redirect:/kiosk/order?num=" + moc.getCategoryNum();
	}

	@RequestMapping(value = "orderDel")
	public String orderSet(@RequestParam(value = "num") int num, HttpSession session, Model model) {
		List<MenuOrderCommand> orderList = (List<MenuOrderCommand>) session.getAttribute("orderList");
		int toNum = (Integer) session.getAttribute("orderTotal");
		int countNum = (Integer) session.getAttribute("orderCount");
		toNum -= orderList.get(num).getPrice();
		countNum -= 1;
		orderList.remove(num);
		if(toNum == 0 && countNum == 0) {
			session.removeAttribute("orderList");
			session.removeAttribute("orderTotal");
			session.removeAttribute("orderCount");
		}else {
			session.setAttribute("orderList", orderList);
			session.setAttribute("orderTotal", toNum);
			session.setAttribute("orderCount", countNum);			
		}
		int pageNum = (Integer) session.getAttribute("pageNum");
		return "redirect:/kiosk/order?num=" + pageNum;
	}

	@RequestMapping(value = "orderResult")
	public String orderSet() {
		return "kiosk/orderResultForm";
	}

	@RequestMapping(value = "scroll")
	public String scroll(@RequestParam(value = "type") String type, HttpSession session, RedirectAttributes rttr)
			throws Exception {
		int pageNum = (Integer) session.getAttribute("pageNum");
		int cateManNum = kioskService.categoryMaxNum();
		if (type.equals("N") || type == "N") {
			if (pageNum < cateManNum) {
				pageNum += 1;
				rttr.addFlashAttribute("scDis", "R");
			}
		}
		if (type.equals("A") || type == "A") {
			if (1 < pageNum) {
				pageNum -= 1;
				rttr.addFlashAttribute("scDis", "L");
			}
		}
		return "redirect:/kiosk/order?num=" + pageNum;
	}

	@RequestMapping(value = "pay")
	public String pay(@RequestParam(value = "mem") String mem, Model model, HttpSession session) {
		if (mem.equals("M")) {
			return "kiosk/point";
		} else if (mem.equals("E")) {
			model.addAttribute("countStatus", "YES");
			return "kiosk/pointCount";
		} else {
			return "redirect:/kiosk/main";
		}
	}

	@RequestMapping(value = "credit")
	public String pat2(@RequestParam(value = "cd") String cd, HttpSession session) throws Exception {
		if (cd.equals("cd")) {
			MemberVo member = (MemberVo) session.getAttribute("member");
			List<MenuOrderCommand> orderList = new ArrayList<>();
			orderList = (List<MenuOrderCommand>) session.getAttribute("orderList");
			int orderTotal = (Integer) session.getAttribute("orderTotal");
			String payWhat = (String) session.getAttribute("payWhat");
			int orderNum = kioskService.orderNumCheck();
			if (member != null) {
				int totalPayment = (Integer) session.getAttribute("totalPayment");
				// 회원 주문 저장
				kioskService.userOrder(member, orderList, orderNum);
				kioskService.userPayment(member, orderTotal, totalPayment, payWhat, orderNum);
				session.setAttribute("orderNum", orderNum);
				return "kiosk/payReceipe";
			} else {
				// 비회원 주문 저장
				kioskService.userOrder(member, orderList, orderNum);
				kioskService.userPayment(member, orderTotal, orderTotal, payWhat, orderNum);
				session.setAttribute("orderNum", orderNum);
			}
			return "kiosk/payReceipe";
		} else {
			return "redirect:/kiosk/main";
		}
	}

	@RequestMapping(value = "pointPay")
	public String pointPay(@RequestParam(value = "type") String type, Model model, HttpSession session)
			throws Exception {
		MemberVo member = (MemberVo) session.getAttribute("member");
		List<MenuOrderCommand> orderList = new ArrayList<>();
		orderList = (List<MenuOrderCommand>) session.getAttribute("orderList");
		int orderTotal = (Integer) session.getAttribute("orderTotal");
		int totalPayment = 0;
		int orderNum = kioskService.orderNumCheck();
		if (member != null && type.equals("S")) {
			totalPayment = orderTotal + member.getPoint();
			session.setAttribute("totalPayment", totalPayment);
			session.setAttribute("payWhat", "card");
			model.addAttribute("poType", "save");
			model.addAttribute("countStatus", "YES");
			return "kiosk/pointCount";
		} else if (member != null && type.equals("U")) {
			if (member.getPoint() < orderTotal) {
				// 포인트가 더 적은 경우
				totalPayment = orderTotal - member.getPoint();
				session.setAttribute("totalPayment", totalPayment);
				session.setAttribute("payWhat", "cardPoint");
				model.addAttribute("poType", "use");
				model.addAttribute("countStatus", "YES");
				return "kiosk/pointCount";
			} else {
				// 포인트가 더 많은 경우 일로(여기서 저장도)
				totalPayment = member.getPoint() - orderTotal;
				session.setAttribute("totalPayment", totalPayment);
				model.addAttribute("poType", "use");
				model.addAttribute("countStatus", "NO");
				kioskService.userOrder(member, orderList, orderNum);
				kioskService.userPayment(member, orderTotal, totalPayment, "point", orderNum);
				session.setAttribute("orderNum", orderNum);
				return "kiosk/pointCount";
			}
		} else {
			return "redirect:/kiosk/main";
		}

	}

	@RequestMapping(value = "receipe")
	public String payRecipe(@RequestParam(value = "type") String type, HttpSession session) throws Exception {
		if (type.equals("Y")) {
			MemberVo member = (MemberVo) session.getAttribute("member");
			member = kioskService.checkPhoneNumber(member.getPhone());
			int orderNum = (int) session.getAttribute("orderNum");
			List<ReceipeResultCommand> resultReceipe = kioskService.resultReceipe(orderNum);
			HashMap<String, Object> receipeInfo = kioskService.receipeInfo(orderNum);
			session.setAttribute("member", member);
			session.setAttribute("resultReceipe", resultReceipe);
			session.setAttribute("receipeInfo", receipeInfo);
			return "kiosk/receipePrint";
		} else if (type.equals("N")) {
			return "kiosk/payResult";
		}
		return "redirect:/kiosk/main";
	}

}
