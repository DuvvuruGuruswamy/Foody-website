package com.tap.model;



public class Restaurant {

	private int restaurant_id;
	private String restaurantName;
	private String cuisineType;
	private String deliveryTime;
	private String address;
	private int adminUserId;
	private double rating;
	private String isActive;
	private String image_path;
	
	public Restaurant()
	{
		
	}
	
	public Restaurant(int restaurant_id, String restaurantName, String cuisineType, String deliveryTime, String address,
			int adminUserId, double rating, String isActive, String image_path) {
		super();
		this.restaurant_id = restaurant_id;
		this.restaurantName = restaurantName;
		this.cuisineType = cuisineType;
		this.deliveryTime = deliveryTime;
		this.address = address;
		this.adminUserId = adminUserId;
		this.rating = rating;
		this.isActive = isActive;
		this.image_path = image_path;
	}
	

	public Restaurant(String restaurantName, String cuisineType, String deliveryTime, String address, int adminUserId,
			double rating, String isActive, String image_path) {
		super();
		this.restaurantName = restaurantName;
		this.cuisineType = cuisineType;
		this.deliveryTime = deliveryTime;
		this.address = address;
		this.adminUserId = adminUserId;
		this.rating = rating;
		this.isActive = isActive;
		this.image_path = image_path;
	}

	public int getRestaurantId() {
		return restaurant_id;
	}


	public void setRestaurantId(int restaurant_id) {
		this.restaurant_id = restaurant_id;
	}


	public String getRestaurantName() {
		return restaurantName;
	}


	public void setRestaurantName(String restaurantName) {
		this.restaurantName = restaurantName;
	}


	public String getCuisineType() {
		return cuisineType;
	}


	public void setCuisineType(String cuisineType) {
		this.cuisineType = cuisineType;
	}


	public String getDeliveryTime() {
		return deliveryTime;
	}


	public void setDeliveryTime(String deliveryTime) {
		this.deliveryTime = deliveryTime;
	}


	public String getAddress() {
		return address;
	}


	public void setAddress(String address) {
		this.address = address;
	}


	public int getAdminUserId() {
		return adminUserId;
	}


	public void setAdminUserId(int adminUserId) {
		this.adminUserId = adminUserId;
	}


	public double getRating() {
		return rating;
	}


	public void setRating(double rating) {
		this.rating = rating;
	}


	public String getIsActive() {
		return isActive;
	}


	public void setIsActive(String isActive) {
		this.isActive = isActive;
	}


	public String getImgpath() {
		return image_path;
	}


	public void setImgpath(String imgpath) {
		this.image_path = imgpath;
	}

	

	@Override
	public String toString() {
		return restaurant_id + "  " + restaurantName + "  " + cuisineType
				+"  " + deliveryTime + "  " + address + "  " + adminUserId
				+ "  " + rating + "  " + isActive ;
	}


	

	
}
