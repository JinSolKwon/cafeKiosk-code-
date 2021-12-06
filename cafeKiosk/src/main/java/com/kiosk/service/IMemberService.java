package com.kiosk.service;

import com.kiosk.vo.MemberVo;

public interface IMemberService {
	//회원가입
	public void registMember(MemberVo member) throws Exception;
	//전화번호 확인
	public MemberVo checkPhoneNumber(String phone) throws Exception;
}
