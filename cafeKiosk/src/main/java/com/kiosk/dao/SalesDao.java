package com.kiosk.dao;

import java.util.HashMap;
import java.util.List;

import com.kiosk.vo.SalesVo;


public interface SalesDao {
	
	// 오늘 주문 수 메서드
	public abstract int todayOrderCount();
	
	// 오늘 주문 리스트 메서드
	public abstract List<SalesVo> todayOrderList();

	// 오늘 매출 리스트 메서드
	public abstract List<SalesVo> todaySalesList();
	
	// 기간 매출 합계 메서드
	public abstract SalesVo periodSalesSum(HashMap<String, String> map);
	
	// 기간 환불 합계 메서드
	public abstract SalesVo periodRefundSum(HashMap<String, String> map);
	
	// 기간 내 일별 매출 리스트 메서드
	public abstract List<SalesVo> dailySalesList(HashMap<String, String> map);
	
	// 기간 내 일별 환불 리스트 메서드
	public abstract List<SalesVo> dailyRefundList(HashMap<String, String> map);
	
	// 기간 내 일별 이익 리스트 메서드
	public abstract List<SalesVo> dailyProfitList(HashMap<String, String> map);
}
