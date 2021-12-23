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

import com.kiosk.service.ManagerService;
import com.kiosk.HSvo.ManagerVo;

@Controller
@RequestMapping("/managerPage/*")
public class ManagerController {
	
	private static final Logger logger = LoggerFactory.getLogger(ManagerController.class);
		
	private static final String FILE_PATH ="d:\\javastudy\\jspupload";
	
	@Inject
	ManagerService service;
	
	// ȸ������ ������
	@RequestMapping("idControl")
	public String manager(@RequestParam(name="pageNum", required=false, defaultValue="0")int pageNum, 
			@RequestParam(name="id", required=false, defaultValue="")String id
			, Model model, HttpSession session) throws Exception{
		if (pageNum == 0) {
			pageNum = 1;
		}
		if (id == "" || id == null) {
			id = "";
		}
		int pageSize = 10;
		int currentPage = pageNum;
		
		String startRow = Integer.toString((currentPage - 1) * pageSize + 1);
		String endRow = Integer.toString(currentPage * pageSize);
		int count = 0;
		int number = 0;
		List<ManagerVo> managerList = null;
		count = service.managerCount(id);
		
		if(count > 0) {
			managerList = service.list(id, startRow, endRow);
		} else {
			managerList = Collections.emptyList();
		}
		number = 1;
		if (currentPage >= 2) {
		number = (currentPage - 1) * 10 + 1;
		}
		String masterPass = service.masterPass().getPw();
		
		model.addAttribute("currentPage",new Integer(currentPage));
		model.addAttribute("startRow",new Integer(startRow));
		model.addAttribute("endRow",new Integer(endRow));
		model.addAttribute("count",new Integer(count));
		model.addAttribute("pageSize",new Integer(pageSize));
		model.addAttribute("number",new Integer(number));
		model.addAttribute("managerList",managerList);
		model.addAttribute("masterPass", masterPass);
		
		session.setAttribute("pageNum", pageNum);
		
		return "managerPage/idControl";
	}
	
	// �Ŵ��� Ż��
	@PostMapping("deleteManager")
	public String deleteManager(HttpSession session, HttpServletRequest request) {
		
		String[] ajaxMsg = request.getParameterValues("valueArr");
		for (int i = 0 ; i < ajaxMsg.length; i++) {
			service.managerDelete(ajaxMsg[i]);
		}
		
		return "redirect:idControl";
	}
	
	// �Ŵ��� ���� ����
	@PostMapping("updateManager")
	public String updateManager(HttpSession session, HttpServletRequest request, ManagerVo vo) {
		
		String num = request.getParameter("num");
		String pw = request.getParameter("str");
		
		vo.setNum(Integer.parseInt(num));
		vo.setPw(pw);

		service.managerUpdate(vo);
		
		return "redirect:idControl";
	}
	
	// �Ŵ��� ���� ���
	@PostMapping("insertManager")
	public String insertManager(Model model, HttpSession session, HttpServletRequest request,ManagerVo vo) {
		
		String id = request.getParameter("regId");
		String pw = request.getParameter("pw");
		
		vo.setId(id);
		vo.setPw(pw);
		vo.setStatus("admin");
		
		if ( service.idCheck(vo) == 0) {
			service.insertManager(vo);
		} else {
			return "redirect:idControl";
		}
		return "redirect:idControl";
	}
	
	//���̵� �ߺ�üũ
	@ResponseBody
	@PostMapping(value="/idChk")
	public int idChk(HttpServletRequest request,ManagerVo vo) throws Exception{
		String id = request.getParameter("id");
		
		vo.setId(id);
		
		int result = service.idCheck(vo);
		
		return result;
	}
}
