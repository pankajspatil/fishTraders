package com.org.agritadka.transfer;

import java.util.List;

public class OrderData {

	private Integer orderId;
	
	private Integer tableTypeNameId;
	
	private String tableName;
	
	private List<OrderMenu> selectedMenus;
	
	private String statusCode;
	
	private String statusName;
	
	private String dateTime;
	
	private String custName;
	
	private String mobileNumber;
	
	private String waiterName;
	
	private String custAddress;
	
	private Float taxRate;
	
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
	
	public String getStatusCode() {
		return statusCode;
	}

	public void setStatusCode(String statusCode) {
		this.statusCode = statusCode;
	}

	public String getStatusName() {
		return statusName;
	}

	public void setStatusName(String statusName) {
		this.statusName = statusName;
	}

	public String getDateTime() {
		return dateTime;
	}

	public void setDateTime(String dateTime) {
		this.dateTime = dateTime;
	}

	public String getCustName() {
		return custName;
	}

	public void setCustName(String custName) {
		this.custName = custName;
	}

	public String getMobileNumber() {
		return mobileNumber;
	}

	public void setMobileNumber(String mobileNumber) {
		this.mobileNumber = mobileNumber;
	}

	public String getWaiterName() {
		return waiterName;
	}

	public void setWaiterName(String waiterName) {
		this.waiterName = waiterName;
	}
	
	public String getCustAddress() {
		return custAddress;
	}

	public void setCustAddress(String custAddress) {
		this.custAddress = custAddress;
	}

	public Float getTaxRate() {
		return taxRate;
	}

	public void setTaxRate(Float taxRate) {
		this.taxRate = taxRate;
	}

	@Override
	public String toString() {
		return "OrderData [orderId=" + orderId + ", tableTypeNameId="
				+ tableTypeNameId + ", tableName=" + tableName
				+ ", selectedMenus=" + selectedMenus + ", statusCode="
				+ statusCode + ", statusName=" + statusName + ", dateTime="
				+ dateTime + ", custName=" + custName + ", mobileNumber="
				+ mobileNumber + ", waiterName=" + waiterName
				+ ", custAddress=" + custAddress + ", taxRate=" + taxRate + "]";
	}
}
