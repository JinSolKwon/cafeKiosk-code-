package com.kiosk.JEvo;

import java.util.Date;

public class MenuImageVo {
	private int num;
	private String menu;
	private String saveName;
	private String extension;
	private Date regdate;
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getMenu() {
		return menu;
	}
	public void setMenu(String menu) {
		this.menu = menu;
	}
	public String getSaveName() {
		return saveName;
	}
	public void setSaveName(String saveName) {
		this.saveName = saveName;
	}
	public String getExtension() {
		return extension;
	}
	public void setExtension(String extension) {
		this.extension = extension;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	@Override
	public String toString() {
		return "MenuImageVo [num=" + num + ", menu=" + menu + ", saveName=" + saveName + ", extension=" + extension
				+ ", regdate=" + regdate + "]";
	}
	
}
