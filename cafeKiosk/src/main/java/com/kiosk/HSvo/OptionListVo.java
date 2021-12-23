package com.kiosk.HSvo;

public class OptionListVo {
	private int num;
	private String optionName;
	private int price;
	
	public OptionListVo() {
		super();
		// TODO Auto-generated constructor stub
	}

	public OptionListVo(int num, String optionName, int price) {
		super();
		this.num = num;
		this.optionName = optionName;
		this.price = price;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public String getOptionName() {
		return optionName;
	}

	public void setOptionName(String optionName) {
		this.optionName = optionName;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	@Override
	public String toString() {
		return "OptionListVo [num=" + num + ", optionName=" + optionName + ", price=" + price + "]";
	}
	
}
