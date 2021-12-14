package com.kiosk.vo;

public class OptionListVo {
	private int num;
	private String option;
	private int price;
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getOption() {
		return option;
	}
	public void setOption(String option) {
		this.option = option;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	@Override
	public String toString() {
		return "OptionListVo [num=" + num + ", option=" + option + ", price=" + price + "]";
	}
}
