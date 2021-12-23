package com.kiosk.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.context.annotation.Primary;
import org.springframework.stereotype.Repository;

import com.kiosk.HSvo.ManagerVo;


@Primary
@Repository
public class ManagerDaoImpl implements ManagerDao{ 
	
	private SqlSessionTemplate sqlSessionTemplate;
	
	public ManagerDaoImpl(SqlSessionTemplate sqlSessionTemplate) {
		this.sqlSessionTemplate = sqlSessionTemplate;
	}
	
	public void setSqlMapClient(SqlSessionTemplate sqlSessionTemplate) {
		this.sqlSessionTemplate = sqlSessionTemplate;
	}
	
	@Override
	public int managerCount(String id) {
		return sqlSessionTemplate.selectOne("countManager", id);
	}
	
	@Override
	public List<ManagerVo> managerList(HashMap<String, String> map) {
		return sqlSessionTemplate.selectList("managerList", map);
	}
	
	@Override
	public ManagerVo masterPass() {
		return sqlSessionTemplate.selectOne("masterPass");
	}
	
	@Override
	public void insertManager(ManagerVo vo) {
		sqlSessionTemplate.insert("insertManager", vo);
	}
	
	@Override
	public int managerDelete(String number) {
		return sqlSessionTemplate.delete("managerDelete", number);
	}
	
	@Override
	public int managerUpdate(ManagerVo vo) {
		return sqlSessionTemplate.update("updateManager", vo);
	}
	
	@Override
	public int idCheck(ManagerVo vo) {
		return sqlSessionTemplate.selectOne("idChk", vo);
	}

}
