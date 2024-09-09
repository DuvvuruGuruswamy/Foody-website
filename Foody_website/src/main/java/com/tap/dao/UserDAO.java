package com.tap.dao;

import java.util.List;

import com.tap.model.User;

public interface UserDAO {
	
	int insertData(User u);
	int deleteOnId(int user_id);
	int updatePassword(String email,String password);
	List<User> fetchAllData();
	User fetchOnId(int user_id);
	int changePassword(String email, Long phoneNumber,String password);
}
