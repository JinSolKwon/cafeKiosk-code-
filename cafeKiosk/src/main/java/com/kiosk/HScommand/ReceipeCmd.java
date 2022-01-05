package com.kiosk.HScommand;

public class ReceipeCmd {
	private int orderNum;
	private String today;
	
	public ReceipeCmd() {
		super();
		// TODO Auto-generated constructor stub
	}

	public ReceipeCmd(int orderNum, String today) {
		super();
		this.orderNum = orderNum;
		this.today = today;
	}

	public int getOrderNum() {
		return orderNum;
	}

	public void setOrderNum(int orderNum) {
		this.orderNum = orderNum;
	}

	public String getToday() {
		return today;
	}

	public void setToday(String today) {
		this.today = today;
	}

	@Override
	public String toString() {
		return "ReceipeCmd [orderNum=" + orderNum + ", today=" + today + "]";
	}
	
	
	
}
