package com.tap.dao;

import java.util.List;

import com.tap.model.Restaurant;

public interface RestaurantDAO {
	 int insertData(Restaurant r);
	 int deleteOnId(int restaurant_id);
	 int updateName(int restaurant_id,String restaurantName);
	List<Restaurant> fetchAllData();
	Restaurant fetchOnId(int resturant_id);
	List<Restaurant> fetchOnName(String restaurantName);
}
