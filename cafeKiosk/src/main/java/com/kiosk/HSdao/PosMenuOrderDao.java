package com.kiosk.HSdao;

import java.util.List;

import com.kiosk.HSvo.CategoryVo;
import com.kiosk.HSvo.MemberVo;
import com.kiosk.HSvo.MenuVo;
import com.kiosk.HSvo.OptionListVo;
import com.kiosk.HSvo.OrderListVo;
import com.kiosk.HSvo.PaymentVo;

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
	
	// 주문 내역 테이블 삽입(menuOrderList)
	public int insertOrderList(OrderListVo orderListVo);
	
	// 결제 내역 테이블 삽입(payment)
	public int insertPayment(PaymentVo paymentVo);
	
	// 포인트 변동
	public int updateMemberPoint(MemberVo memberVo);
}
