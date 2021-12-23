package com.kiosk.dao;

import java.util.HashMap;
import java.util.List;

import com.kiosk.vo.MenuVo;

public interface MenuDao {
	
	//메뉴 수 메서드
	public abstract int menuCount(HashMap<String,String> map);
	
	//메뉴 리스트 메서드
	public abstract List<MenuVo> MenuList(HashMap<String, String> map);

	//마스터 패스워드
	public abstract String Pass();
	
	//메뉴 삭제 메서드
	public abstract int menuDelete(String number);
	
	//카테고리 가져오기 메서드
	public abstract List<MenuVo> categoryList();
	
	//메뉴이름 중복체크 메서드
	public abstract int menuCheck(MenuVo vo);
}
