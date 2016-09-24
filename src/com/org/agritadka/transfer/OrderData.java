package com.org.agritadka.transfer;

import java.util.List;

public class OrderData {

	private Integer orderId;
	
	private Integer tableTypeNameId;
	
	private String tableName;
	
	private List<OrderMenu> selectedMenus;

	public Integer getOrderId() {
		return orderId;
	}

	public void setOrderId(Integer orderId) {
		this.orderId = orderId;
	}

	public Integer getTableTypeNameId() {
		return tableTypeNameId;
	}

	public void setTableTypeNameId(Integer tableTypeNameId) {
		this.tableTypeNameId = tableTypeNameId;
	}

	public String getTableName() {
		return tableName;
	}

	public void setTableName(String tableName) {
		this.tableName = tableName;
	}

	public List<OrderMenu> getSelectedMenus() {
		return selectedMenus;
	}

	public void setSelectedMenus(List<OrderMenu> selectedMenus) {
		this.selectedMenus = selectedMenus;
	}

	@Override
	public String toString() {
		return "Order [orderId=" + orderId + ", tableTypeNameId="
				+ tableTypeNameId + ", tableName=" + tableName
				+ ", selectedMenus=" + selectedMenus + "]";
	}
}
