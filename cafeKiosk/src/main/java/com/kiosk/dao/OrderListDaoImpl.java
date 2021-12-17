package com.kiosk.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kiosk.vo.CategoryVo;
import com.kiosk.vo.OrderListVo;

@Repository
public class OrderListDaoImpl implements IOrderListDao{

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	@Override
	public void orderRegist(OrderListVo order) throws Exception {
		sqlSessionTemplate.insert("orderRegist", order);
	}

	@Override
	public Integer orderNumCHK(String nowDate) throws Exception {
		return sqlSessionTemplate.selectOne("orderNumCHK", nowDate);
	}
	
}
