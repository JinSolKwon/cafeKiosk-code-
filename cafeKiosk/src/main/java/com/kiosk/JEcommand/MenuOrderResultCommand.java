package com.kiosk.JEcommand;

public class MenuOrderResultCommand {
	private int categoryNum;
	private int type;
	private String menu;
	private int price;
	private String temperature;
	private String beverageSize;
	private String whipping;
	private int syrub;
	private int shot;
	private int count;

	public MenuOrderResultCommand(int categoryNum, int type, String menu, int price, String temperature,
			String beverageSize, String whipping, int syrub, int shot, int count) {
		super();
		this.categoryNum = categoryNum;
		this.type = type;
		this.menu = menu;
		this.price = price;
		this.temperature = temperature;
		this.beverageSize = beverageSize;
		this.whipping = whipping;
		this.syrub = syrub;
		this.shot = shot;
		this.count = count;
	}

	public int getCategoryNum() {
		return categoryNum;
	}

	public void setCategoryNum(int categoryNum) {
		this.categoryNum = categoryNum;
	}

	public int getType() {
		return type;
	}

	public void setType(int type) {
		this.type = type;
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

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	@Override
	public String toString() {
		return "MenuOrderResultCommand [categoryNum=" + categoryNum + ", type=" + type + ", menu=" + menu + ", price="
				+ price + ", temperature=" + temperature + ", beverageSize=" + beverageSize + ", whipping=" + whipping
				+ ", syrub=" + syrub + ", shot=" + shot + ", count=" + count + "]";
	}

}
