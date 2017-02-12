package com.org.fishtraders.transfer;

public class Fish {

	private Integer fishId;
	
	private String fishName;
	
	private String fishCode;
	
	private Integer createdBy;
	
	private String createdOn;
	
	private Boolean isActive;

	public Integer getFishId() {
		return fishId;
	}

	public void setFishId(Integer fishId) {
		this.fishId = fishId;
	}

	public String getFishName() {
		return fishName;
	}

	public void setFishName(String fishName) {
		this.fishName = fishName;
	}

	public String getFishCode() {
		return fishCode;
	}

	public void setFishCode(String fishCode) {
		this.fishCode = fishCode;
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

	public Boolean getIsActive() {
		return isActive;
	}

	public void setIsActive(Boolean isActive) {
		this.isActive = isActive;
	}

	@Override
	public String toString() {
		return "Fish [fishId=" + fishId + ", fishName=" + fishName
				+ ", fishCode=" + fishCode + ", createdBy=" + createdBy
				+ ", createdOn=" + createdOn + ", isActive=" + isActive + "]";
	}
	
}
