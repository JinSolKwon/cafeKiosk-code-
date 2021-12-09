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
		return "user/orderForm";
	}
	
	@RequestMapping(value="orderSet", method=RequestMethod.POST)
	public String orderSet(MenuOrderCommand moc, HttpSession session, Model model) {
		System.out.println("0: "+moc.toString());
		List<MenuOrderCommand> orderList = new ArrayList<>();
		if(session.getAttribute("orderList") != null) {
			orderList = (List<MenuOrderCommand>) session.getAttribute("orderList");
			for(MenuOrderCommand cc : orderList) {
				System.out.println("1: " + cc);
				}		
			session.removeAttribute("orderList");
		}
		orderList.add(moc);
		for(MenuOrderCommand cc : orderList) {
		System.out.println("2: " + cc);
		}
		session.setAttribute("orderList", orderList);
		return "redirect:/cafeCarp/order?num="+moc.getCategoryNum();
	}
	
}
