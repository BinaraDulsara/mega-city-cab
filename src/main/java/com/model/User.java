package com.model;

public class User {
    private int id;
    private String name;
    private String password;
    private String gmail;
    private String phoneNumber;
    private String role;

    // Default constructor
    public User() {
    }

    // Overloaded constructor with all attributes
    public User(String name, String password, String gmail, String phoneNumber, String role) {
        this.id = 0;
        this.name = name;
        this.password = password;
        this.gmail = gmail;
        this.phoneNumber = phoneNumber;
        this.role = role;
    }

    public void setId(int id) {
		this.id = id;
	}

	public void setName(String name) {
		this.name = name;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public void setGmail(String gmail) {
		this.gmail = gmail;
	}

	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}

	public void setRole(String role) {
		this.role = role;
	}

	// Getters for all attributes
    public int getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public String getPassword() {
        return password;
    }

    public String getGmail() {
        return gmail;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public String getRole() {
        return role;
    }
}
