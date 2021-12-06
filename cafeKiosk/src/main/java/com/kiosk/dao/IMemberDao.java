package com.kiosk.dao;

import com.kiosk.vo.MemberVo;

public interface IMemberDao {
	//회원가입
	public void registMember(MemberVo member) throws Exception;
	//로그인
	public MemberVo loginMember(String phone) throws Exception;
}
