package com.kiosk.vo;

import java.util.Date;

public class PaymentVo {
	private int num;
	private int orderNum;
	private int memberNum;
	private int point;
	private int card;
	private int cash;
	private int total;
	private String provision;
	private String refund;
	private Date orderDate;
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
	public int getMemberNum() {
		return memberNum;
	}
	public void setMemberNum(int memberNum) {
		this.memberNum = memberNum;
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
	public String getProvision() {
		return provision;
	}
	public void setProvision(String provision) {
		this.provision = provision;
	}
	public String getRefund() {
		return refund;
	}
	public void setRefund(String refund) {
		this.refund = refund;
	}
	public Date getOrderDate() {
		return orderDate;
	}
	public void setOrderDate(Date orderDate) {
		this.orderDate = orderDate;
	}
	@Override
	public String toString() {
		return "PaymentVo [num=" + num + ", orderNum=" + orderNum + ", memberNum=" + memberNum + ", point=" + point
				+ ", card=" + card + ", cash=" + cash + ", total=" + total + ", provision=" + provision + ", refund="
				+ refund + ", orderDate=" + orderDate + "]";
	}
}
