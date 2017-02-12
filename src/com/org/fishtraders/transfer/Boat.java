package com.org.fishtraders.transfer;


public class Boat {

	private Integer boatId;
	
	private String boatName;
	
	private Vendor vendor;
	
	private Boolean isActive;
	
	private Integer createdBy;
	
	private String createdOn;

	public Integer getBoatId() {
		return boatId;
	}

	public void setBoatId(Integer boatId) {
		this.boatId = boatId;
	}

	public String getBoatName() {
		return boatName;
	}

	public void setBoatName(String boatName) {
		this.boatName = boatName;
	}

	public Vendor getVendor() {
		return vendor;
	}

	public void setVendor(Vendor vendor) {
		this.vendor = vendor;
	}

	public Boolean getIsActive() {
		return isActive;
	}

	public void setIsActive(Boolean isActive) {
		this.isActive = isActive;
	}

	public Integer getCreatedBy() {
		return createdBy;
	}

	public void setCreatedBy(Integer createdBy) {
		this.createdBy = createdBy;
	}

	public String getCreatedOn() {
		return createdOn;
	}

	public void setCreatedOn(String createdOn) {
		this.createdOn = createdOn;
	}

	@Override
	public String toString() {
		return "Boat [boatId=" + boatId + ", boatName=" + boatName
				+ ", vendor=" + vendor + ", isActive=" + isActive
				+ ", createdBy=" + createdBy + ", createdOn=" + createdOn + "]";
	}
}
