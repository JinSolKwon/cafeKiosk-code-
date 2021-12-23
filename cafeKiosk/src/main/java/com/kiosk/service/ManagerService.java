package com.kiosk.service;

import java.util.List;

import com.kiosk.vo.ManagerVo;


public interface ManagerService {
	
	public abstract int managerCount(String id);
	
	public abstract List<ManagerVo> list(String id, String start, String end);
	
	public abstract ManagerVo masterPass();
	
	public abstract void insertManager(ManagerVo vo);
	
	public abstract int managerDelete(String number);

	public abstract int managerUpdate(ManagerVo vo);

	public abstract int idCheck(ManagerVo vo);
}
