package com.kiosk.JEdao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kiosk.HSvo.OptionListVo;

@Repository
public class OptionListDaoImpl implements IOptionListDao {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	@Override
	public List<OptionListVo> optionList() throws Exception {
		return sqlSessionTemplate.selectList("optionList");
	}

}
