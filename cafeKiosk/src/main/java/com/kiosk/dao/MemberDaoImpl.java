package com.kiosk.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.context.annotation.Primary;
import org.springframework.stereotype.Repository;

import com.kiosk.HSvo.MemberVo;

@Primary
@Repository
public class MemberDaoImpl implements MemberDao{ 
	
	private SqlSessionTemplate sqlSessionTemplate;
	
	public MemberDaoImpl(SqlSessionTemplate sqlSessionTemplate) {
		this.sqlSessionTemplate = sqlSessionTemplate;
	}
	
	public void setSqlMapClient(SqlSessionTemplate sqlSessionTemplate) {
		this.sqlSessionTemplate = sqlSessionTemplate;
	}
	
	@Override
	public int memberCount(String backNumber) {
		return sqlSessionTemplate.selectOne("countMember",backNumber);
	}
	
	@Override
	public List<MemberVo> memberList(HashMap<String, String> map) {
		return sqlSessionTemplate.selectList("memberList", map);
	}
	
	@Override
	public MemberVo member(int num) {
		return sqlSessionTemplate.selectOne("selectMember", num);
	}
	
	@Override
	public void insertQuitMember(MemberVo vo) {
		sqlSessionTemplate.insert("insertQuitMember", vo);
	}
	
	@Override
	public int memberDelete(String number) {
		return sqlSessionTemplate.delete("memberDelete", number);
	}
	
	@Override
	public int updateMember(MemberVo vo) {
		return sqlSessionTemplate.update("updateMember", vo);
	}
	
	@Override
	public int quitMemberCount(String backNumber) {
		return sqlSessionTemplate.selectOne("countQuitMember", backNumber);
	}
	
	@Override
	public List<MemberVo> quitMemberList(HashMap<String, String> map) {
		return sqlSessionTemplate.selectList("quitMemberList",map);
	}
	
	@Override
	public MemberVo quitMember(int num) {
		return sqlSessionTemplate.selectOne("selectQuitMember", num);
	}
	
	@Override
	public void insertRestoreMember(MemberVo vo) {
		sqlSessionTemplate.insert("restoreMember", vo);
	}
	
	@Override
	public int quitMemberDelete(String number) {
		return sqlSessionTemplate.delete("quitMemberDelete", number);
	}
	
	@Override
	public int updateQuitMember(MemberVo vo) {
		return sqlSessionTemplate.update("updateQuitMember", vo);
	}
}
