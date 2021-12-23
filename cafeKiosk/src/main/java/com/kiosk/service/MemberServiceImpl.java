package com.kiosk.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kiosk.dao.MemberJSDao;
import com.kiosk.HSvo.MemberVo;


@Service
public class MemberServiceImpl implements MemberService{
	
	@Autowired
	private MemberJSDao memberDao; 
	
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
	
	@Override
	public MemberVo member(int num) {
		return memberDao.member(num);
	}
	
	@Override
	public void insertQuitMember(MemberVo vo) {
		memberDao.insertQuitMember(vo);
	}
	
	@Override
	public int delete(String number) {
		return memberDao.memberDelete(number);
	}
	
	@Override
	public int updateMember(MemberVo vo) {
		return memberDao.updateMember(vo);
	}
	
	@Override
	public int quitMemberCount(String backNumber) {
		return memberDao.quitMemberCount(backNumber);
	}
	
	@Override
	public List<MemberVo> quitMemberList(String backNumber, String start, String end) {
		HashMap<String,String> map = new HashMap<String, String>();
		
		map.put("backNumber", backNumber);
		map.put("start", start);
		map.put("end", end);
		
		return memberDao.quitMemberList(map);
	}
	
	@Override
	public MemberVo quitMember(int num) {
		return memberDao.quitMember(num);
	}
	
	@Override
	public void insertRestoreMember(MemberVo vo) {
		memberDao.insertRestoreMember(vo);
	}
	
	@Override
	public int quitMemberDelete(String number) {
		return memberDao.quitMemberDelete(number);
	}
	
	@Override
	public int updateQuitMember(MemberVo vo) {
		return memberDao.updateQuitMember(vo);
	}
}
