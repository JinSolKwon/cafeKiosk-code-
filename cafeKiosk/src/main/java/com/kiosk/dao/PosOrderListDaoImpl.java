package com.kiosk.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kiosk.command.RefundPointCmd;
import com.kiosk.vo.OrderListVo;
import com.kiosk.vo.PaymentVo;

@Repository
public class PosOrderListDaoImpl implements PosOrderListDao {

	@Inject
	private SqlSession session;

	@Override
	public List<OrderListVo> notProvidedOrder() {
		return session.selectList("posOrderListMapper.notProvidedOrder");
	}

	@Override
	public int menuProvided(int orderNum) {
		return session.update("posOrderListMapper.menuProvided", orderNum);
	}

	@Override
	public int menuRefund(int orderNum) {
		return session.update("posOrderListMapper.menuRefund", orderNum);
	}

	@Override
	public PaymentVo selectPayment(int orderNum) {
		return session.selectOne("posOrderListMapper.selectPayment", orderNum);
	}

	@Override
	public int insertRefund(PaymentVo paymentVo) {
		return session.insert("posOrderListMapper.insertRefund", paymentVo);
	}
	
	@Override
	public int refundPoint(RefundPointCmd refundPointCmd) {
		return session.update("posOrderListMapper.refundPoint", refundPointCmd);
	}
}
