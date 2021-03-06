package com.kiosk.HSservice;

import java.util.List;

import com.kiosk.HScommand.RefundPaymentCmd;
import com.kiosk.HScommand.RefundPointCmd;
import com.kiosk.HSvo.OrderListVo;
import com.kiosk.HSvo.PaymentVo;

public interface PosOrderListService {

	// 미제공 메뉴 내역 조회
	public List<OrderListVo> notProvidedOrder(String today);

	// 메뉴 제공 완료
	public boolean menuProvided(int orderNum);

	// 메뉴 환불
	public boolean menuRefund(int orderNum);

	// 결제정보 조회 : 단일 조회
	public PaymentVo selectPayment(RefundPaymentCmd refundPaymentCmd);

	// 환불정보 입력
	public boolean insertRefund(PaymentVo paymentVo);
	
	// 회원 테이블에 있는 회원에게 포인트 복구
	public boolean refundPoint(RefundPointCmd refundPointCmd);
	
}
