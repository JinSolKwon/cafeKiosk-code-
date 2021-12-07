package com.kiosk.vo;

public class CategoryVo {
	private int num;
	private int type;
	private String category;
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public int getType() {
		return type;
	}
	public void setType(int type) {
		this.type = type;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	@Override
	public String toString() {
		return "CategoryVo [num=" + num + ", type=" + type + ", category=" + category + "]";
	}
	
}
