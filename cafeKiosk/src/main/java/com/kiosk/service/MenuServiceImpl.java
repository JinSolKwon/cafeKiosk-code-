package com.kiosk.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kiosk.dao.MenuJSDao;
import com.kiosk.vo.MenuVo;


@Service
public class MenuServiceImpl implements MenuService{
	
	@Autowired
	private MenuJSDao menuDao; 
	
	@Override
	public int menuCount(String menu,String type) {
		HashMap<String,String> map = new HashMap<String,String>();
		
		map.put("menu", menu);
		map.put("type", type);
		
		return menuDao.menuCount(map);
	}
	
	@Override
	public List<MenuVo> menuList(String menu, String type, String start, String end) {
		HashMap<String,String> map = new HashMap<String,String>();
		
		map.put("menu",menu);
		map.put("type",type);
		map.put("start",start);
		map.put("end",end);
		
		return menuDao.MenuList(map);
	}
	
	@Override
	public String Pass() {
		return menuDao.Pass();
	}
	
	@Override
	public int menuDelete(String number) {
		return menuDao.menuDelete(number);
	}
	
	@Override
	public List<MenuVo> categoryList() {
		return menuDao.categoryList();
	}
	
	@Override
	public int menuCheck(MenuVo vo) {
		return menuDao.menuCheck(vo);
	}
}
