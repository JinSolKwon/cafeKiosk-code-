package com.kiosk.dao;

import java.util.List;

import com.kiosk.vo.OrderListVo;

public interface PosOrderListDao {
	
	// 미제공 메뉴 내역 조회
	public List<OrderListVo> notProvidedOrder();
	
}
