package com.tap.daoimplementation;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.tap.dao.RestaurantDAO;
import com.tap.model.Restaurant;
import com.tap.util.MyConnection;

public class RestaurantImplements implements RestaurantDAO
{
	private static Connection con;
	private static PreparedStatement pstmt;
	private static Statement stmt;
	private static ResultSet res;

	public RestaurantImplements()
	{
		MyConnection mycon=MyConnection.getMyConnection();	
		con=mycon.connect();
	}
	
		
	

	@Override
	public int insertData(Restaurant r) {
		try {
			pstmt=con.prepareStatement("insert into restaurant(`restaurant_id`,`restaurant_name`,`cuisine_type`,`delivery_time`,`address`,`adminuser_id`,`rating`,`is_active`) values(?,?,?,?,?,?,?,?)");
			pstmt.setInt(1, r.getRestaurantId());
			pstmt.setString(2,r.getRestaurantName());
			pstmt.setString(3,r.getCuisineType());
			pstmt.setString(4,r.getDeliveryTime());
			pstmt.setString(5,r.getAddress());
			pstmt.setInt(6,r.getAdminUserId());
			pstmt.setDouble(7,r.getRating());
			pstmt.setString(8,r.getIsActive());
			
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
	public int deleteOnId(int resautant_id) {

		try
		{
			pstmt=con.prepareStatement("delete from `restaurant` where `restaurant_id`=?");
			pstmt.setInt(1,resautant_id);
			
			int x=pstmt.executeUpdate();
			return x;
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		finally {
			MyConnection.getMyConnection().disConnect(res, pstmt, con);
		}
		return 0;
	}

	@Override
	public int updateName(int restaurant_id,String name) {
		try
		{
			pstmt=con.prepareStatement("update `restaurant` set `restaurant_name`=? where `restaurant_id`=?");
			pstmt.setString(1, name);
			pstmt.setInt(2,restaurant_id);
			
			int x=pstmt.executeUpdate();
			return x;
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		finally {
			MyConnection.getMyConnection().disConnect(res, pstmt, con);
		}
		return 0;
	}

	@Override
	public List<Restaurant> fetchAllData() {
		try
		{
			
			stmt=con.createStatement();
			res=stmt.executeQuery("select * from `restaurant`");
			List<Restaurant> r=new ArrayList<Restaurant>();
			
			while(res.next())
			{
				Restaurant rs=new Restaurant(res.getInt(1), res.getString(2), res.getString(3), res.getString(4),res.getString(5), res.getInt(6), res.getDouble(7), res.getString(8),res.getString(9));
				r.add(rs);
			}
			return r;
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		finally {
			MyConnection.getMyConnection().disConnect(res, stmt, con);
		}
		return null;
	}

	@Override
	public Restaurant fetchOnId(int restaurant_id) {
		try
		{
			
			pstmt=con.prepareStatement("select * from `restaurant` where `restaurant_id`=?");
			pstmt.setInt(1,restaurant_id);
			
			res=pstmt.executeQuery();
			Restaurant rmi = null;
			if(res.next()) {
			rmi=new Restaurant(res.getInt(1), res.getString(2), res.getString(3), res.getString(4),res.getString(5), res.getInt(6), res.getDouble(7), res.getString(8),res.getString(9));
			}
			return rmi;
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		finally {
			MyConnection.getMyConnection().disConnect(res, pstmt, con);
		}
		return null;
	}
	
	@Override
	public List<Restaurant> fetchOnName(String restaurantName) {
		try
		{
			
			pstmt=con.prepareStatement("select * from `restaurant` where `restaurant_name` like ?");
			
			String s="%"+restaurantName+"%";
			pstmt.setString(1,s);
			
			res=pstmt.executeQuery();
			ArrayList<Restaurant> arrayList = new ArrayList<Restaurant>();
			while(res.next()) {
			Restaurant rmi = new Restaurant(res.getInt(1), res.getString(2), res.getString(3), res.getString(4),res.getString(5), res.getInt(6), res.getDouble(7), res.getString(8),res.getString(9));
			arrayList.add(rmi);
			}
			return arrayList;
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		finally {
			MyConnection.getMyConnection().disConnect(res, pstmt, con);
		}
		return null;
	}
	
	
	

	
}
