package com.kiosk.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.context.annotation.Primary;
import org.springframework.stereotype.Repository;

import com.kiosk.vo.SalesVo;

@Primary
@Repository
public class SalesDaoImpl implements SalesDao{ 
	
	private SqlSessionTemplate sqlSessionTemplate;
	
	public SalesDaoImpl(SqlSessionTemplate sqlSessionTemplate) {
		this.sqlSessionTemplate = sqlSessionTemplate;
	}
	
	public void setSqlMapClient(SqlSessionTemplate sqlSessionTemplate) {
		this.sqlSessionTemplate = sqlSessionTemplate;
	}
	
	@Override
	public int todayOrderCount() {
		return sqlSessionTemplate.selectOne("todayOrderCount");
	}
	
	@Override
	public List<SalesVo> todayOrderList() {
		return sqlSessionTemplate.selectList("todayOrderList");
	}
	
	@Override
	public List<SalesVo> todaySalesList() {
		return sqlSessionTemplate.selectList("todaySalesList");
	}
	
	@Override
	public SalesVo periodSalesSum(HashMap<String, String> map) {
		return sqlSessionTemplate.selectOne("periodSalesSum", map);
	}
	
	@Override
	public SalesVo periodRefundSum(HashMap<String, String> map) {
		return sqlSessionTemplate.selectOne("periodRefundSum", map);
	}
	
	@Override
	public List<SalesVo> dailySalesList(HashMap<String, String> map) {
		return sqlSessionTemplate.selectList("dailySalesList",map);
	}
	
	@Override
	public List<SalesVo> dailyRefundList(HashMap<String, String> map) {
		return sqlSessionTemplate.selectList("dailyRefundList",map);
	}
	
	@Override
	public List<SalesVo> dailyProfitList(HashMap<String, String> map) {
		return sqlSessionTemplate.selectList("dailyProfitList",map);
	}
}
