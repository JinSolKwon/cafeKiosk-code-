package com.kiosk.dao;

import com.kiosk.vo.OrderListVo;

public interface IOrderListDao {
	//주문 등록
	public void orderRegist(OrderListVo order) throws Exception;
}
