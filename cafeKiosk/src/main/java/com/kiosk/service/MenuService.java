package com.kiosk.service;

import java.util.List;

import com.kiosk.vo.MenuVo;


public interface MenuService {
	
	public abstract int menuCount(String type, String menu);
	
	public abstract List<MenuVo> menuList(String menu, String type, String start, String end);
		
	public abstract String Pass();
	
	public abstract int menuDelete(String number);
	
	public abstract List<MenuVo> categoryList();
	
	public abstract int menuCheck(MenuVo vo);
}
