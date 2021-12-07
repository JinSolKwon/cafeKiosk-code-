package com.kiosk.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kiosk.vo.CategoryVo;

@Repository
public class CategoryDaoImpl implements ICategoryDao{

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	@Override
	public List<CategoryVo> categoryList() throws Exception {
		return sqlSessionTemplate.selectList("categoryList");
	}

}
