package com.kiosk.JEvo;

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
	public void setNum(int num) {
		this.num = num;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getBirthYear() {
		return birthYear;
	}
	public void setBirthYear(String birthYear) {
		this.birthYear = birthYear;
	}
	public String getBirth() {
		return birth;
	}
	public void setBirth(String birth) {
		this.birth = birth;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	public int getPoint() {
		return point;
	}
	public void setPoint(int point) {
		this.point = point;
	}
	
	@Override
	public String toString() {
		return "MemberVo [num=" + num + ", name=" + name + ", phone=" + phone + ", birthYear=" + birthYear + ", birth="
				+ birth + ", regdate=" + regdate + ", point=" + point + "]";
	}
	
}
