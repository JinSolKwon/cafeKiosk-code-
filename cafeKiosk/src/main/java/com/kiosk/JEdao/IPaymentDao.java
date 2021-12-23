package com.kiosk.JEdao;

import com.kiosk.HSvo.PaymentVo;

public interface IPaymentDao {
	//결제정보 등록
	public void paymentRegist(PaymentVo payment) throws Exception;
}
