package com.kiosk.HSdao;

import javax.inject.Inject;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kiosk.HSvo.ManagerVo;

@Repository
public class PosMainDaoImpl implements PosMainDao{
	
	@Inject
	private SqlSessionTemplate sqlSessionTemplate;
	
	// 관리자 로그인 계정 확인
	@Override
	public ManagerVo managerLogin(ManagerVo managerVo) {
		return sqlSessionTemplate.selectOne("posMainMapper.managerLogin", managerVo);
	}
}
