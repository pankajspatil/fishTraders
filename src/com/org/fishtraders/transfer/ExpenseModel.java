package com.org.fishtraders.transfer;

public class ExpenseModel {

	private Integer expenseId;
	
	private Vendor vendor;
	
	private Fish fish;
	
	private Boat boat;
	
	private Customer customer;
	
	private Integer expenseQty;
	
	private String expenseRemark;
	
	private Double expenseVat;
	
	private Boolean isActive;
	
	private Double expenseAmt;
	
	private Double vendorAmt;
	
	private Double paidAmt;
	
	private Double custAmt;
	
	private Integer createdBy;

	public Integer getExpenseId() {
		return expenseId;
	}

	public void setExpenseId(Integer expenseId) {
		this.expenseId = expenseId;
	}

	public Vendor getVendor() {
		return vendor;
	}

	public void setVendor(Vendor vendor) {
		this.vendor = vendor;
	}

	public Integer getExpenseQty() {
		return expenseQty;
	}

	public void setExpenseQty(Integer expenseQty) {
		this.expenseQty = expenseQty;
	}

	public String getExpenseRemark() {
		return expenseRemark;
	}

	public void setExpenseRemark(String expenseRemark) {
		this.expenseRemark = expenseRemark;
	}

	public Double getExpenseVat() {
		return expenseVat;
	}

	public void setExpenseVat(Double expenseVat) {
		this.expenseVat = expenseVat;
	}

	public Boolean getIsActive() {
		return isActive;
	}

	public void setIsActive(Boolean isActive) {
		this.isActive = isActive;
	}

	public Double getExpenseAmt() {
		return expenseAmt;
	}

	public void setExpenseAmt(Double expenseAmt) {
		this.expenseAmt = expenseAmt;
	}

	public Integer getCreatedBy() {
		return createdBy;
	}

	public void setCreatedBy(Integer createdBy) {
		this.createdBy = createdBy;
	}

	public Fish getFish() {
		return fish;
	}

	public void setFish(Fish fish) {
		this.fish = fish;
	}

	public Boat getBoat() {
		return boat;
	}

	public void setBoat(Boat boat) {
		this.boat = boat;
	}

	public Customer getCustomer() {
		return customer;
	}

	public void setCustomer(Customer customer) {
		this.customer = customer;
	}

	public Double getVendorAmt() {
		return vendorAmt;
	}

	public void setVendorAmt(Double vendorAmt) {
		this.vendorAmt = vendorAmt;
	}

	public Double getCustAmt() {
		return custAmt;
	}

	public void setCustAmt(Double custAmt) {
		this.custAmt = custAmt;
	}

	public Double getPaidAmt() {
		return paidAmt;
	}

	public void setPaidAmt(Double paidAmt) {
		this.paidAmt = paidAmt;
	}

	@Override
	public String toString() {
		return "ExpenseModel [expenseId=" + expenseId + ", vendor=" + vendor
				+ ", fish=" + fish + ", boat=" + boat + ", customer="
				+ customer + ", expenseQty=" + expenseQty + ", expenseRemark="
				+ expenseRemark + ", expenseVat=" + expenseVat + ", isActive="
				+ isActive + ", expenseAmt=" + expenseAmt + ", vendorAmt="
				+ vendorAmt + ", paidAmt=" + paidAmt + ", custAmt=" + custAmt
				+ ", createdBy=" + createdBy + "]";
	}
}
