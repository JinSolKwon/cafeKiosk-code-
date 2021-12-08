package com.kiosk.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;
import javax.websocket.server.PathParam;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kiosk.service.IMemberService;
import com.kiosk.vo.CategoryVo;
import com.kiosk.vo.MenuVo;

@Controller
@RequestMapping(value="/cafeCarp/")
public class OrderController {
	@Autowired
	private IMemberService memberService;
	
	@RequestMapping(value="order", method=RequestMethod.GET)
	String order(@RequestParam(value="num", defaultValue="1") int num, HttpSession session, Model model, RedirectAttributes rttr) throws Exception {
		if(session.getAttribute("cateList") == null) {
			List<CategoryVo> cateList = memberService.categoryList();
			session.setAttribute("cateList", cateList);			
		}
		List<HashMap<String, String>> menuList = memberService.menuList(num);
		model.addAttribute("menuList", menuList);
		model.addAttribute("num", num);
		return "user/orderForm";
	}
	
}
