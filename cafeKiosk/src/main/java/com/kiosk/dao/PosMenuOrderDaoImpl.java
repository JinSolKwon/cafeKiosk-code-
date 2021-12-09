package com.kiosk.dao;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kiosk.vo.MemberVo;

@Repository
public class PosMenuOrderDaoImpl implements PosMenuOrderDao {
	
	@Inject
	private SqlSession sqlsession;
	
	@Override
	public MemberVo pointCheck(String phoneNum) {
		return sqlsession.selectOne("posMenuOrderMapper.selectMember", phoneNum);
	}
	
}
