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
	
	public MemberVo() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public MemberVo(String name, String phone, String birthYear, String birth) {
		super();
		this.name = name;
		this.phone = phone;
		this.birthYear = birthYear;
		this.birth = birth;
	}

	public MemberVo(int num, String name, String phone, String birthYear, String birth, Date regdate, int point) {
		super();
		this.num = num;
		this.name = name;
		this.phone = phone;
		this.birthYear = birthYear;
		this.birth = birth;
		this.regdate = regdate;
		this.point = point;
	}

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
