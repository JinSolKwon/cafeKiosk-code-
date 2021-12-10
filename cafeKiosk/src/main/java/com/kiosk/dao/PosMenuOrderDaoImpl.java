package com.kiosk.dao;

import javax.inject.Inject;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kiosk.vo.MemberVo;

@Repository
public class PosMenuOrderDaoImpl implements PosMenuOrderDao {
	
	@Inject
	private SqlSessionTemplate sqlSessionTemplate;
	
	@Override
	public MemberVo pointCheck(String phoneNum) {
		return sqlSessionTemplate.selectOne("posMenuOrderMapper.selectMember", phoneNum);
	}
	
}
