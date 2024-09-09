package com.tap.daoimplementation;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.tap.dao.OrderTableDAO;
import com.tap.model.OrderTable;
import com.tap.util.MyConnection;

public class OrderTableImplements implements OrderTableDAO {
	private static Connection con;
	private static PreparedStatement pstmt;
	private static Statement stmt;
	private static ResultSet res;
	private OrderTable orm;

    public OrderTableImplements() {
        MyConnection mycon = MyConnection.getMyConnection();
        con = mycon.connect();
    }

    @Override
    public int insertData(OrderTable order) {
        try {
            pstmt = con.prepareStatement("insert into `order_table`(`restaurant_id`, `user_id`, `total_amount`,`status`, `payment_mode`, `address`) values(?, ?, ?, ?, ?, ?)");
            pstmt.setInt(1, order.getRestaurantId());
            pstmt.setInt(2, order.getUserId());
            pstmt.setFloat(3, order.getTotalAmount());
            pstmt.setString(4, order.getStatus());
            pstmt.setString(5, order.getPaymentMode());
            pstmt.setString(6, order.getAddress());
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
    public int deleteOnId(int orderId) {
        try {
            pstmt = con.prepareStatement("delete from `order_table` where order_id=?");
            pstmt.setInt(1, orderId);
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
    public int updateOrderStatus(int orderId, String status) {
        try {
            pstmt = con.prepareStatement("update `order_table` set `status`=? where `order_id`=?");
            pstmt.setString(1, status);
            pstmt.setInt(2, orderId);
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
    public List<OrderTable> fetchAllData() {
        try {
            stmt = con.createStatement();
            res = stmt.executeQuery("select * from `order_table`");
            List<OrderTable> orders = new ArrayList<>();
            while (res.next()) {
                OrderTable order = new OrderTable(
                    res.getInt("order_id"),
                    res.getInt("restaurant_id"),
                    res.getInt("user_id"),
                    res.getString("order_date"),
                    res.getInt("total_amount"),
                    res.getString("payment_mode"),
                    res.getString("status"),
                    res.getString("address")
                );
                orders.add(order);
            }
            
            return orders;
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
    public OrderTable fetchOnOrderId(int orderId) {
        try {
            pstmt = con.prepareStatement("select * from `order_table` where `order_id`=?");
            pstmt.setInt(1, orderId);
            res = pstmt.executeQuery();
            if (res.next()) {
                 orm = new OrderTable(
                		res.getInt("order_id"),
                        res.getInt("restaurant_id"),
                        res.getInt("user_id"),
                        res.getString("order_date"),
                        res.getInt("total_amount"),
                        res.getString("payment_mode"),
                        res.getString("status"),
                        res.getString("address")
                );
            }
            
            return orm;
        } 
        catch (SQLException e) {
            e.printStackTrace();
        }
        finally {
			MyConnection.getMyConnection().disConnect(res, pstmt, con);
		}
        return null;
    }
    
    public int getMaxOrderId() {
        int maxOrderId = 0; 
        String query = "SELECT MAX(order_id) AS max_order_id FROM order_table";

        try {
        	
        pstmt = con.prepareStatement(query);
            
            res = pstmt.executeQuery();
            if (res.next()) {
                maxOrderId = res.getInt("max_order_id"); 
            }
        } 
        catch (SQLException e) {
            e.printStackTrace(); 
        }
        finally {
			MyConnection.getMyConnection().disConnect(res, pstmt, con);
		}

        return maxOrderId;
    }
}

