package com.kiosk.command;

public class RefundPointCmd {
	private int refundPoint;
	private int memberNum;
	
	public RefundPointCmd() {
		super();
		// TODO Auto-generated constructor stub
	}

	public RefundPointCmd(int refundPoint, int memberNum) {
		super();
		this.refundPoint = refundPoint;
		this.memberNum = memberNum;
	}

	public int getRefundPoint() {
		return refundPoint;
	}

	public void setRefundPoint(int refundPoint) {
		this.refundPoint = refundPoint;
	}

	public int getMemberNum() {
		return memberNum;
	}

	public void setMemberNum(int memberNum) {
		this.memberNum = memberNum;
	}

	@Override
	public String toString() {
		return "RefundPointCmd [refundPoint=" + refundPoint + ", memberNum=" + memberNum + "]";
	}
	
	
}
