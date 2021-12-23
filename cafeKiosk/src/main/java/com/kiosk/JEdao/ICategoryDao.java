package com.kiosk.JEdao;

import java.util.List;

import com.kiosk.JEvo.CategoryVo;

public interface ICategoryDao {
	//카테고리 목록 출력
	public List<CategoryVo> categoryList() throws Exception;
}
