package com.kiosk.dao;

import java.util.HashMap;
import java.util.List;

import com.kiosk.HSvo.MemberVo;

public interface MemberJSDao {
	
	//멤버 수 메서드
	public abstract int memberCount(String backNumber);
	
	//멤버 목록 메서드
	public abstract List<MemberVo> memberList(HashMap<String, String> map);
	
	//회원 정보 가져오기 메서드
	public abstract MemberVo member(int num);
	
	//탈퇴회원 테이블로 입력 메서드
	public abstract void insertQuitMember(MemberVo vo);
	
	//회원 삭제 메서드
	public abstract int memberDelete(String number);
	
	//회원 정보 수정 메서드
	public abstract int updateMember(MemberVo vo);
	
	//탈퇴회원 수 메서드
	public abstract int quitMemberCount(String backNumber);
	
	//탈퇴회원 목록 메서드
	public abstract List<MemberVo> quitMemberList(HashMap<String, String> map);
	
	//탈퇴회원 정보 가져오기 메서드
	public abstract MemberVo quitMember(int num);
	
	//탈퇴회원->회원 테이블로 복구 메서드
	public abstract void insertRestoreMember(MemberVo vo);
	
	//탈퇴회원 영구 삭제 메서드
	public abstract int quitMemberDelete(String number);
	
	//탈퇴회원 정보 수정 메서드
	public abstract int updateQuitMember(MemberVo vo);
}
