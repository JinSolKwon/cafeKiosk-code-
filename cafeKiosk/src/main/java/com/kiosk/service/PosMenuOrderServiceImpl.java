package com.kiosk.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Repository;

import com.kiosk.dao.PosMenuOrderDao;
import com.kiosk.vo.CategoryVo;
import com.kiosk.vo.MemberVo;
import com.kiosk.vo.MenuVo;
import com.kiosk.vo.OptionListVo;

@Repository
public class PosMenuOrderServiceImpl implements PosMenuOrderService{
	
	@Inject
	private PosMenuOrderDao posMenuOrderDao;
	
	@Override
	public List<CategoryVo> getCategory() {
		return posMenuOrderDao.getCategory();
	}

	@Override
	public List<MenuVo> selectMenuList(String categoryNum) {
		return posMenuOrderDao.selectMenuList(categoryNum);
	}
	
	@Override
	public List<OptionListVo> selectOptionList() {
		return posMenuOrderDao.selectOptionList();
	}
	
	@Override
	public Map<String, MemberVo> pointCheck(String phoneNum) {
		
		MemberVo memberVo = posMenuOrderDao.pointCheck(phoneNum);
		Map<String, MemberVo> result = new HashMap<String, MemberVo>();
		
		if(memberVo != null) {
			result.put("pointCheck", memberVo);
		} else {
			result.put("pointCheck", null);
		}

		return result;
	}
	
	
}
