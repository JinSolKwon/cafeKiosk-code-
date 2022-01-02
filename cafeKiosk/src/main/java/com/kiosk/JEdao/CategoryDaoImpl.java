package com.kiosk.JEdao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kiosk.HSvo.CategoryVo;

@Repository
public class CategoryDaoImpl implements ICategoryDao {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	@Override
	public List<CategoryVo> categoryList() throws Exception {
		return sqlSessionTemplate.selectList("categoryList");
	}

	@Override
	public int categoryMinNum() throws Exception {
		return sqlSessionTemplate.selectOne("categoryMinNum");
	}

	@Override
	public int categoryMaxNum() throws Exception {
		return sqlSessionTemplate.selectOne("categoryMaxNum");
	}

}
