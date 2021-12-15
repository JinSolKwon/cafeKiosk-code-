package com.kiosk.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kiosk.dao.ManagerDao;
import com.kiosk.vo.ManagerVo;


@Service
public class ManagerServiceImpl implements ManagerService{
	
	@Autowired
	private ManagerDao managerDao; 
	
	@Override
	public int managerCount(String backNumber) {
		return managerDao.managerCount(backNumber);
	}
	
	@Override
	public List<ManagerVo> list(String id, String start, String end) {
		HashMap<String,String> map = new HashMap<String, String>();
		
		map.put("id", id);
		map.put("start", start);
		map.put("end", end);
		
		return managerDao.managerList(map);
	}
	
	@Override
	public ManagerVo masterPass() {
		return managerDao.masterPass();
	}
	
	@Override
	public void insertManager(ManagerVo vo) {
		managerDao.insertManager(vo);
	}
	
	@Override
	public int managerDelete(String number) {
		return managerDao.managerDelete(number);
	}
	
	@Override
	public int managerUpdate(ManagerVo vo) {
		return managerDao.managerUpdate(vo);
	}
	
}
