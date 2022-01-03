package com.kiosk.vo;

import java.sql.Timestamp;

public class SalesVo {
	// 주문 리스트 테이블 변수
	private int num;
	private int orderNum;
	private String menu;
	private String temperature;
	private String beverageSize;
	private int shot;
	private int syrub;
	private String whipping;
	private int price;
	private String orderDate;
	// 결제 테이블 변수
	private int memberNum;
	private int point;
	private int card;
	private int cash;
	private int total;
	private String provision;
	private String refund;
	// 환불 테이블 변수
	private Timestamp refundDate;
	public int getNum() {
		return num;
	}
	public int getOrderNum() {
		return orderNum;
	}
	public String getMenu() {
		return menu;
	}
	public String getTemperature() {
		return temperature;
	}
	public String getBeverageSize() {
		return beverageSize;
	}
	public int getShot() {
		return shot;
	}
	public int getSyrub() {
		return syrub;
	}
	public String getWhipping() {
		return whipping;
	}
	public int getPrice() {
		return price;
	}
	public String getOrderDate() {
		return orderDate;
	}
	public int getMemberNum() {
		return memberNum;
	}
	public int getPoint() {
		return point;
	}
	public int getCard() {
		return card;
	}
	public int getCash() {
		return cash;
	}
	public int getTotal() {
		return total;
	}
	public String getProvision() {
		return provision;
	}
	public String getRefund() {
		return refund;
	}
	public Timestamp getRefundDate() {
		return refundDate;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public void setOrderNum(int orderNum) {
		this.orderNum = orderNum;
	}
	public void setMenu(String menu) {
		this.menu = menu;
	}
	public void setTemperature(String temperature) {
		this.temperature = temperature;
	}
	public void setBeverageSize(String beverageSize) {
		this.beverageSize = beverageSize;
	}
	public void setShot(int shot) {
		this.shot = shot;
	}
	public void setSyrub(int syrub) {
		this.syrub = syrub;
	}
	public void setWhipping(String whipping) {
		this.whipping = whipping;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public void setOrderDate(String orderDate) {
		this.orderDate = orderDate;
	}
	public void setMemberNum(int memberNum) {
		this.memberNum = memberNum;
	}
	public void setPoint(int point) {
		this.point = point;
	}
	public void setCard(int card) {
		this.card = card;
	}
	public void setCash(int cash) {
		this.cash = cash;
	}
	public void setTotal(int total) {
		this.total = total;
	}
	public void setProvision(String provision) {
		this.provision = provision;
	}
	public void setRefund(String refund) {
		this.refund = refund;
	}
	public void setRefundDate(Timestamp refundDate) {
		this.refundDate = refundDate;
	}
	@Override
	public String toString() {
		return "SalesVo [num=" + num + ", orderNum=" + orderNum + ", menu=" + menu + ", temperature=" + temperature
				+ ", beverageSize=" + beverageSize + ", shot=" + shot + ", syrub=" + syrub + ", whipping=" + whipping
				+ ", price=" + price + ", orderDate=" + orderDate + ", memberNum=" + memberNum + ", point=" + point
				+ ", card=" + card + ", cash=" + cash + ", total=" + total + ", provision=" + provision + ", refund="
				+ refund + ", refundDate=" + refundDate + "]";
	}
	
}
