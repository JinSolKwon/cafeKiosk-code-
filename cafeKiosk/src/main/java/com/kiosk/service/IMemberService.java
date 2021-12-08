package com.kiosk.service;

import java.util.HashMap;
import java.util.List;

import com.kiosk.vo.CategoryVo;
import com.kiosk.vo.MemberVo;
import com.kiosk.vo.MenuVo;

public interface IMemberService {
	//회원가입
	public void registMember(MemberVo member) throws Exception;
	//전화번호 확인 및 로그인
	public MemberVo checkPhoneNumber(String phone) throws Exception;
	//카테고리 목록 가져오기
	public List<CategoryVo> categoryList() throws Exception;
	//메뉴 목록 가져오기
	public List<HashMap<String, String>> menuList(int num) throws Exception;
}
