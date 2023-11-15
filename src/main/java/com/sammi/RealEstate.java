package com.sammi;

public class RealEstate {
    private int realestateId;
    private String realestateType;
    private String buildType;
    private int area;
    private int totalRoom;
    private int realestatePrice;
    public RealEstate(String buildType) {
    	this.buildType = buildType;
    }
	public RealEstate(int realestateId, String realestateType, String buildType, int area, int totalRoom,int realestatePrice) {
		this.realestateId = realestateId;
		this.realestateType = realestateType;
		this.buildType = buildType;
		this.area = area;
		this.totalRoom = totalRoom;
		this.realestatePrice = realestatePrice;
	}
    public int getRealestateId() {
        return realestateId;
    }

    public void setRealestateId(int realestateId) {
        this.realestateId = realestateId;
    }

    public String getRealestateType() {
        return realestateType;
    }

    public void setRealestateType(String realestateType) {
        this.realestateType = realestateType;
    }

    public String getBuildType() {
        return buildType;
    }

    public void setBuildType(String buildType) {
        this.buildType = buildType;
    }

    public int getArea() {
        return area;
    }

    public void setArea(int area) {
        this.area = area;
    }

    public int getTotalRoom() {
        return totalRoom;
    }

    public void setTotalRoom(int totalRoom) {
        this.totalRoom = totalRoom;
    }

    public int getRealestatePrice() {
        return realestatePrice;
    }

    public void setRealestatePrice(int realestatePrice) {
        this.realestatePrice = realestatePrice;
    }
}
