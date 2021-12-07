package com.kiosk.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Repository;

import com.kiosk.dao.PosOrderListDao;
import com.kiosk.vo.OrderListVo;

@Repository
public class PosOrderListServiceImpl implements PosOrderListService{

	@Inject
	private PosOrderListDao posOrderListDao;
	
	@Override
	public List<OrderListVo> notProvidedOrder() {
		return posOrderListDao.notProvidedOrder();
	}
	
}
