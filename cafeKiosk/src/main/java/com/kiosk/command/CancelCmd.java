package com.kiosk.command;

public class CancelCmd {
	private int index;
	private String type;
	
	public CancelCmd() {
		super();
		// TODO Auto-generated constructor stub
	}

	public CancelCmd(int index, String type) {
		super();
		this.index = index;
		this.type = type;
	}

	public int getIndex() {
		return index;
	}

	public void setIndex(int index) {
		this.index = index;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	@Override
	public String toString() {
		return "CancelCmd [index=" + index + ", type=" + type + "]";
	}
}
