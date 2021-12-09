package com.kiosk.command;

public class MenuOrderCommand {
	private int categoryNum;
	private String menu;
	private int price;
	private String temperature;
	private String beverageSize;
	private String whipping;
	private int syrub;
	private int shot;
	public int getCategoryNum() {
		return categoryNum;
	}
	public void setCategoryNum(int categoryNum) {
		this.categoryNum = categoryNum;
	}
	public String getMenu() {
		return menu;
	}
	public void setMenu(String menu) {
		this.menu = menu;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
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
	public String getWhipping() {
		return whipping;
	}
	public void setWhipping(String whipping) {
		this.whipping = whipping;
	}
	public int getSyrub() {
		return syrub;
	}
	public void setSyrub(int syrub) {
		this.syrub = syrub;
	}
	public int getShot() {
		return shot;
	}
	public void setShot(int shot) {
		this.shot = shot;
	}
	@Override
	public String toString() {
		return "MenuOrderCommand [categoryNum=" + categoryNum + ", menu=" + menu + ", price=" + price + ", temperature="
				+ temperature + ", beverageSize=" + beverageSize + ", whipping=" + whipping + ", syrub=" + syrub
				+ ", shot=" + shot + "]";
	}
	
}
