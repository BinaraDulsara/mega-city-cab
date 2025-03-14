package com.model;

public class newUser extends user {
	private boolean verified;
	
	public newUser( String name, String password, String gmail, String phoneNumber, String role,String verification) {
		super( name, password, gmail, phoneNumber, role);
		this.verified=this.updateVerified(verification);
	}

	public boolean isVerified() {
		return verified;
	}

	public void setVerified(boolean verified) {
		this.verified = verified;
	}

	public boolean updateVerified(String Dbinput){
		if("verified".equals(Dbinput)) {
			return true;
		}else {
			return false;
		}
	}
}
