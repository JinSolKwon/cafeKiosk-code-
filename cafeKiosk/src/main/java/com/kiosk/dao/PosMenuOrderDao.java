package com.kiosk.dao;

import com.kiosk.vo.MemberVo;

public interface PosMenuOrderDao {
	
	// 회원 전화번호로 포인트 조회
	public MemberVo pointCheck(String phoneNum);
}
