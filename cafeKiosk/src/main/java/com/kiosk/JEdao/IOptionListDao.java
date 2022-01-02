package com.kiosk.JEdao;

import java.util.List;

import com.kiosk.HSvo.OptionListVo;

public interface IOptionListDao {
	// 옵션 목록 출력
	public List<OptionListVo> optionList() throws Exception;
}
