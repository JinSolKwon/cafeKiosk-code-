package com.kiosk.JEdao;

import com.kiosk.JEvo.PaymentVo;

public interface IPaymentDao {
	//결제정보 등록
	public void paymentRegist(PaymentVo payment) throws Exception;
}
