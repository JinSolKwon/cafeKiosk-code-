package com.kiosk.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Repository;

import com.kiosk.dao.PosOrderListDao;
import com.kiosk.vo.OrderListVo;
import com.kiosk.vo.PaymentVo;

@Repository
public class PosOrderListServiceImpl implements PosOrderListService {

	@Inject
	private PosOrderListDao posOrderListDao;

	@Override
	public List<OrderListVo> notProvidedOrder() {
		return posOrderListDao.notProvidedOrder();
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
	public PaymentVo selectPayment(int orderNum) {
		return posOrderListDao.selectPayment(orderNum);
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
}
