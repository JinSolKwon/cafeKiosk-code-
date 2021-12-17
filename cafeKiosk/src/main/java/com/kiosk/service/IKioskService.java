package com.kiosk.service;

import java.util.Date;
import java.util.HashMap;
import java.util.List;

import com.kiosk.command.MenuOrderCommand;
import com.kiosk.vo.CategoryVo;
import com.kiosk.vo.MemberVo;
import com.kiosk.vo.OptionListVo;

public interface IKioskService {
	//회원가입
	public void registMember(MemberVo member) throws Exception;
	//전화번호 확인 및 로그인
	public MemberVo checkPhoneNumber(String phone) throws Exception;
	//카테고리 목록 가져오기
	public List<CategoryVo> categoryList() throws Exception;
	//메뉴 목록 가져오기
	public List<HashMap<String, String>> menuList(int num) throws Exception;
	//주문 등록
	public void userOrder(MemberVo member, List<MenuOrderCommand> orderList, int orderNum) throws Exception;
	//결제 정보 등록 및 포인트 변동
	public void userPayment(MemberVo member, int orderTotal, int totalPayment, String payWhat, int orderNum) throws Exception;
	//옵션 목록 가져오기
	public List<OptionListVo> optionList() throws Exception;
	//메뉴 정보 가져오기
	public HashMap<String, String> menuOption(int num) throws Exception;
	//날짜 형식 변환
	public String dateFormat() throws Exception;
	//주문번호 가져오기
	public int orderNumCheck() throws Exception;
}
