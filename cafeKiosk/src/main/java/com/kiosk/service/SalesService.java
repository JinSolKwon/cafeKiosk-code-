package com.kiosk.service;

import java.util.HashMap;
import java.util.List;

import com.kiosk.vo.SalesVo;


public interface SalesService {
	
	public abstract int todayOrderCount();
	
	public abstract List<SalesVo> todayOrderList();
		
	public abstract List<SalesVo> todaySalesList();
	
	public abstract SalesVo periodSalesSum(String startDate,String endDate);
	
	public abstract SalesVo periodRefundSum(String startDate,String endDate);
	
	public abstract List<SalesVo> dailySalesList(String startDate, String endDate, String start, String end);
	
	public abstract List<SalesVo> dailyRefundList(String startDate, String endDate, String start, String end);
	
	public abstract List<SalesVo> dailyProfitList(String startDate, String endDate, String start, String end);
}
