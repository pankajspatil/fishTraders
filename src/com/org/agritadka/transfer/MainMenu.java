package com.org.agritadka.transfer;

public class MainMenu {
	
	private Integer mainMenuId;

	private String mainMenuName;
	
	private boolean isVeg;
	
	public Integer getMainMenuId() {
		return mainMenuId;
	}

	public void setMainMenuId(Integer mainMenuId) {
		this.mainMenuId = mainMenuId;
	}

	public String getMainMenuName() {
		return mainMenuName;
	}

	public void setMainMenuName(String mainMenuName) {
		this.mainMenuName = mainMenuName;
	}

	public boolean isVeg() {
		return isVeg;
	}

	public void setVeg(boolean isVeg) {
		this.isVeg = isVeg;
	}

	@Override
	public String toString() {
		return "MainMenu [mainMenuId=" + mainMenuId + ", mainMenuName="
				+ mainMenuName + ", isVeg=" + isVeg + "]";
	}
	
	
	
}
