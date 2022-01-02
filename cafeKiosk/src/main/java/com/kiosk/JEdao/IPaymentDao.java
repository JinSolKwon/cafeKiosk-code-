package com.kiosk.JEdao;

import java.util.HashMap;

import com.kiosk.HSvo.PaymentVo;

public interface IPaymentDao {
	// 결제정보 등록
	public void paymentRegist(PaymentVo payment) throws Exception;

	// 영수증 정보
	public HashMap<String, Object> receipeInfo(HashMap<String, Object> hm) throws Exception;
}
