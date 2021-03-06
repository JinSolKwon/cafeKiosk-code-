package com.kiosk.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Collections;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FilenameUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.kiosk.service.MenuService;
import com.kiosk.vo.MenuVo;


@Controller
@RequestMapping("/managerPage/*")
public class MenuController {
	
	private static final Logger logger = LoggerFactory.getLogger(MenuController.class);
		
	private static final String FILE_PATH ="C:\\cafeCarp\\MenuUpload";
//	private static final String FILE_PATH ="d:\\javastudy\\jspupload";
	
	@Inject
	MenuService service;
	
	// 메뉴 관리 페이지
	@RequestMapping("menuControl")
	public String menu(@RequestParam(name="pageNum",required=false,defaultValue="0")int pageNum,
			@RequestParam(name="menu", required=false, defaultValue="")String menu,
			@RequestParam(name="type", required=false, defaultValue="")String type,
			@RequestParam(name="search", required=false, defaultValue="0")int search,
			Model model, HttpSession session) throws Exception{
		if (search == 0) {
			if (session.getAttribute("menu") != null) {
			menu = session.getAttribute("menu").toString();
			}
			if (session.getAttribute("type") != null) {
				type = session.getAttribute("type").toString();
			}
		} 
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
		categoryList = service.categoryAllList();
		
		count = service.menuCount(menu, type);
		
		if(count > 0) {
			menuList = service.menuList(menu, type, startRow, endRow);
		} else {
			menuList = Collections.emptyList();
		}
		
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
		session.setAttribute("menu", menu);
		session.setAttribute("type", type);
		
		System.out.println(menuList.toString());
		
		return "managerPage/menuControl";
	}
	
	// 메뉴 삭제
	@PostMapping("deleteMenu")
	public String deleteMenu(HttpSession session, HttpServletRequest request) {
		
		String[] ajaxMsg = request.getParameterValues("valueArr");
		for (int i = 0 ; i < ajaxMsg.length; i++) {
			service.menuDelete(ajaxMsg[i]);
		}
		
		return "redirect:menuControl";
	}
	
	// 메뉴 활성화/비활성화 여부 변경
	@PostMapping("changeActivation")
	public String changeActivation(HttpSession session, HttpServletRequest request, MenuVo vo) {
		
		String[] ajaxMsg = request.getParameterValues("valueArr");
		for (int i = 0 ; i < ajaxMsg.length; i++) {
			vo = service.menuSelect(Integer.parseInt(ajaxMsg[i]));

			if (vo.getUsing() == 0) {
				vo.setUsing(1);
				service.changeActivation(vo);
			} else {
				vo.setUsing(0);
				service.changeActivation(vo);
			}
		}
		
		return "redirect:menuControl";
	}
	
	// 메뉴 생성
	@PostMapping("insertMenu")
	public String insertMenu(@RequestParam("file")MultipartFile file, Model model, HttpSession session, 
			HttpServletRequest request, MenuVo vo, BindingResult bindingResult) throws IllegalStateException, IOException {
		
		int categoryNum = Integer.parseInt(request.getParameter("category"));
		String menu = request.getParameter("menuName");
		int price = Integer.parseInt(request.getParameter("menuPrice"));
		
		String fileBaseName = FilenameUtils.getBaseName(file.getOriginalFilename());
		String extension = FilenameUtils.getExtension(file.getOriginalFilename());
		
		vo.setCategoryNum(categoryNum);
		vo.setMenu(menu);
		vo.setPrice(price);
		
		if ( service.menuCheck(vo) == 0) {
			if(!file.getOriginalFilename().isEmpty()) {
				if(extension.toLowerCase().equals("jpg") || extension.toLowerCase().equals("jpeg") || extension.toLowerCase().equals("png") 
						|| extension.toLowerCase().equals("gif") || extension.toLowerCase().equals("bmp")) {
					file.transferTo(new File(FILE_PATH, file.getOriginalFilename()));
					vo.setSaveName(file.getOriginalFilename());
					vo.setExtension(extension);
					service.menuImageInsert(vo);
				}
			} else {
				
			}
			
			if(bindingResult.hasErrors()) {
				return "redirect:menuControl"; 
			}
			
			service.menuInsert(vo);
			return "redirect:menuControl";
			
		} else {
			return "redirect:menuControl";
		}
		
	}
	
	//메뉴 중복체크
	@ResponseBody
	@PostMapping(value="menuChk")
	public int menuChk(HttpServletRequest request,MenuVo vo) throws Exception{
		String menu = request.getParameter("menu");
		
		int num = 0;
		
		if(request.getParameter("num") != null) {
			num = Integer.parseInt(request.getParameter("num"));
		}		
		String name=service.menuSelect(num).getMenu();
		
		vo.setMenu(menu);
		
		int result = service.menuCheck(vo);
		
		if (name.equals(menu)) {
			result -= 1;
		}
		
		return result;
	}
	
