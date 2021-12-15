package com.kiosk.command;

public class RefundPaymentCmd {
	private int orderNum;
	private String today;
	
	public RefundPaymentCmd() {
		super();
		// TODO Auto-generated constructor stub
	}

	public RefundPaymentCmd(int orderNum, String today) {
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
		return "RefundPaymentCmd [orderNum=" + orderNum + ", today=" + today + "]";
	}
	
	
}
