package com.kiosk.dao;

import java.util.List;

import com.kiosk.vo.OptionListVo;

public interface IOptionListDao {
	//옵션 목록 출력
	public List<OptionListVo> optionList() throws Exception;
}
