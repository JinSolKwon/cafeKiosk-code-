package com.kiosk.service;

import java.util.List;
import java.util.Map;

import com.kiosk.vo.CategoryVo;
import com.kiosk.vo.MemberVo;
import com.kiosk.vo.MenuVo;
import com.kiosk.vo.OptionListVo;

public interface PosMenuOrderService {
	
	// 카테고리 조회
	public List<CategoryVo> getCategory();

	// 메뉴 목록 조회
	public List<MenuVo> selectMenuList(String categoryNum);
	
	// 옵션 목록 조회
	public List<OptionListVo> selectOptionList();
	
	// 주문번호 가져오기
	public String getMaxOrderNum(String today);
	
	// 회원 전화번호로 포인트 조회
	public Map<String, MemberVo> pointCheck(String phoneNum);
	
}
