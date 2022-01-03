package com.kiosk.vo;

import java.util.Date;

public class MenuVo {
	// 카테고리 테이블 변수
	private int categoryNum;
	private int type;
	private String category;
	// 메뉴 테이블 변수
	private int num;
	private String menu;
	private int price;
	private Date regdate;
	private int using;
	// 메뉴 이미지 테이블 변수
	private String saveName;
	private String extension;
	
	public int getCategoryNum() {
		return categoryNum;
	}
	public int getType() {
		return type;
	}
	public String getCategory() {
		return category;
	}
	public int getNum() {
		return num;
	}
	public String getMenu() {
		return menu;
	}
	public int getPrice() {
		return price;
	}
	public Date getRegdate() {
		return regdate;
	}
	public int getUsing() {
		return using;
	}
	public void setCategoryNum(int categoryNum) {
		this.categoryNum = categoryNum;
	}
	public void setType(int type) {
		this.type = type;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public void setMenu(String menu) {
		this.menu = menu;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	public void setUsing(int using) {
		this.using = using;
	}
	
	public String getSaveName() {
		return saveName;
	}
	public String getExtension() {
		return extension;
	}
	public void setSaveName(String saveName) {
		this.saveName = saveName;
	}
	public void setExtension(String extension) {
		this.extension = extension;
	}
	
	@Override
	public String toString() {
		return "MenuVo [categoryNum=" + categoryNum + ", type=" + type + ", category=" + category + ", num=" + num
				+ ", menu=" + menu + ", price=" + price + ", regdate=" + regdate + ", using=" + using + ", saveName="
				+ saveName + ", extension=" + extension + "]";
	}
	
	}
