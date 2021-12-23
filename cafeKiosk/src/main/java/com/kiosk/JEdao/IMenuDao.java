package com.kiosk.JEdao;

import java.util.HashMap;
import java.util.List;

public interface IMenuDao {
	//메뉴 목록 출력
	public List<HashMap<String, String>> menuList(int num) throws Exception;
	//메뉴 옵션 정보 출력
	public HashMap<String, String> menuOption(int num) throws Exception;
}
