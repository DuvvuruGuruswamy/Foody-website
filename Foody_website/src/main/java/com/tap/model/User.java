package com.tap.model;

public class User {

	private int userId;
	private String userName;
	private String password;
	private String email;
	private String address;
	private String phoneNumber;
	private String profilePicture;
	
	public User()
	{
		
	}
	
	public User(String userName, String password, String email, String address, String phoneNumber) {
		
		this.userName = userName;
		this.password = password;
		this.email = email;
		this.address = address;
		this.phoneNumber = phoneNumber;
		//this.profilePicture = profilePicture;
	}

	public User(int userId, String userName, String password, String email, String address, String phoneNumber) {
		super();
		this.userId = userId;
		this.userName = userName;
		this.password = password;
		this.email = email;
		this.address = address;
		this.phoneNumber = phoneNumber;
		//this.profilePicture = profilePicture;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getphoneNumber() {
		return phoneNumber;
	}

	public void setphonenumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}


	public String getProfilePicture() {
		return profilePicture;
	}

	public void setProfilePicture(String profilePicture) {
		this.profilePicture = profilePicture;
	}

	@Override
	public String toString() {
		return "userId=" + userId + ", userName=" + userName + ", password=" + password + ", email=" + email
				+ ", address=" + address + ", phoneNumber=" + phoneNumber + ", profilePicture=" + profilePicture;
	}

	
	
}
