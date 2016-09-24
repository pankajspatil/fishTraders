package com.org.agritadka.transfer;

public class SubMenu {

	private Integer subMenuId;
	
	private String subMenuName;
	
	private boolean isVeg;
	
	private Float unitPrice;
	
	public Integer getSubMenuId() {
		return subMenuId;
	}

	public void setSubMenuId(Integer subMenuId) {
		this.subMenuId = subMenuId;
	}

	public String getSubMenuName() {
		return subMenuName;
	}

	public void setSubMenuName(String subMenuName) {
		this.subMenuName = subMenuName;
	}

	public boolean isVeg() {
		return isVeg;
	}

	public void setVeg(boolean isVeg) {
		this.isVeg = isVeg;
	}
	
	public Float getUnitPrice() {
		return unitPrice;
	}

	public void setUnitPrice(Float unitPrice) {
		this.unitPrice = unitPrice;
	}

	@Override
	public String toString() {
		return "SubMenu [subMenuId=" + subMenuId + ", subMenuName="
				+ subMenuName + ", isVeg=" + isVeg + ", unit_price=" + unitPrice + "]";
	}
}
