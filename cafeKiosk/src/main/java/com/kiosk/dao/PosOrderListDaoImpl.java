package com.kiosk.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kiosk.vo.OrderListVo;

@Repository
public class PosOrderListDaoImpl implements PosOrderListDao{
	
	@Inject
	private SqlSession session;
	
	@Override
	public List<OrderListVo> notProvidedOrder() {
		return session.selectList("posOrderListMapper.notProvidedOrder");
	}

	
}
