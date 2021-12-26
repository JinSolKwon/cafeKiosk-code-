package com.kiosk.dao;

import java.util.HashMap;
import java.util.List;

import com.kiosk.vo.SalesVo;


public interface SalesDao {
	
	//세일 수 메서드
	public abstract int menuCount(HashMap<String,String> map);
	
	//메뉴 리스트 메서드
	public abstract List<SalesVo> menuList(HashMap<String, String> map);

	
}
