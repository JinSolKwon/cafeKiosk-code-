package com.kiosk.vo;

import java.util.Date;

public class MenuVo {
	private int num;
	private int categoryNum;
	private String menu;
	private int price;
	private Date regdate;
	private int using;
	
	public MenuVo() {
		super();
	}

	public MenuVo(int num, int categoryNum, String menu, int price, Date regdate, int using) {
		super();
		this.num = num;
		this.categoryNum = categoryNum;
		this.menu = menu;
		this.price = price;
		this.regdate = regdate;
		this.using = using;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

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

	public Date getRegdate() {
		return regdate;
	}

	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}

	public int getUsing() {
		return using;
	}

	public void setUsing(int using) {
		this.using = using;
	}

	@Override
	public String toString() {
		return "menuVo [num=" + num + ", categoryNum=" + categoryNum + ", menu=" + menu + ", price=" + price
				+ ", regdate=" + regdate + ", using=" + using + "]";
	}
	
}
