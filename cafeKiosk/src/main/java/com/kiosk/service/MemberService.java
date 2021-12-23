package com.kiosk.service;

import java.util.List;

import com.kiosk.HSvo.MemberVo;


public interface MemberService {
	
	public abstract int memberCount(String backNumber);
	
	public abstract List<MemberVo> list(String backNumber, String start, String end);
	
	public abstract MemberVo member(int num);
	
	public abstract void insertQuitMember(MemberVo vo);
	
	public abstract int delete(String number);
	
	public abstract int updateMember(MemberVo vo);
	
	public abstract int quitMemberCount(String backNumber);
	
	public abstract List<MemberVo> quitMemberList(String backNumber, String start, String end);
	
	public abstract MemberVo quitMember(int num);
	
	public abstract void insertRestoreMember(MemberVo vo);
	
	public abstract int quitMemberDelete(String number);
	
	public abstract int updateQuitMember(MemberVo vo);
}
