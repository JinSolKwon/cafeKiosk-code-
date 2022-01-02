package com.kiosk.JEdao;

import java.util.HashMap;
import java.util.List;

import com.kiosk.HSvo.OrderListVo;
import com.kiosk.JEcommand.ReceipeResultCommand;

public interface IOrderListDao {
	// 주문 등록
	public void orderRegist(OrderListVo order) throws Exception;

	// 주문번호 확인
	public Integer orderNumCHK(String nowDate) throws Exception;

	// 주문내역 영수증 출력
	public List<ReceipeResultCommand> resultReceipe(HashMap<String, Object> hm) throws Exception;

}