	//메뉴 수정
	@PostMapping("updateMenu")
	public String updateMenu(@RequestParam("file1")MultipartFile file, Model model, HttpSession session, MultipartHttpServletRequest req,
			HttpServletRequest request, MenuVo vo)throws IllegalStateException, IOException {
		int num = Integer.parseInt(request.getParameter("num1"));
		int categoryNum = Integer.parseInt(request.getParameter("category1"));
		String menu = request.getParameter("swal-input1");
		String price = request.getParameter("swal-input2");
		
		int price1 = Integer.parseInt(price.replaceAll("\\,", ""));
		
		
		String fileBaseName = file.getOriginalFilename();
		String extension = FilenameUtils.getExtension(file.getOriginalFilename());
		
		vo.setNum(num);
		vo.setCategoryNum(categoryNum);
		vo.setMenu(menu);
		vo.setPrice(price1);
		
		MenuVo vo2 = service.menuImageInfo(menu);
		String beforeFilename = null;
		
		if ( service.menuCheck(vo) < 2) {
			if(!file.getOriginalFilename().isEmpty()) {
				if(extension.toLowerCase().equals("jpg") || extension.toLowerCase().equals("jpeg") || extension.toLowerCase().equals("png") 
						|| extension.toLowerCase().equals("gif") || extension.toLowerCase().equals("bmp")) {
					if (vo2.getSaveName() != null) {
						beforeFilename = vo2.getSaveName() + "." + vo2.getExtension();
						if (!beforeFilename.equals("")) {
							File dir = new File(FILE_PATH);
							File[] files = dir.listFiles();
							for (File f : files) {
								if (f.getName().equals(beforeFilename)) {
									f.delete();
								}
							}
						}
					}
					file.transferTo(new File(FILE_PATH, file.getOriginalFilename()));
					vo.setSaveName(fileBaseName);
					vo.setExtension(extension);
					System.out.println(vo);
					service.menuImageUpdate(vo);
				}
			}
			service.menuUpdate(vo);
		}
		return "redirect:menuControl";
	}
	
	// JE 수정해야됨
//	@RequestMapping("display")
//	public String displayPhoto(@PathVariable String image,HttpServletResponse res) throws Exception{
//		
//		res.setContentType("image/*");
//		ServletOutputStream bout = res.getOutputStream();
//		
//		String imgPath = FILE_PATH + "\\" + image;
//		FileInputStream f = new FileInputStream(imgPath);
//		int length;
//		byte[] buffer = new byte[10];
//		while((length = f.read(buffer)) != -1) {
//			bout.write(buffer, 0, length);
//		}
//		return null;
//	}
	
	// 카테고리 관리 페이지
	@RequestMapping("categoryControl")
	public String category(@RequestParam(name="pageNum",required=false,defaultValue="0")int pageNum,
			@RequestParam(name="category", required=false, defaultValue="")String category,  
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
		List<MenuVo> categoryList = null;
		
		count = service.categoryCount(category);
		
		if(count > 0) {
			categoryList = service.categoryList(category, startRow, endRow);
		} else {
			categoryList = Collections.emptyList();
		}
		
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
		model.addAttribute("categoryList",categoryList);
		model.addAttribute("masterPass", masterPass);
		
		session.setAttribute("pageNum", pageNum);
		
		return "managerPage/categoryControl";
	}
	
	// 카테고리 삭제
	@PostMapping("deleteCategory")
	public String deleteCategory(HttpSession session, HttpServletRequest request) {
		
		String[] ajaxMsg = request.getParameterValues("valueArr");
		for (int i = 0 ; i < ajaxMsg.length; i++) {
			service.categoryDelete(ajaxMsg[i]);
		}
		
		return "redirect:categoryControl";
	}
	
	
	//카테고리 중복체크
	@ResponseBody
	@PostMapping(value="categoryChk")
	public int categoryChk(HttpServletRequest request,MenuVo vo) throws Exception{
		String category = request.getParameter("category");
		
		int categoryNum = 0;
		
		if(request.getParameter("categoryNum") != null) {
			categoryNum = Integer.parseInt(request.getParameter("categoryNum"));
		}		
		String name=service.categorySelect(categoryNum).getCategory();
		
		vo.setCategory(category);
		
		int result = service.categoryCheck(vo);
		
		if(category.equals(name)) {
			result -= 1;
		}
		
		return result;
	}
	
	// 카테고리 생성
	@PostMapping("insertCategory")
	public String insertCategory(Model model, HttpSession session, 
			HttpServletRequest request, MenuVo vo, BindingResult bindingResult) throws IllegalStateException, IOException {
		
		String category = request.getParameter("categoryName");
		int type = Integer.parseInt(request.getParameter("menuType"));
		
		vo.setCategory(category);
		vo.setType(type);
		
		if (service.categoryCheck(vo) == 0) {
			service.categoryInsert(vo);
			
			if(bindingResult.hasErrors()) {
				return "redirect:categoryControl"; 
			}
			
			return "redirect:categoryControl";
			
		} else {
			return "redirect:categoryControl";
		}
		
	}
	
	//카테고리 수정
	@PostMapping("updateCategory")
	public String updateCategory(Model model, HttpSession session, HttpServletRequest request, MenuVo vo) {
		String category = request.getParameter("category");
		int type = Integer.parseInt(request.getParameter("type"));
		int categoryNum = Integer.parseInt(request.getParameter("categoryNum"));
		
		vo.setCategoryNum(categoryNum);
		vo.setCategory(category);
		vo.setType(type);
		
		System.out.println(vo);
		
		if (service.categoryCheck(vo) == 0) {
			service.categoryUpdate(vo);
		}
		
		return "redirect:categoryControl";
	}
}