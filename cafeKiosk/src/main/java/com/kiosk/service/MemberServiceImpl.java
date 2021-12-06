package com.kiosk.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kiosk.dao.IMemberDao;
import com.kiosk.vo.MemberVo;

@Service
public class MemberServiceImpl implements IMemberService{

	@Autowired
	private IMemberDao memberDao;

	@Override
	public void registMember(MemberVo member) throws Exception {
		memberDao.registMember(member);
	}

	@Override
	public MemberVo checkPhoneNumber(String phone) throws Exception {
		return memberDao.loginMember(phone);
	}
	
	
}
