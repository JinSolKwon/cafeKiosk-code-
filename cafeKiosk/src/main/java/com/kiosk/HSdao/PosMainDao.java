package com.kiosk.HSdao;

import com.kiosk.HSvo.ManagerVo;

public interface PosMainDao {
	
	// 관리자 로그인 계정 확인
	public ManagerVo managerLogin(ManagerVo managerVo);
	
}
