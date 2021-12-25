package com.kiosk.dao;

import java.util.HashMap;
import java.util.List;

import com.kiosk.vo.MenuVo;

public interface MenuJSDao {
	
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
	
	//메뉴 생성 메서드
	public abstract void menuInsert(MenuVo vo);
	
	//메뉴 이미지 생성 메서드
	public abstract void menuImageInsert(MenuVo vo);
	
	//메뉴 정보 가져오기 메서드
	public abstract MenuVo menuSelect(int num);
	
	//메뉴 활성화/비활성화 여부 변경 메서드
	public abstract int changeActivation(MenuVo vo);
}
