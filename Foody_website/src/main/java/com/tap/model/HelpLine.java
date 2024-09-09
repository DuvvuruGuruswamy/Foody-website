package com.tap.model;

public class HelpLine {

	private int helpId;
	private String userName;
	private String email;
	private Long phoneNumber;
	private String message;
	
	public HelpLine(int helpId, String userName, String email, Long phoneNumber, String message) {
		super();
		this.helpId = helpId;
		this.userName = userName;
		this.email = email;
		this.phoneNumber = phoneNumber;
		this.message = message;
	}

	public HelpLine(String userName, String email, Long phoneNumber, String message) {
		super();
		this.userName = userName;
		this.email = email;
		this.phoneNumber = phoneNumber;
		this.message = message;
	}

	public int getHelpId() {
		return helpId;
	}

	public void setHelpId(int helpId) {
		this.helpId = helpId;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public Long getPhoneNumber() {
		return phoneNumber;
	}

	public void setPhoneNumber(Long phoneNumber) {
		this.phoneNumber = phoneNumber;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	@Override
	public String toString() {
		return "HelpLine [helpId=" + helpId + ", userName=" + userName + ", email=" + email
				+ ", phoneNumber=" + phoneNumber + ", message=" + message + "]";
	}
	
	
}
