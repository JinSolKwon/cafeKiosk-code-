package com.kiosk.dao;

import java.util.List;

import com.kiosk.vo.MenuVo;

public interface IMenuDao {
	//메뉴 목록 출력
	public List<MenuVo> menuList(int num) throws Exception;
}
