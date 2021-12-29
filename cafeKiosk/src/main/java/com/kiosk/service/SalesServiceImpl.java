package com.kiosk.service;

import java.text.SimpleDateFormat;
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
	public int todayOrderCount() {
		return salesDao.todayOrderCount();
	}
	
	@Override
	public List<SalesVo> todayOrderList() {
		return salesDao.todayOrderList();
	}
	
	@Override
	public List<SalesVo> todaySalesList() {
		return salesDao.todaySalesList();
	}
	
	@Override
	public SalesVo periodSalesSum(String startDate, String endDate) {
		HashMap<String,String> map = new HashMap<String,String>(); 
		
		map.put("startDate", startDate);
		map.put("endDate", endDate);
		
		return salesDao.periodSalesSum(map);
	}
	
	@Override
	public SalesVo periodRefundSum(String startDate, String endDate) {
		HashMap<String,String> map = new HashMap<String,String>(); 
		
		map.put("startDate", startDate);
		map.put("endDate", endDate);
		
		return salesDao.periodRefundSum(map);
	}
}
