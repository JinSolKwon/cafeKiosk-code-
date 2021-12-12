package com.kiosk.command;

public class MenuOrderCmd {
	private String menu;
	private int price;
	
	public MenuOrderCmd() {
		super();
		// TODO Auto-generated constructor stub
	}

	public MenuOrderCmd(String menu, int price) {
		super();
		this.menu = menu;
		this.price = price;
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

	@Override
	public String toString() {
		return "MenuOrderCmd [menu=" + menu + ", price=" + price + "]";
	}
	
}
