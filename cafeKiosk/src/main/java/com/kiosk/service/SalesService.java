package com.kiosk.service;

import java.util.List;

import com.kiosk.vo.SalesVo;


public interface SalesService {
	
	public abstract int menuCount(String type, String menu);
	
	public abstract List<SalesVo> menuList(String menu, String type, String start, String end);
		
}
