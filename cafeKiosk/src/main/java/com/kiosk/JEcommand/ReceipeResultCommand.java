package com.kiosk.JEcommand;

public class ReceipeResultCommand {
	private String menu;
	private String temperature;
	private String beverageSize;
	private int shot;
	private int price;
	private int count;

	public String getMenu() {
		return menu;
	}

	public void setMenu(String menu) {
		this.menu = menu;
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

	public int getShot() {
		return shot;
	}

	public void setShot(int shot) {
		this.shot = shot;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	@Override
	public String toString() {
		return "ReceipeResultCommand [menu=" + menu + ", temperature=" + temperature + ", beverageSize=" + beverageSize
				+ ", shot=" + shot + ", price=" + price + ", count=" + count + "]";
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((beverageSize == null) ? 0 : beverageSize.hashCode());
		result = prime * result + count;
		result = prime * result + ((menu == null) ? 0 : menu.hashCode());
		result = prime * result + price;
		result = prime * result + shot;
		result = prime * result + ((temperature == null) ? 0 : temperature.hashCode());
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
		ReceipeResultCommand other = (ReceipeResultCommand) obj;
		if (beverageSize == null) {
			if (other.beverageSize != null)
				return false;
		} else if (!beverageSize.equals(other.beverageSize))
			return false;
		if (count != other.count)
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
		if (temperature == null) {
			if (other.temperature != null)
				return false;
		} else if (!temperature.equals(other.temperature))
			return false;
		return true;
	}

}
