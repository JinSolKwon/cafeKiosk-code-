package com.kiosk.vo;

import java.util.Date;

public class ManagerVo {
	private int num;
	private String id;
	private String pw;
	private String status;
	private Date regdate;
	
	public int getNum() {
		return num;
	}
	public String getId() {
		return id;
	}
	public String getPw() {
		return pw;
	}
	public String getStatus() {
		return status;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public void setId(String id) {
		this.id = id;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	
	@Override
	public String toString() {
		return "ManagerVo [num=" + num + ", id=" + id + ", pw=" + pw + ", status=" + status + ", regdate=" + regdate
				+ "]";
	}
}
