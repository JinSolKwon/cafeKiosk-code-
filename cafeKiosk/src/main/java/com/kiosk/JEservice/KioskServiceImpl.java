package com.kiosk.JEservice;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kiosk.HSvo.CategoryVo;
import com.kiosk.HSvo.MemberVo;
import com.kiosk.HSvo.OptionListVo;
import com.kiosk.HSvo.OrderListVo;
import com.kiosk.HSvo.PaymentVo;
import com.kiosk.JEcommand.MenuOrderCommand;
import com.kiosk.JEcommand.ReceipeResultCommand;
import com.kiosk.JEdao.ICategoryDao;
import com.kiosk.JEdao.IMemberDao;
import com.kiosk.JEdao.IMenuDao;
import com.kiosk.JEdao.IOptionListDao;
import com.kiosk.JEdao.IOrderListDao;
import com.kiosk.JEdao.IPaymentDao;

@Service
public class KioskServiceImpl implements IKioskService {
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
		for (MenuOrderCommand moc : orderList) {
			if (moc.getType() == 2) {
				moc.setTemperature(null);
				moc.setWhipping(null);
			}
			OrderListVo order = new OrderListVo(orderNum, moc.getMenu(), moc.getTemperature(), moc.getBeverageSize(),
					moc.getShot(), moc.getSyrub(), moc.getWhipping(), moc.getPrice());
			orderListDao.orderRegist(order);
		}
	}

	@Override
	public void userPayment(MemberVo member, int orderTotal, int totalPayment, String payWhat, int orderNum)
			throws Exception {
		PaymentVo payment = new PaymentVo();
		HashMap<String, Integer> hm = new HashMap<>();
		if (payWhat != null && payWhat.equals("card")) {
			int point = (int) (orderTotal * 0.1);
			hm.put("num", member.getNum());
			hm.put("point", point);
			memberDao.orderPointPlus(hm);
			payment.setMemberNum(member.getNum());
			payment.setCard(orderTotal);
		} else if (payWhat != null && payWhat.equals("cardPoint")) {
			hm.put("num", member.getNum());
			hm.put("point", member.getPoint());
			memberDao.orderPointMinus(hm);
			payment.setCard(totalPayment);
			payment.setPoint(member.getPoint());
		} else if (payWhat != null && payWhat.equals("point")) {
			hm.put("num", member.getNum());
			hm.put("point", orderTotal);
			memberDao.orderPointMinus(hm);
			payment.setPoint(orderTotal);
		} else if (payWhat == null || payWhat == "") {
			payment.setCard(totalPayment);
		}
		payment.setOrderNum(orderNum);
		payment.setTotal(orderTotal);
		paymentDao.paymentRegist(payment);
	}

	public List<OptionListVo> optionList() throws Exception {
		return optionListDao.optionList();
	}

	@Override
	public HashMap<String, String> menuOption(int num) throws Exception {
		return menuDao.menuOption(num);
	}

	@Override
	public String dateFormat() throws Exception {
		Date now = new Date();
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyyMMdd");
		String nowDate = simpleDateFormat.format(now);
		return nowDate;
	}

	@Override
	public int orderNumCheck() throws Exception {
		Integer orderNum = orderListDao.orderNumCHK(dateFormat());
		if (orderNum == null) {
			return 1;
		} else {
			orderNum += 1;
			return orderNum;
		}
	}

	@Override
	public int categoryMinNum() throws Exception {
		return categoryDao.categoryMinNum();
	}

	@Override
	public int categoryMaxNum() throws Exception {
		return categoryDao.categoryMaxNum();
	}

	@Override
	public List<ReceipeResultCommand> resultReceipe(int orderNum) throws Exception {
		HashMap<String, Object> hm = new HashMap<>();
		hm.put("orderNum", orderNum);
		hm.put("orderDate", dateFormat());
		List<ReceipeResultCommand> result = orderListDao.resultReceipe(hm);
		List<ReceipeResultCommand> saveTmp = new ArrayList<ReceipeResultCommand>();
		Set<ReceipeResultCommand> tmp = new HashSet<>(result);
		for (ReceipeResultCommand r : tmp) {
			int cnt = Collections.frequency(result, r);
			if (cnt > 1) {
				r.setCount(cnt);
				saveTmp.add(r);
			} else {
				r.setCount(1);
				saveTmp.add(r);
			}
		}
		return saveTmp;
	}

	@Override
	public HashMap<String, Object> receipeInfo(int orderNum) throws Exception {
		HashMap<String, Object> hm = new HashMap<>();
		hm.put("orderNum", orderNum);
		hm.put("orderDate", dateFormat());
		return paymentDao.receipeInfo(hm);
	}

}
