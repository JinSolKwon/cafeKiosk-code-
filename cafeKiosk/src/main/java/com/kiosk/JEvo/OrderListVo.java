package com.kiosk.JEvo;

import java.util.Date;

public class OrderListVo {
	private int num;
	private int orderNum;
	private String menu;
	private String temperature;
	private String beverageSize;
	private int shot;
	private int syrub;
	private String whipping;
	private int price;
	private Date orderDate;
	
	public OrderListVo(int orderNum, String menu, String temperature, String beverageSize, int shot, int syrub,
			String whipping, int price) {
		this.orderNum = orderNum;
		this.menu = menu;
		this.temperature = temperature;
		this.beverageSize = beverageSize;
		this.shot = shot;
		this.syrub = syrub;
		this.whipping = whipping;
		this.price = price;
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
	public Date getOrderDate() {
		return orderDate;
	}
	public void setOrderDate(Date orderDate) {
		this.orderDate = orderDate;
	}
	@Override
	public String toString() {
		return "OrderListVo [num=" + num + ", orderNum=" + orderNum + ", menu=" + menu + ", temperature=" + temperature
				+ ", beverageSize=" + beverageSize + ", shot=" + shot + ", syrub=" + syrub + ", whipping=" + whipping
				+ ", price=" + price + ", orderDate=" + orderDate + "]";
	}
}
