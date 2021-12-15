package com.kiosk.dao;

import java.util.HashMap;
import java.util.List;

import com.kiosk.vo.ManagerVo;

public interface ManagerDao {
	
	//멤버 수 메서드
	public abstract int managerCount(String backNumber);
	
	//멤버 목록 메서드
	public abstract List<ManagerVo> managerList(HashMap<String, String> map);
	
	//회원 정보 가져오기 메서드
	public abstract ManagerVo masterPass();
	
	//매니저 계정 생성 메서드
	public abstract void insertManager(ManagerVo vo);
	
	//매니저 계정 삭제 메서드
	public abstract int managerDelete(String number);
	
	//매니저 계정 수정 메서드
	public abstract int managerUpdate(ManagerVo vo);
	

}
