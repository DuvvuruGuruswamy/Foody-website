package com.tap.model;

public class CartItem {
	private int itemId;
	private int restaurantId;
	private String restaurantName;
	private String itemName;
	private float price;
	private int quantity;
	private String isAvailable;
	private float subTotal=price*quantity;
	private String image;
	
	public CartItem() {
		super();
	}

	public CartItem(int itemId, int restaurantId, String restaurantName, String itemName, float price, int quantity,String isAvailable, float subTotal,String image) {
		super();
		this.itemId = itemId;
		this.restaurantId = restaurantId;
		this.restaurantName = restaurantName;
		this.itemName = itemName;
		this.price = price;
		this.quantity = quantity;
		this.isAvailable=isAvailable;
		this.subTotal = subTotal;
		this.image = image;
	}

	
	public CartItem(int itemId, int restaurantId, String restaurantName, String itemName, float price, int quantity,String isAvailable,String image) {
		super();
		this.itemId = itemId;
		this.restaurantId = restaurantId;
		this.restaurantName = restaurantName;
		this.itemName = itemName;
		this.price = price;
		this.quantity = quantity;
		this.isAvailable =isAvailable;
		this.image = image;
	}

	
	public int getItemId() {
		return itemId;
	}

	public void setItemId(int itemId) {
		this.itemId = itemId;
	}

	public int getRestaurantId() {
		return restaurantId;
	}
	
	public void setRestaurantId(int restaurantId) {
		this.restaurantId = restaurantId;
	}

	public String getRestaurantName() {
		return restaurantName;
	}

	public void setRestaurantName(String restaurantName) {
		this.restaurantName = restaurantName;
	}
	
	public String getItemName() {
		return itemName;
	}

	public void setItemName(String itemName) {
		this.itemName = itemName;
	}

	public float getPrice() {
		return price;
	}

	public void setPrice(float price) {
		this.price = price;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	
	public String getIsAvailable() {
		return isAvailable;
	}

	public void setIsAvailable(String isAvailable) {
		this.isAvailable = isAvailable;
	}

	public float getSubTotal() {
		return subTotal;
	}

	public void setSubTotal(float price ,int quantity) {
		this.subTotal = price*quantity;
	}

	
	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	@Override
	public String toString() {
		return "CartItem [itemId=" + itemId + ", restaurantId=" + restaurantId + ", restaurantName=" + restaurantName
				+ ", itemName=" + itemName + ", price=" + price + ", quantity=" + quantity + ", isAvailable="
				+ isAvailable + ", subTotal=" + subTotal + ", image=" + image + "]";
	}

	
	
	
}
