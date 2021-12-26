package com.kiosk.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kiosk.dao.SalesDao;
import com.kiosk.vo.SalesVo;



@Service
public class SalesServiceImpl implements SalesService{
	
	@Autowired
	private SalesDao salesDao; 
	
	@Override
	public int menuCount(String menu,String type) {
		HashMap<String,String> map = new HashMap<String,String>();
		
		map.put("menu", menu);
		map.put("type", type);
		
		return 0;
	}
	
	@Override
	public List<SalesVo> menuList(String menu, String type, String start, String end) {
		HashMap<String,String> map = new HashMap<String,String>();
		
		map.put("menu",menu);
		map.put("type",type);
		map.put("start",start);
		map.put("end",end);
		
		List<SalesVo> vo = null;
		
		return vo;
	}
	
}
