package com.kiosk.dao;

import com.kiosk.vo.PaymentVo;

public interface IPaymentDao {
	//결제정보 등록
	public void paymentRegist(PaymentVo payment) throws Exception;
}
