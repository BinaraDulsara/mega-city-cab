package com.model;


public class application {
	
	private int id;
    private String vType;
    private String vModelName;
    private String vBrand;
    private int noOfSeats;
    private double price;
    private String ownerId;
    private String status;
	public application(String vType, String vModelName, String vBrand, int noOfSeats, double price,
			String ownerId) {
		this.id=0;
		this.vType = vType;
		this.vModelName = vModelName;
		this.vBrand = vBrand;
		this.noOfSeats = noOfSeats;
		this.price = price;
		this.ownerId = ownerId;
		this.status="not reviewed yet";
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getvType() {
		return vType;
	}
	public void setvType(String vType) {
		this.vType = vType;
	}
	public String getvModelName() {
		return vModelName;
	}
	public void setvModelName(String vModelName) {
		this.vModelName = vModelName;
	}
	public String getvBrand() {
		return vBrand;
	}
	public void setvBrand(String vBrand) {
		this.vBrand = vBrand;
	}
	public int getNoOfSeats() {
		return noOfSeats;
	}
	public void setNoOfSeats(int noOfSeats) {
		this.noOfSeats = noOfSeats;
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	public String getOwnerId() {
		return ownerId;
	}
	public void setOwnerId(String ownerId) {
		this.ownerId = ownerId;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}


	@Override
	public String toString() {
		return "application{" +
				"id=" + id +
				", vType='" + vType + '\'' +
				", vModelName='" + vModelName + '\'' +
				", vBrand='" + vBrand + '\'' +
				", noOfSeats=" + noOfSeats +
				", price=" + price +
				", ownerId='" + ownerId + '\'' +
				", status='" + status + '\'' +
				'}';
	}
}
