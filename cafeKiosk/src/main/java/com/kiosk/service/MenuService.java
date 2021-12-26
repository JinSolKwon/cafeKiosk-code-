package com.kiosk.service;

import java.util.List;

import com.kiosk.vo.MenuVo;


public interface MenuService {
	
	public abstract int menuCount(String type, String menu);
	
	public abstract List<MenuVo> menuList(String menu, String type, String start, String end);
		
	public abstract String Pass();
	
	public abstract int menuDelete(String number);
	
	public abstract List<MenuVo> categoryAllList();
	
	public abstract int menuCheck(MenuVo vo);
	
	public abstract void menuInsert(MenuVo vo);
	
	public abstract void menuImageInsert(MenuVo vo);
	
	public abstract MenuVo menuSelect(int num);
	
	public abstract int changeActivation(MenuVo vo);
	
	public abstract int categoryCount(String category);
	
	public abstract List<MenuVo> categoryList(String category, String start, String end);
	
	public abstract int categoryDelete(String number);
	
	public abstract int categoryCheck(MenuVo vo);
	
	public abstract void categoryInsert(MenuVo vo);
	
	public abstract int categoryUpdate(MenuVo vo);
}
