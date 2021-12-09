package com.kiosk.service;

import java.util.Map;

import com.kiosk.vo.MemberVo;

public interface PosMenuOrderService {
	
	// 회원 전화번호로 포인트 조회
	public Map<String, MemberVo> pointCheck(String phoneNum);
	
}
