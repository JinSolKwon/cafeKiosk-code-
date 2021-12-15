package com.kiosk.dao;

import java.util.List;

import com.kiosk.vo.CategoryVo;
import com.kiosk.vo.MemberVo;
import com.kiosk.vo.MenuVo;
import com.kiosk.vo.OptionListVo;

public interface PosMenuOrderDao {
	
	// 카테고리 조회
	public List<CategoryVo> getCategory();
	
	// 메뉴 목록 조회
	public List<MenuVo> selectMenuList(String categoryNum);
	
	// 옵션 목록 조회
	public List<OptionListVo> selectOptionList();
	
	// 주문번호 가져오기
	public String getMaxOrderNum(String today);
	
	// 회원 전화번호로 회원정보 조회
	public MemberVo memberCheck(String phoneNum);
	
	// 회원등록
	public int insertMember(MemberVo memberVo);
	
}
