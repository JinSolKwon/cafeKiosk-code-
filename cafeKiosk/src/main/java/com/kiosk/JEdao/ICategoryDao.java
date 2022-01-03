package com.kiosk.JEdao;

import java.util.List;

import com.kiosk.HSvo.CategoryVo;

public interface ICategoryDao {
	// 카테고리 목록 출력
	public List<CategoryVo> categoryList() throws Exception;

	// 카테고리 최소 번호값 출력
	public int categoryMinNum() throws Exception;

	// 카테고리 최대 번호값 출력
	public int categoryMaxNum() throws Exception;
}
