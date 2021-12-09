package com.kiosk.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kiosk.command.MenuOrderCommand;
import com.kiosk.service.IMemberService;
import com.kiosk.vo.CategoryVo;

@Controller
@RequestMapping(value="/cafeCarp/")
public class OrderController {
	@Autowired
	private IMemberService memberService;
	
	@RequestMapping(value="order", method=RequestMethod.GET)
	String order(@RequestParam(value="num", defaultValue="1") int num, HttpSession session, Model model) throws Exception {
		if(session.getAttribute("cateList") == null) {
			List<CategoryVo> cateList = memberService.categoryList();
			session.setAttribute("cateList", cateList);			
		}
		List<HashMap<String, String>> menuList = memberService.menuList(num);
		model.addAttribute("menuList", menuList);
		model.addAttribute("num", num);
		model.addAttribute("pageNum", num);
		return "user/orderForm";
	}
	
	@RequestMapping(value="orderSet", method=RequestMethod.POST)
	public String orderSet(MenuOrderCommand moc, HttpSession session, Model model, RedirectAttributes rttr) {
		List<MenuOrderCommand> orderList = new ArrayList<>();
		int toNum = moc.getPrice();
		if(session.getAttribute("orderList") != null) {
			orderList = (List<MenuOrderCommand>) session.getAttribute("orderList");	
			toNum += (Integer) session.getAttribute("orderTotal");	
			session.removeAttribute("orderList");
			session.removeAttribute("orderCount");
			session.removeAttribute("orderTotal");
		}
		orderList.add(moc);
		session.setAttribute("orderList", orderList);
		session.setAttribute("orderCount", orderList.size());
		session.setAttribute("orderTotal", toNum);
		rttr.addFlashAttribute("pageNum", moc.getCategoryNum());
		return "redirect:/cafeCarp/order?num="+moc.getCategoryNum();
	}
	
	@RequestMapping(value="orderDel", method=RequestMethod.POST)
	public String orderSet(int status, int pageNum, HttpSession session, Model model) {
		List<MenuOrderCommand> orderList = (List<MenuOrderCommand>) session.getAttribute("orderList");
		int toNum = (Integer) session.getAttribute("orderTotal");
		toNum -= orderList.get(status).getPrice();
		orderList.remove(status);
		session.removeAttribute("orderList");
		session.removeAttribute("orderTotal");
		session.setAttribute("orderList", orderList);
		session.setAttribute("orderTotal", toNum);
		return "redirect:/cafeCarp/order";
	}
	
	@RequestMapping(value="orderResult")
	public String orderSet() {
		return "user/orderResultForm";
	}
	
}
