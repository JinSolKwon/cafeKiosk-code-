package com.kiosk.service;

import java.util.List;

import com.kiosk.vo.MemberVo;


public interface MemberService {
	
	public abstract int memberCount(String backNumber);
	
	public abstract List<MemberVo> list(String backNumber, String start, String end);
	
}
