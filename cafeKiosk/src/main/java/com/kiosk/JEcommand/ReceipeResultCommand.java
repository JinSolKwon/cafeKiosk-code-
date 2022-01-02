package com.kiosk.JEcommand;

public class ReceipeResultCommand {
	private String menu;
	private String temperature;
	private String beverageSize;
	private int shot;
	private int price;
	private int count;
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
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	@Override
	public String toString() {
		return "ReceipeResultCommand [menu=" + menu + ", temperature=" + temperature + ", beverageSize=" + beverageSize
				+ ", shot=" + shot + ", price=" + price + ", count=" + count + "]";
	}
	
}
