package com.kiosk.dao;

import java.util.HashMap;
import java.util.List;

import com.kiosk.vo.MemberVo;

public interface MemberDao {
	
	//멤버 수 메서드
	public abstract int memberCount(String backNumber);
	
	//멤버 목록 메서드
	public abstract List<MemberVo> memberList(HashMap<String, String> map);
}
