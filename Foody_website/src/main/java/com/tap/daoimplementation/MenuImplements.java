package com.tap.daoimplementation;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.tap.dao.MenuDAO;
import com.tap.model.Menu;
import com.tap.util.MyConnection;

public class MenuImplements implements MenuDAO
{
	private static Connection con;
	private static PreparedStatement pstmt;
	private static Statement stmt;
	private static ResultSet res;
	public MenuImplements()
	{
		MyConnection mycon=MyConnection.getMyConnection();
		con=mycon.connect();
	}

	@Override
	public int insertData(Menu m) {
		try {
			
			pstmt=con.prepareStatement("insert into `menu`(`menu_id`,`restaurant_id`,`menu_item_name`,`price`,`description`,`is_available`) values(?,?,?,?,?,?)");
			pstmt.setInt(1, m.getMenu_id());
			pstmt.setInt(2, m.getRestaurant_id());
			pstmt.setString(3, m.getMenu_item_name());
			pstmt.setFloat(4, m.getPrice());
			pstmt.setString(5, m.getDescription());
			pstmt.setString(6, m.getIs_available());
			
			int x=pstmt.executeUpdate();
			return x;
		} 
		catch (SQLException e) {
			e.printStackTrace();
		}
		finally {
			MyConnection.getMyConnection().disConnect(res, pstmt, con);
		}
		return 0;
	}

	@Override
	public int deleteOnId(int menu_id) {
		try {
			pstmt=con.prepareStatement("delete from `menu` where menu_id=?");
			pstmt.setInt(1, menu_id);
			int x=pstmt.executeUpdate();
			return x;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		finally {
			MyConnection.getMyConnection().disConnect(res, pstmt, con);
		}
		
		return 0;
	}

	@Override
	public int updateMenuItemName(int menu_id, String menu_item_name) {
		try {
			pstmt=con.prepareStatement("update `menu` set `menu_item_name`=? where `menu_id`=?");
			pstmt.setInt(2, menu_id);
			pstmt.setString(1, menu_item_name);
			int x=pstmt.executeUpdate();
			return x;
		} 
		catch (SQLException e) {
			e.printStackTrace();
		}
		finally {
			MyConnection.getMyConnection().disConnect(res, pstmt, con);
		}
		
		return 0;
	}

	@Override
	public List<Menu> fetchAllData() {

		try {
			stmt=con.createStatement();
			res=stmt.executeQuery("select * from menu");
			List<Menu> ar = new ArrayList<Menu>();
			while(res.next())
			{
				Menu m = new Menu(res.getInt("menu_id"),res.getInt("restaurant_id"),res.getString("menu_item_name"),res.getFloat("price"),res.getString("description"),res.getString("is_available"),res.getString("image_path"));
				ar.add(m);
			}
			return ar;
		} 
		catch (SQLException e) {
			e.printStackTrace();
		}
		finally {
			MyConnection.getMyConnection().disConnect(res, stmt, con);
		}
		
		return null;
	}

	@Override
	public Menu fetchOnMenuId(int menu_id) {
		try {
			pstmt=con.prepareStatement("select * from `menu` where `menu_id`=?");
			pstmt.setInt(1, menu_id);
			res=pstmt.executeQuery();
			Menu m=null;
			while(res.next())
			{
				m=new Menu(res.getInt("menu_id"),res.getInt("restaurant_id"),res.getString("menu_item_name"),res.getFloat("price"),res.getString("description"),res.getString("is_available"),res.getString("image_path"));
			}
			return m;
		} 
		catch (SQLException e) {
			e.printStackTrace();
		}
		finally {
			MyConnection.getMyConnection().disConnect(res, pstmt, con);
		}
		return null;
	}


	public List<Menu> fetchOnResData(int restaurantId) {

		try {
			pstmt=con.prepareStatement("select * from menu where restaurant_id=?");
			pstmt.setInt(1, restaurantId);
			res=pstmt.executeQuery();
			List<Menu> ar = new ArrayList<Menu>();
			while(res.next())
			{
				Menu m = new Menu(res.getInt("menu_id"),res.getInt("restaurant_id"),res.getString("menu_item_name"),res.getFloat("price"),res.getString("description"),res.getString("is_available"),res.getString("image_path"));
				ar.add(m);
			}
			return ar;
		} 
		catch (SQLException e) {
			e.printStackTrace();
		}
		finally {
			MyConnection.getMyConnection().disConnect(res, pstmt, con);
		}
		
		return null;
	}

	public ResultSet fetchOnOrderId(int orderId) {

		try {
			pstmt=con.prepareStatement("select * from menu where order_id=?");
			pstmt.setInt(1, orderId);
			res=pstmt.executeQuery();
			return res;
		} 
		catch (SQLException e) {
			e.printStackTrace();
		}
		finally {
			MyConnection.getMyConnection().disConnect(res, pstmt, con);
		}
		
		return null;
	}
	
	
}
