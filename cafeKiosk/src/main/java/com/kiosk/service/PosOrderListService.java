package com.kiosk.service;

import java.util.List;

import com.kiosk.vo.OrderListVo;

public interface PosOrderListService {
	
	// 미제공 메뉴 내역 조회
	public List<OrderListVo> notProvidedOrder();

	
}
