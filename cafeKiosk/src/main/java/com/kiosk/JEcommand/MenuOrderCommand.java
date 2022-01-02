package com.kiosk.JEcommand;

public class MenuOrderCommand {
	private int categoryNum;
	private int type;
	private String menu;
	private int price;
	private String temperature;
	private String beverageSize;
	private String whipping;
	private int syrub;
	private int shot;

	public int getCategoryNum() {
		return categoryNum;
	}

	public void setCategoryNum(int categoryNum) {
		this.categoryNum = categoryNum;
	}

	public int getType() {
		return type;
	}

	public void setType(int type) {
		this.type = type;
	}

	public String getMenu() {
		return menu;
	}

	public void setMenu(String menu) {
		this.menu = menu;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getTemperature() {
		return temperature;
	}

	public void setTemperature(String temperature) {
		this.temperature = temperature;
	}

	public String getBeverageSize() {
		return beverageSize;
	}

	public void setBeverageSize(String beverageSize) {
		this.beverageSize = beverageSize;
	}

	public String getWhipping() {
		return whipping;
	}

	public void setWhipping(String whipping) {
		this.whipping = whipping;
	}

	public int getSyrub() {
		return syrub;
	}

	public void setSyrub(int syrub) {
		this.syrub = syrub;
	}

	public int getShot() {
		return shot;
	}

	public void setShot(int shot) {
		this.shot = shot;
	}

	@Override
	public String toString() {
		return "MenuOrderCommand [categoryNum=" + categoryNum + ", type=" + type + ", menu=" + menu + ", price=" + price
				+ ", temperature=" + temperature + ", beverageSize=" + beverageSize + ", whipping=" + whipping
				+ ", syrub=" + syrub + ", shot=" + shot + "]";
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((beverageSize == null) ? 0 : beverageSize.hashCode());
		result = prime * result + categoryNum;
		result = prime * result + ((menu == null) ? 0 : menu.hashCode());
		result = prime * result + price;
		result = prime * result + shot;
		result = prime * result + syrub;
		result = prime * result + ((temperature == null) ? 0 : temperature.hashCode());
		result = prime * result + type;
		result = prime * result + ((whipping == null) ? 0 : whipping.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		MenuOrderCommand other = (MenuOrderCommand) obj;
		if (beverageSize == null) {
			if (other.beverageSize != null)
				return false;
		} else if (!beverageSize.equals(other.beverageSize))
			return false;
		if (categoryNum != other.categoryNum)
			return false;
		if (menu == null) {
			if (other.menu != null)
				return false;
		} else if (!menu.equals(other.menu))
			return false;
		if (price != other.price)
			return false;
		if (shot != other.shot)
			return false;
		if (syrub != other.syrub)
			return false;
		if (temperature == null) {
			if (other.temperature != null)
				return false;
		} else if (!temperature.equals(other.temperature))
			return false;
		if (type != other.type)
			return false;
		if (whipping == null) {
			if (other.whipping != null)
				return false;
		} else if (!whipping.equals(other.whipping))
			return false;
		return true;
	}

}
