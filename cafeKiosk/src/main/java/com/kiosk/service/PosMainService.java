package com.kiosk.service;

import com.kiosk.vo.ManagerVo;

public interface PosMainService {
	
	// 관리자 로그인 계정 확인
	public ManagerVo managerLogin(ManagerVo managerVo);
}
