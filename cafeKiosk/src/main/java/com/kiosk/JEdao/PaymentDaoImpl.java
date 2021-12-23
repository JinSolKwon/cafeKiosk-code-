package com.kiosk.JEdao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kiosk.JEvo.CategoryVo;
import com.kiosk.JEvo.OrderListVo;
import com.kiosk.JEvo.PaymentVo;

@Repository
public class PaymentDaoImpl implements IPaymentDao{

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	@Override
	public void paymentRegist(PaymentVo payment) throws Exception {
		sqlSessionTemplate.insert("paymentRegist", payment);
	}

}
