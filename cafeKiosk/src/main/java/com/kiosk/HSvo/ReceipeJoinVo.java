package com.kiosk.HSvo;

import java.sql.Timestamp;

public class ReceipeJoinVo {
	private int orderNum;
	private String menu;
	private String temperature;
	private String beverageSize;
	private int shot;
	private int syrub;
	private String whipping;
	private int price;
	private Timestamp orderDate;
	private int memberNum;
	private int point;
	private int total;
	
	public ReceipeJoinVo() {
		super();
		// TODO Auto-generated constructor stub
	}

	public ReceipeJoinVo(int orderNum, String menu, String temperature, String beverageSize, int shot, int syrub,
			String whipping, int price, Timestamp orderDate, int memberNum, int point, int total) {
		super();
		this.orderNum = orderNum;
		this.menu = menu;
		this.temperature = temperature;
		this.beverageSize = beverageSize;
		this.shot = shot;
		this.syrub = syrub;
		this.whipping = whipping;
		this.price = price;
		this.orderDate = orderDate;
		this.memberNum = memberNum;
		this.point = point;
		this.total = total;
	}

	public int getOrderNum() {
		return orderNum;
	}

	public void setOrderNum(int orderNum) {
		this.orderNum = orderNum;
	}

	public String getMenu() {
		return menu;
	}

	public void setMenu(String menu) {
		this.menu = menu;
	}

	public String getTemperature() {
		return temperature;
	}

	public void setTemperature(String temperature) {
		this.temperature = temperature;
	}

	public String getBeverageSize() {
		return beverageSize;
	}

	public void setBeverageSize(String beverageSize) {
		this.beverageSize = beverageSize;
	}

	public int getShot() {
		return shot;
	}

	public void setShot(int shot) {
		this.shot = shot;
	}

	public int getSyrub() {
		return syrub;
	}

	public void setSyrub(int syrub) {
		this.syrub = syrub;
	}

	public String getWhipping() {
		return whipping;
	}

	public void setWhipping(String whipping) {
		this.whipping = whipping;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public Timestamp getOrderDate() {
		return orderDate;
	}

	public void setOrderDate(Timestamp orderDate) {
		this.orderDate = orderDate;
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

	public int getTotal() {
		return total;
	}

	public void setTotal(int total) {
		this.total = total;
	}

	@Override
	public String toString() {
		return "ReceipeCmd [orderNum=" + orderNum + ", menu=" + menu + ", temperature=" + temperature
				+ ", beverageSize=" + beverageSize + ", shot=" + shot + ", syrub=" + syrub + ", whipping=" + whipping
				+ ", price=" + price + ", orderDate=" + orderDate + ", memberNum=" + memberNum + ", point=" + point
				+ ", total=" + total + "]";
	}
}
