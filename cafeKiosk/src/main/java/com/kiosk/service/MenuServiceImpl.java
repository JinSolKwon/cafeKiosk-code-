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
		
		return menuDao.menuList(map);
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
	public List<MenuVo> categoryAllList() {
		return menuDao.categoryAllList();
	}
	
	@Override
	public int menuCheck(MenuVo vo) {
		return menuDao.menuCheck(vo);
	}
	
	@Override
	public void menuInsert(MenuVo vo) {
		menuDao.menuInsert(vo);
	}
	
	@Override
	public void menuImageInsert(MenuVo vo) {
		menuDao.menuImageInsert(vo);
	}
	
	@Override
	public MenuVo menuImageInfo(String menu) {
		return menuDao.menuImageInfo(menu);
	}
	
	@Override
	public int menuUpdate(MenuVo vo) {
		return menuDao.menuUpdate(vo);
	}
	
	@Override
	public int menuImageUpdate(MenuVo vo) {
		return menuDao.menuImageUpdate(vo);
	}
	
	@Override
	public MenuVo menuSelect(int num) {
		return menuDao.menuSelect(num);
	}
	
	@Override
	public int changeActivation(MenuVo vo) {
		return menuDao.changeActivation(vo);
	}
	
	@Override
	public int categoryCount(String category) {
		return menuDao.categoryCount(category);
	}
	
	@Override
	public List<MenuVo> categoryList(String category, String start, String end) {
		HashMap<String,String> map = new HashMap<String,String>();
		
		map.put("category",category);
		map.put("start",start);
		map.put("end",end);
		
		return menuDao.categoryList(map);
	}
	
	@Override
	public int categoryDelete(String number) {
		return menuDao.categoryDelete(number);
	}
	
	@Override
	public int categoryCheck(MenuVo vo) {
		return menuDao.categoryCheck(vo);
	}
	
	@Override
	public void categoryInsert(MenuVo vo) {
		menuDao.categoryInsert(vo);
	}
	
	@Override
	public int categoryUpdate(MenuVo vo) {
		return menuDao.categoryUpdate(vo);
	}
	
	@Override
	public MenuVo categorySelect(int num) {
		return menuDao.categorySelect(num);
	}
}
