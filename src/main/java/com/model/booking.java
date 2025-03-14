package com.model;

public class booking {
	private int id;
	private String userId;
	private String vid;
	private String startingDate;
	private int total;
	private int duration;
	
	
	public booking( String userId, String vid, String startingDate, int duration,int total) {

		this.id = 0;
		this.userId = userId;
		this.vid = vid;
		this.startingDate = startingDate;
		this.duration = duration;
		this.total = total;

	}


	public int getId() {
		return id;
	}


	public void setId(int id) {
		this.id = id;
	}


	public String getUserId() {
		return userId;
	}


	public void setUserId(String userId) {
		this.userId = userId;
	}


	public String getVid() {
		return vid;
	}


	public void setVid(String vid) {
		this.vid = vid;
	}


	public String getStartingDate() {
		return startingDate;
	}


	public void setStartingDate(String startingDate) {
		this.startingDate = startingDate;
	}


	public int getTotal() {
		return total;
	}


	public void setTotal(int total) {
		this.total = total;
	}


	public int getDuration() {
		return duration;
	}


	public void setDuration(int duration) {
		this.duration = duration;
	}
	
	

}
