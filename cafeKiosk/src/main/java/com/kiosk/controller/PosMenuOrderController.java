package com.kiosk.controller;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kiosk.service.PosOrderListService;

@Controller
public class PosMenuOrderController {
	
	private static final Logger logger = LoggerFactory.getLogger(PosMenuOrderController.class);
	
	@Inject
	private PosOrderListService posOrderListService;
	
	@RequestMapping(value = "/pos/menuOrder", method = RequestMethod.GET)
	public String menuOrder() {
		logger.info("menuOrder 요청");
		return "/pos/menuOrder";
	}
	
}
