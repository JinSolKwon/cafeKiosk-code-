package com.kiosk.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kiosk.dao.MemberDao;
import com.kiosk.vo.MemberVo;


@Service
public class MemberServiceImpl implements MemberService{
	
	@Autowired
	private MemberDao memberDao; 
	
	@Override
	public int memberCount(String backNumber) {
		return memberDao.memberCount(backNumber);
	}
	
	@Override
	public List<MemberVo> list(String backNumber, String start, String end) {
		HashMap<String,String> map = new HashMap<String, String>();
		
		map.put("backNumber", backNumber);
		map.put("start", start);
		map.put("end", end);
		return memberDao.memberList(map);
	}

}
