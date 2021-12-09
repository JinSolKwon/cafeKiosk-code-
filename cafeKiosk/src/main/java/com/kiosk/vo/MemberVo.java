package com.kiosk.vo;

import java.util.Date;

public class MemberVo {
	private int num;
	private String name;
	private String phone;
	private String birthYear;
	private String birth;
	private Date regdate;
	private int point;
	
	public int getNum() {
		return num;
	}
	public String getName() {
		return name;
	}
	public String getPhone() {
		return phone;
	}
	public String getBirth_year() {
		return birthYear;
	}
	public String getBirth() {
		return birth;
	}
	public Date getRegdate() {
		return regdate;
	}
	public int getPoint() {
		return point;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public void setName(String name) {
		this.name = name;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public void setBirth_year(String birth_year) {
		this.birthYear = birth_year;
	}
	public void setBirth(String birth) {
		this.birth = birth;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	public void setPoint(int point) {
		this.point = point;
	}
	
	@Override
	public String toString() {
		return "MemberVo [num=" + num + ", name=" + name + ", phone=" + phone + ", birthYear=" + birthYear
				+ ", birth=" + birth + ", regdate=" + regdate + ", point=" + point + "]";
	}
}
