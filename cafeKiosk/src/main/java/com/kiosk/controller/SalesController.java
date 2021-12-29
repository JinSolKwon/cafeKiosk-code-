package com.kiosk.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.YearMonth;
import java.time.format.DateTimeFormatter;
import java.util.Calendar;
import java.util.Collections;
import java.util.Date;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FilenameUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.kiosk.service.SalesService;
import com.kiosk.vo.SalesVo;


@Controller
@RequestMapping("/managerPage/*")
public class SalesController {
	
	private static final Logger logger = LoggerFactory.getLogger(SalesController.class);
		
	private static final String FILE_PATH ="d:\\javastudy\\jspupload";
	
	@Inject
	SalesService service;
	
	// 당일 매출 관리 페이지
	@GetMapping("salesToday")
	public String salesToday(Model model, HttpSession session) throws Exception{
		List<SalesVo> orderListVo = service.todayOrderList();
		List<SalesVo> salesListVo = service.todaySalesList();
		int orderCount = service.todayOrderCount();
		
		System.out.println(orderListVo);
		System.out.println(salesListVo);
		System.out.println(orderCount);
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	    Calendar c1 = Calendar.getInstance();
		String strToday = sdf.format(c1.getTime());
		
		model.addAttribute("orderList",orderListVo);
		model.addAttribute("salesList",salesListVo);
		model.addAttribute("today",strToday);
		
		return "managerPage/salesToday";
	}
	
	// 이전 매출 관리 페이지
	@RequestMapping("salesPast")
	public String salesPast(@RequestParam(name="pageNum", required=false, defaultValue="0")int pageNum,
			@RequestParam(name="eventStartDate", required=false, defaultValue="")String startDate,
			@RequestParam(name="eventEndDate", required=false, defaultValue="")String endDate,
			Model model, HttpSession session) throws Exception{
		
		SalesVo periodSalesSum = service.periodSalesSum(startDate, endDate);
		SalesVo periodRefundSum = service.periodRefundSum(startDate, endDate);
		
		if (startDate.equals("") || endDate.equals("")) {
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		    Calendar c1 = Calendar.getInstance();
		    
		    startDate = YearMonth.now().atDay(1).toString();
			endDate = sdf.format(c1.getTime());
		}
		
		model.addAttribute("periodSalesSum", periodSalesSum);
		model.addAttribute("periodRefundSum", periodRefundSum);
		model.addAttribute("startDate", startDate);
		model.addAttribute("endDate", endDate);
		
		return "managerPage/salesPast";
	}
}