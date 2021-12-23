package com.kiosk.controller;

import java.util.Collections;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kiosk.service.MenuService;
import com.kiosk.vo.MenuVo;


@Controller
@RequestMapping("/managerPage/*")
public class MenuController {
	
	private static final Logger logger = LoggerFactory.getLogger(MenuController.class);
		
	private static final String FILE_PATH ="d:\\javastudy\\jspupload";
	
	@Inject
	MenuService service;
	
	// 메뉴 관리 페이지
	@RequestMapping("menuControl")
	public String menu(@RequestParam(name="pageNum",required=false,defaultValue="0")int pageNum,
			@RequestParam(name="menu", required=false, defaultValue="")String menu,
			@RequestParam(name="type", required=false, defaultValue="")String type,  
			Model model, HttpSession session) throws Exception{
		
		if (pageNum == 0) {
			pageNum = 1;
		}
		int pageSize = 10;
		int currentPage = pageNum;
		
		String startRow = Integer.toString((currentPage - 1) * pageSize + 1);
		String endRow = Integer.toString(currentPage * pageSize);
		int count = 0;
		int number = 0;
		List<MenuVo> menuList = null;
		List<MenuVo> categoryList = null;
		categoryList = service.categoryList();
		
		count = service.menuCount(menu, type);
		System.out.println(count);
		
		if(count > 0) {
			menuList = service.menuList(menu, type, startRow, endRow);
		} else {
			menuList = Collections.emptyList();
		}
		
		System.out.println(menuList);
		System.out.println(categoryList);
		
		number = 1;
		if (currentPage >= 2) {
		number = (currentPage - 1) * 10 + 1;
		}
		String masterPass = service.Pass();
		
		model.addAttribute("currentPage",new Integer(currentPage));
		model.addAttribute("startRow",new Integer(startRow));
		model.addAttribute("endRow",new Integer(endRow));
		model.addAttribute("count",new Integer(count));
		model.addAttribute("pageSize",new Integer(pageSize));
		model.addAttribute("number",new Integer(number));
		model.addAttribute("menuList",menuList);
		model.addAttribute("categoryList",categoryList);
		model.addAttribute("masterPass", masterPass);
		
		session.setAttribute("pageNum", pageNum);
		
		return "managerPage/menuControl";
	}
	
	// 메뉴 삭제
	@PostMapping("deleteMenu")
	public String deleteManager(HttpSession session, HttpServletRequest request) {
		
		String[] ajaxMsg = request.getParameterValues("valueArr");
		for (int i = 0 ; i < ajaxMsg.length; i++) {
			service.menuDelete(ajaxMsg[i]);
		}
		
		return "redirect:menuControl";
	}
	
	//아이디 중복체크
	@ResponseBody
	@PostMapping(value="menuChk")
	public int idChk(HttpServletRequest request,MenuVo vo) throws Exception{
		String id = request.getParameter("menu");
		
		vo.setMenu(id);
		
		int result = service.menuCheck(vo);
		
		return result;
	}
	
}