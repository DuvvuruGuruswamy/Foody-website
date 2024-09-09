package com.tap.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.ResultSet;
import java.sql.Statement;

public class MyConnection {
	
	private MyConnection()
	{
		
	}

		static private MyConnection mycon=new MyConnection();
		
	public static MyConnection getMyConnection()
	{
		return mycon;
	}
	public Connection connect()
	{
		try
		{
			Class.forName("com.mysql.cj.jdbc.Driver");
			return DriverManager.getConnection("jdbc:mysql://localhost:3306/online_food","root","root");
			
		}
		catch(ClassNotFoundException | SQLException e)
		{
			e.printStackTrace();
			return null;
		}
	}
	public void disConnect(ResultSet res, Statement stmt, Connection con) {
	    try {
	        if (res != null) {
	            res.close();
	        }
	        if (stmt != null) {
	            stmt.close();
	        }
	        if (con != null) {
	            con.close();
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	}

	

}
