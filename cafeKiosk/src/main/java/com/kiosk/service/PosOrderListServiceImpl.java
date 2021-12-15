package com.kiosk.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Repository;

import com.kiosk.command.RefundPaymentCmd;
import com.kiosk.command.RefundPointCmd;
import com.kiosk.dao.PosOrderListDao;
import com.kiosk.vo.OrderListVo;
import com.kiosk.vo.PaymentVo;

@Repository
public class PosOrderListServiceImpl implements PosOrderListService {

	@Inject
	private PosOrderListDao posOrderListDao;

	@Override
	public List<OrderListVo> notProvidedOrder(String today) {
		return posOrderListDao.notProvidedOrder(today);
	}

	@Override
	public boolean menuProvided(int orderNum) {
		boolean updateCheck = false;

		int result = posOrderListDao.menuProvided(orderNum);

		if (result > 0) {
			updateCheck = true;
		}

		return updateCheck;
	}

	@Override
	public boolean menuRefund(int orderNum) {
		boolean updateCheck = false;

		int result = posOrderListDao.menuRefund(orderNum);

		if (result > 0) {
			updateCheck = true;
		}

		return updateCheck;
	}

	@Override
	public PaymentVo selectPayment(RefundPaymentCmd refundPaymentCmd) {
		return posOrderListDao.selectPayment(refundPaymentCmd);
	}

	@Override
	public boolean insertRefund(PaymentVo paymentVo) {
		boolean insertCheck = false;

		int result = posOrderListDao.insertRefund(paymentVo);

		if (result > 0) {
			insertCheck = true;
		}

		return insertCheck;
	}
	
	@Override
	public boolean refundPoint(RefundPointCmd refundPointCmd) {
		boolean refundPointCheck = false;

		int result = posOrderListDao.refundPoint(refundPointCmd);

		if (result > 0) {
			refundPointCheck = true;
		}

		return refundPointCheck;
	}
	
	
}
