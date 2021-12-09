package com.kiosk.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.context.annotation.Primary;
import org.springframework.stereotype.Repository;

import com.kiosk.vo.MemberVo;

@Primary
@Repository
public class MemberDaoImpl implements MemberDao{ 
	
	private SqlSessionTemplate sqlSessionTemplate;
	
	public MemberDaoImpl(SqlSessionTemplate sqlSessionTemplate) {
		this.sqlSessionTemplate = sqlSessionTemplate;
	}
	
	public void setSqlMapClient(SqlSessionTemplate sqlSessionTemplate) {
		this.sqlSessionTemplate = sqlSessionTemplate;
	}
	
	@Override
	public int memberCount(String backNumber) {
		return sqlSessionTemplate.selectOne("countMember",backNumber);
	}
	
	@Override
	public List<MemberVo> memberList(HashMap<String, String> map) {
		return sqlSessionTemplate.selectList("memberList", map);
	}
}
