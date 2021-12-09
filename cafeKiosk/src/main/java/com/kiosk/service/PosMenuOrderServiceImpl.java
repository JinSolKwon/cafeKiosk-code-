package com.kiosk.service;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Repository;

import com.kiosk.dao.PosMenuOrderDao;
import com.kiosk.vo.MemberVo;

@Repository
public class PosMenuOrderServiceImpl implements PosMenuOrderService{
	
	@Inject
	private PosMenuOrderDao posMenuOrderDao;
	
	@Override
	public Map<String, MemberVo> pointCheck(String phoneNum) {
		
		MemberVo memberVo = posMenuOrderDao.pointCheck(phoneNum);
		Map<String, MemberVo> result = new HashMap<String, MemberVo>();
		
		if(memberVo != null) {
			result.put("pointCheck", memberVo);
		} else {
			result.put("pointCheck", null);
		}

		return result;
	}
	
	
}
