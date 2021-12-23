package com.kiosk.HSdao;

import java.util.List;

import javax.inject.Inject;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kiosk.HScommand.RefundPaymentCmd;
import com.kiosk.HScommand.RefundPointCmd;
import com.kiosk.HSvo.OrderListVo;
import com.kiosk.HSvo.PaymentVo;

@Repository
public class PosOrderListDaoImpl implements PosOrderListDao {

	@Inject
	private SqlSessionTemplate sqlSessionTemplate;

	@Override
	public List<OrderListVo> notProvidedOrder(String today) {
		return sqlSessionTemplate.selectList("posOrderListMapper.notProvidedOrder", today);
	}

	@Override
	public int menuProvided(int orderNum) {
		return sqlSessionTemplate.update("posOrderListMapper.menuProvided", orderNum);
	}

	@Override
	public int menuRefund(int orderNum) {
		return sqlSessionTemplate.update("posOrderListMapper.menuRefund", orderNum);
	}

	@Override
	public PaymentVo selectPayment(RefundPaymentCmd refundPaymentCmd) {
		return sqlSessionTemplate.selectOne("posOrderListMapper.selectPayment", refundPaymentCmd);
	}

	@Override
	public int insertRefund(PaymentVo paymentVo) {
		return sqlSessionTemplate.insert("posOrderListMapper.insertRefund", paymentVo);
	}
	
	@Override
	public int refundPoint(RefundPointCmd refundPointCmd) {
		return sqlSessionTemplate.update("posOrderListMapper.refundPoint", refundPointCmd);
	}
}
