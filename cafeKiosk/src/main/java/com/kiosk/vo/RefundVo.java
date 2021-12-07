package com.kiosk.vo;

import java.sql.Timestamp;

public class RefundVo {
	private int num;
	private int orderNum;
	private int point;
	private int card;
	private int cash;
	private int total;
	private Timestamp refundDate;
	
	public RefundVo() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public RefundVo(int num, int orderNum, int point, int card, int cash, int total, Timestamp refundDate) {
		super();
		this.num = num;
		this.orderNum = orderNum;
		this.point = point;
		this.card = card;
		this.cash = cash;
		this.total = total;
		this.refundDate = refundDate;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public int getOrderNum() {
		return orderNum;
	}

	public void setOrderNum(int orderNum) {
		this.orderNum = orderNum;
	}

	public int getPoint() {
		return point;
	}

	public void setPoint(int point) {
		this.point = point;
	}

	public int getCard() {
		return card;
	}

	public void setCard(int card) {
		this.card = card;
	}

	public int getCash() {
		return cash;
	}

	public void setCash(int cash) {
		this.cash = cash;
	}

	public int getTotal() {
		return total;
	}

	public void setTotal(int total) {
		this.total = total;
	}

	public Timestamp getRefundDate() {
		return refundDate;
	}

	public void setRefundDate(Timestamp refundDate) {
		this.refundDate = refundDate;
	}

	@Override
	public String toString() {
		return "RefundVo [num=" + num + ", orderNum=" + orderNum + ", point=" + point + ", card=" + card + ", cash="
				+ cash + ", total=" + total + ", refundDate=" + refundDate + "]";
	}
	
	
}
