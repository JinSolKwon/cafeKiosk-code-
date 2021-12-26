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
	public int menuCount(HashMap<String, String> map) {
		return 0;
	}
	
	@Override
	public List<SalesVo> menuList(HashMap<String, String> map) {
		return null;
	}
}
