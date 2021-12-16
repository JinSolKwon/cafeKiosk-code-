package com.kiosk.service;

import java.time.LocalTime;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kiosk.command.MenuOrderCommand;
import com.kiosk.dao.ICategoryDao;
import com.kiosk.dao.IMemberDao;
import com.kiosk.dao.IMenuDao;
import com.kiosk.dao.IOptionListDao;
import com.kiosk.dao.IOrderListDao;
import com.kiosk.dao.IPaymentDao;
import com.kiosk.vo.CategoryVo;
import com.kiosk.vo.MemberVo;
import com.kiosk.vo.OptionListVo;
import com.kiosk.vo.OrderListVo;
import com.kiosk.vo.PaymentVo;

@Service
public class KioskServiceImpl implements IKioskService{
	@Autowired
	private IMemberDao memberDao;
	@Autowired
	private ICategoryDao categoryDao;
	@Autowired
	private IMenuDao menuDao;
	@Autowired
	private IOrderListDao orderListDao;
	@Autowired
	private IPaymentDao paymentDao;
	@Autowired
	private IOptionListDao optionListDao;
	
	private static int orderNum = 0;

	@Override
	public void registMember(MemberVo member) throws Exception {
		memberDao.registMember(member);
	}

	@Override
	public MemberVo checkPhoneNumber(String phone) throws Exception {
		return memberDao.loginMember(phone);
	}

	@Override
	public List<CategoryVo> categoryList() throws Exception {
		return categoryDao.categoryList();
	}

	@Override
	public List<HashMap<String, String>> menuList(int num) throws Exception {
		return menuDao.menuList(num);
	}

	@Override
	public void userOrder(MemberVo member, List<MenuOrderCommand> orderList, int orderNum) throws Exception {
		for(MenuOrderCommand moc : orderList) {
			OrderListVo order = new OrderListVo(orderNum, moc.getMenu(), moc.getTemperature(), moc.getBeverageSize(), moc.getShot(), moc.getSyrub(), moc.getWhipping(), moc.getPrice());
			orderListDao.orderRegist(order);
		}
	}

	@Override
	public void userPayment(MemberVo member, int orderTotal, int totalPayment, String payWhat, int orderNum) throws Exception {
		PaymentVo payment = new PaymentVo();
		HashMap<String, Integer> hm = new HashMap<>();
		if(payWhat != null && payWhat.equals("card")) {
			int point = (int) (orderTotal * 0.1);
			hm.put("num", member.getNum());
			hm.put("point", point);
			memberDao.orderPointPlus(hm);
			payment.setMemberNum(member.getNum());
			payment.setCard(orderTotal);
		}else if(payWhat != null && payWhat.equals("cardPoint")) {
			hm.put("num", member.getNum());
			hm.put("point", member.getPoint());
			memberDao.orderPointMinus(hm);
			payment.setCard(totalPayment);
			payment.setPoint(member.getPoint());
		}else if(payWhat != null && payWhat.equals("point")) {
			hm.put("num", member.getNum());
			hm.put("point", orderTotal);	
			memberDao.orderPointMinus(hm);
			payment.setPoint(orderTotal);
		}else if(payWhat == null || payWhat == "") {
			payment.setCard(totalPayment);			
		}
		payment.setOrderNum(orderNum);
		payment.setTotal(orderTotal);
		paymentDao.paymentRegist(payment);
	}
	
	public int orderNumChange() {
		LocalTime currentTime = LocalTime.now();
		System.out.println(currentTime);
		System.out.println(currentTime.getHour());
		//밤12시(24시)가 되면 번호 리셋
		if(currentTime.getHour() == 0) {
			orderNum = 0;
		}
		++orderNum;
		return orderNum;
	}
	
	public List<OptionListVo> optionList() throws Exception{
		return optionListDao.optionList();
	}

	@Override
	public HashMap<String, String> menuOption(int num) throws Exception {
		return menuDao.menuOption(num);
	}
	
}
