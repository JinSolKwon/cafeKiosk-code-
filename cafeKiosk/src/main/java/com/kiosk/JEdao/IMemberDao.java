package com.kiosk.JEdao;

import java.util.HashMap;

import com.kiosk.HSvo.MemberVo;

public interface IMemberDao {
	// 회원가입
	public void registMember(MemberVo member) throws Exception;

	// 로그인
	public MemberVo loginMember(String phone) throws Exception;

	// 주문시 포인트 변동 orderPointMinus
	public void orderPointMinus(HashMap<String, Integer> hm) throws Exception;

	// 주문시 포인트 변동 orderPointPlus
	public void orderPointPlus(HashMap<String, Integer> hm) throws Exception;
}
