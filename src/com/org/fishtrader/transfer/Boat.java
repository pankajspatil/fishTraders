package com.org.fishtrader.transfer;

public class Boat {

	private Integer boatId;
	private String boatName;
	private String statusCode;
	private Integer isActive;

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

	public String getStatusCode() {
		return statusCode;
	}

	public void setStatusCode(String statusCode) {
		this.statusCode = statusCode;
	}

	public Integer getIsActive() {
		return isActive;
	}

	public void setIsActive(Integer isActive) {
		this.isActive = isActive;
	}

	@Override
	public String toString() {
		return "boat [boatId=" + boatId + ", boatName=" + boatName + ", statusCode=" + statusCode + ", isActive=" + isActive
				+ "]";
	}
}
