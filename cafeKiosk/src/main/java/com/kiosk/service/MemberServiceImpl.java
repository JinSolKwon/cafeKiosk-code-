package com.kiosk.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kiosk.dao.ICategoryDao;
import com.kiosk.dao.IMemberDao;
import com.kiosk.dao.IMenuDao;
import com.kiosk.vo.CategoryVo;
import com.kiosk.vo.MemberVo;
import com.kiosk.vo.MenuVo;

@Service
public class MemberServiceImpl implements IMemberService{
	@Autowired
	private IMemberDao memberDao;
	@Autowired
	private ICategoryDao categoryDao;
	@Autowired
	private IMenuDao menuDao;

	@Override
	public void registMember(MemberVo member) throws Exception {
		memberDao.registMember(member);
	}

	@Override
	public MemberVo checkPhoneNumber(String phone) throws Exception {
		return memberDao.loginMember(phone);
	}

	@Override
	public List<CategoryVo> categoryList() throws Exception {
		return categoryDao.categoryList();
	}

	@Override
	public List<MenuVo> menuList(int num) throws Exception {
		return menuDao.menuList(num);
	}
	
	
}
