package com.tap.dao;

import java.util.List;

import com.tap.model.Menu;

public interface MenuDAO {
	
	int insertData(Menu m);
	int deleteOnId(int menu_id);
	int updateMenuItemName(int menu_id,String menu_item_name);
	List<Menu> fetchAllData();
	Menu fetchOnMenuId(int Menu_id);
	
}
