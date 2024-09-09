package com.tap.daoimplementation;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.tap.dao.HelpLineDAO;
import com.tap.model.HelpLine;
import com.tap.util.MyConnection;

public class HelpLineImplements implements HelpLineDAO{

	private static Connection con;
	private static PreparedStatement pstmt;
	private static Statement stmt;
	private static ResultSet res;
	public HelpLineImplements()
	{
		MyConnection mycon=MyConnection.getMyConnection();
		con=mycon.connect();
	}
	@Override
	public int insertData(HelpLine h) {
		try
		{
			pstmt = con.prepareStatement("insert into `help_table`(`user_name`, `email`, `phone_number`, `message`) values(?,?,?,?)");
			pstmt.setString(1, h.getUserName());
			pstmt.setString(2, h.getEmail());
			pstmt.setLong(3, h.getPhoneNumber());
			pstmt.setString(4, h.getMessage());
			
			int e = pstmt.executeUpdate();
			return e;
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
	public int deleteOnId(int helpId) {
		try {
			pstmt=con.prepareStatement("delete from `help_table` where help_id=?");
			pstmt.setInt(1, helpId);
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
	public List<HelpLine> fetchAllData() {
		try {
			stmt=con.createStatement();
			res=stmt.executeQuery("select * from help_table");
			List<HelpLine> ar = new ArrayList<HelpLine>();
			while(res.next())
			{
				HelpLine m = new HelpLine(res.getInt("help_id"),res.getString("user_name"),res.getString("email"),res.getLong("phone_number"),res.getString("message"));
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
	public HelpLine fetchOnHelpId(int help_id) {
		try {
			pstmt=con.prepareStatement("select * from `help_table` where `help_id`=?");
			pstmt.setInt(1, help_id);
			res=pstmt.executeQuery();
			HelpLine h=null;
			while(res.next())
			{
				h=new HelpLine(res.getInt("help_id"),res.getString("user_name"),res.getString("email"),res.getLong("phone_number"),res.getString("message"));
			}
			return h;
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
