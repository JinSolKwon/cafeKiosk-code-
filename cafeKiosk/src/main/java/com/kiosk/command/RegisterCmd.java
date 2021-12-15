package com.kiosk.command;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

public class RegisterCmd {
	
	/*
	 * 	!!@Valid 어노테이션을 이용해서 model의 값을 지정하는 경우 아래의 방식으로 통해서 데이터 유효성 검증을 진행 할 수 있습니다.
	 *	
	 *	@NotNull - 값이 null인지 체크해줍니다. 그러나 빈배열은 체크를 해주지 못합니다.
	 *	@NotBlank - 문자열이 null인지 체크하고 공백을 제외한 문자열이 0보다 큰지 체크합니다. 이 어노테이션은 JSR 303이 아닙니다.
	 *	@Null : null일 겨우만 통과 가능
	 *	
	 *	@Pattern - 값을 주어진 표현식으로만 제한합니다. ex) 값을 영어만 받고싶은 경우@Pattern(regexp=”[^0-9]*”)
	 *	@Pattern(regex=, flag=) : 해당 정규식을 만족할 경우만 통과 가능
	 *	
	 *	@Future : 대상 날짜가 현재보다 미래일 경우만 통과 가능
	 *	@Past - 현재보다 과거날짜만 입력가능합니다. ex) 사용자의 생일을 입력할 때
	 *	
	 *	@Size(min=, max=) : 문자열 또는 배열이 지정된 값 사이일 경우 통과 가능
	 *	@Min(value) - 지정해준 정수값과 같거나 커야합니다.
	 *	@Max(value) - 지정해준 정수값과 같거나 작아야 합니다.
	 *	@Email - 유효한 이메일 형식인지 확인합니다. 이 어노테이션 또한 JSR 303이 아닙니다.
     * 
     *	@AssertFalse : false 값만 통과 가능
     *	@AssertTrue : true 값만 통과 가능
     *	
     *	@DecimalMax(value=) : 지정된 값 이하의 실수만 통과 가능
     *	@DecimalMin(value=) : 지정된 값 이상의 실수만 통과 가능
     *	@Digits(integer=,fraction=) : 대상 수가 지정된 정수와 소수 자리수보다 적을 경우 통과 가능
     *	@Valid : 대상 객체의 확인 조건을 만족할 경우 통과 가능
     * 
     */

	@NotNull
	private String phone;
	@NotNull
	private String name;
	@NotNull
	private String year;
	@NotNull
	@Size(min=1, max=12)
	private String month;
	@NotNull
	@Size(min=1, max=31)
	private String day;
	
	public RegisterCmd() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public RegisterCmd(String phone, String name, String year, String month, String day) {
		super();
		this.phone = phone;
		this.name = name;
		this.year = year;
		this.month = month;
		this.day = day;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getYear() {
		return year;
	}

	public void setYear(String year) {
		this.year = year;
	}

	public String getMonth() {
		return month;
	}

	public void setMonth(String month) {
		this.month = month;
	}

	public String getDay() {
		return day;
	}

	public void setDay(String day) {
		this.day = day;
	}

	@Override
	public String toString() {
		return "RegisterCmd [phone=" + phone + ", name=" + name + ", year=" + year + ", month=" + month + ", day=" + day
				+ "]";
	}
	
}
