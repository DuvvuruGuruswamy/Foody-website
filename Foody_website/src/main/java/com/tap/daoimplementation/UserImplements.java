package com.tap.daoimplementation;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.tap.dao.UserDAO;
import com.tap.model.User;
import com.tap.util.MyConnection;

public class UserImplements implements UserDAO{

	private static Connection con;
	private static PreparedStatement pstmt;
	private static Statement stmt;
	private static ResultSet res;
	

	public UserImplements()
	{
		MyConnection mycon=MyConnection.getMyConnection();
		con=mycon.connect();
		
	}
	@Override
	public int insertData(User u) {
		try
		{
			pstmt=con.prepareStatement("insert into `user`(`user_name`,`password`,`email`,`address`,`phone_number`) values(?,?,?,?,?)");
			pstmt.setString(1, u.getUserName());
			pstmt.setString(2, u.getPassword());
			pstmt.setString(3, u.getEmail());
			pstmt.setString(4, u.getAddress());
			pstmt.setString(5, u.getphoneNumber());
			
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
	public int deleteOnId(int user_id) {
		
		try {
			pstmt=con.prepareStatement("delete from `user` where user_id=?");
			pstmt.setInt(1, user_id);
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
	public int updatePassword(String email,String password) {
		try {
			pstmt=con.prepareStatement("update `user` set `password`=? where `email`=?");
			pstmt.setString(1,password);
			pstmt.setString(2, email);
			
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
	public List<User> fetchAllData() {
		try {
			stmt=con.createStatement();
			res=stmt.executeQuery("select * from `user`");
			User us=null;
			List<User> s=new ArrayList<User>();
			while(res.next())
			{
				us=new User(res.getInt("user_id"),res.getString("user_name"),res.getString("password"),res.getString("email"),res.getString("address"),res.getString("phone_number"));
				s.add(us);
			}
			
			return	s;
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
	public User fetchOnId(int user_id) {
		try
		{
			pstmt=con.prepareStatement("select * from `user` where `user_id`=?");
			pstmt.setInt(1, user_id);
			res=pstmt.executeQuery();
			User us=null;
			while(res.next())
			{
				us=new User(res.getInt("user_id"),res.getString("user_name"),res.getString("password"),res.getString("email"),res.getString("address"),res.getString("phone_number"));
			}
			return us;
			
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

	public User fetchOnEmail(String email) {
		try
		{
			pstmt=con.prepareStatement("select * from `user` where `email`=?");
			pstmt.setString(1, email);
			res=pstmt.executeQuery();
			User us=null;
			while(res.next())
			{
				us=new User(res.getInt("user_id"),res.getString("user_name"),res.getString("password"),res.getString("email"),res.getString("address"),res.getString("phone_number"));
			}
			return us;
			
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
	public int changePassword(String email, Long phoneNumber,String password) {
		try {
			pstmt=con.prepareStatement("update `user` set `password`=? where `email`=? && `phone_number`=?");
			pstmt.setString(1, password);
			pstmt.setString(2, email);
			pstmt.setLong(3, phoneNumber);
			
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
	
	
}
