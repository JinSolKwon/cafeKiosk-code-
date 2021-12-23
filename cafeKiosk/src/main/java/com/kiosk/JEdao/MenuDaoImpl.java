package com.kiosk.JEdao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kiosk.HSvo.MenuVo;

@Repository
public class MenuDaoImpl implements IMenuDao{

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	@Override
	public List<HashMap<String, String>> menuList(int num) throws Exception {
		return sqlSessionTemplate.selectList("menuJEList", num);
	}

	@Override
	public HashMap<String, String> menuOption(int num) throws Exception {
		return sqlSessionTemplate.selectOne("menuOption", num);
	}
	

}
