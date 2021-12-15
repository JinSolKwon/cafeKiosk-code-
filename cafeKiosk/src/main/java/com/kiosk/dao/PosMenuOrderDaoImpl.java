package com.kiosk.dao;

import java.util.List;

import javax.inject.Inject;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kiosk.vo.CategoryVo;
import com.kiosk.vo.MemberVo;
import com.kiosk.vo.MenuVo;
import com.kiosk.vo.OptionListVo;

@Repository
public class PosMenuOrderDaoImpl implements PosMenuOrderDao {
	
	@Inject
	private SqlSessionTemplate sqlSessionTemplate;
	
	@Override
	public List<CategoryVo> getCategory() {
		return sqlSessionTemplate.selectList("posMenuOrderMapper.selectCategoty");
	}
	
	@Override
	public List<MenuVo> selectMenuList(String categoryNum) {
		return sqlSessionTemplate.selectList("posMenuOrderMapper.selectMenuList", categoryNum);
	}
	
	@Override
	public List<OptionListVo> selectOptionList() {
		return sqlSessionTemplate.selectList("posMenuOrderMapper.selectOptionList");
	}
	
	@Override
	public String getMaxOrderNum(String today) {
		return sqlSessionTemplate.selectOne("posMenuOrderMapper.getMaxOrderNum", today);
	}
	
	@Override
	public MemberVo memberCheck(String phoneNum) {
		return sqlSessionTemplate.selectOne("posMenuOrderMapper.selectMember", phoneNum);
	}
	
	@Override
	public int insertMember(MemberVo memberVo) {
		return sqlSessionTemplate.insert("posMenuOrderMapper.insertMember", memberVo);
	}
}
