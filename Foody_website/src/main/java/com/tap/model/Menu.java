package com.tap.model;



public class Menu {
	private int menu_id;
	private int restaurant_id;
	private String menu_item_name;
	private float price;
	private String description;
	private String is_available;
	private String image_path;
	
	public Menu()
	{
		
	}
	
	
	public Menu(int menu_id, int restaurant_id, String menu_item_name, float price, String discription,
			String is_available, String image_path) {
		super();
		this.menu_id = menu_id;
		this.restaurant_id = restaurant_id;
		this.menu_item_name = menu_item_name;
		this.price = price;
		this.description = discription;
		this.is_available = is_available;
		this.image_path = image_path;
	}

	
	public Menu(int restaurant_id, String menu_item_name, float price, String description, String is_available) {
		super();
		this.restaurant_id = restaurant_id;
		this.menu_item_name = menu_item_name;
		this.price = price;
		this.description = description;
		this.is_available = is_available;
	}


	public int getMenu_id() {
		return menu_id;
	}


	public void setMenu_id(int menu_id) {
		this.menu_id = menu_id;
	}


	public int getRestaurant_id() {
		return restaurant_id;
	}


	public void setRestaurant_id(int restaurant_id) {
		this.restaurant_id = restaurant_id;
	}


	public String getMenu_item_name() {
		return menu_item_name;
	}


	public void setMenu_item_name(String menu_item_name) {
		this.menu_item_name = menu_item_name;
	}


	public float getPrice() {
		return price;
	}


	public void setPrice(float price) {
		this.price = price;
	}


	public String getDescription() {
		return description;
	}


	public void setDescription(String description) {
		this.description = description;
	}


	public String getIs_available() {
		return is_available;
	}


	public void setIs_available(String is_available) {
		this.is_available = is_available;
	}


	public String getImage_path() {
		return image_path;
	}


	public void setImage_path(String image_path) {
		this.image_path = image_path;
	}


	@Override
	public String toString() {
		return menu_id + "  " + restaurant_id + "  " + menu_item_name
				+ "  " + price + "  " + description + "  " + is_available
				+ "  " + image_path;
	}


	
		
}
