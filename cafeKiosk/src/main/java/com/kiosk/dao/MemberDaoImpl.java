package com.kiosk.dao;

import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kiosk.vo.MemberVo;

@Repository
public class MemberDaoImpl implements IMemberDao{
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;

	@Override
	public void registMember(MemberVo member) throws Exception {
		sqlSessionTemplate.insert("registMember", member);
	}

	@Override
	public MemberVo loginMember(String phone) throws Exception {
		return sqlSessionTemplate.selectOne("loginMember", phone);
	}
	
	@Override
	public void orderPointMinus(HashMap<String, Integer> hm) throws Exception {
		sqlSessionTemplate.update("orderPointMinus", hm);		
	}

	@Override
	public void orderPointPlus(HashMap<String, Integer> hm) throws Exception {
		sqlSessionTemplate.update("orderPointPlus", hm);		
	}
	
}
