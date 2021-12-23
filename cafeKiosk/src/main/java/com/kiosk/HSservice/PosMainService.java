package com.kiosk.HSservice;

import com.kiosk.HSvo.ManagerVo;

public interface PosMainService {
	
	// 관리자 로그인 계정 확인
	public ManagerVo managerLogin(ManagerVo managerVo);
}
