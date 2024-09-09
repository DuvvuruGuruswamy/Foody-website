package com.tap.daoimplementation;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.tap.dao.OrderItemDAO;
import com.tap.model.OrderItem;
import com.tap.util.MyConnection;

public class OrderItemImplements implements OrderItemDAO {
	private static Connection con;
	private static PreparedStatement pstmt;
	private static Statement stmt;
	private static ResultSet res;
	private OrderItem oi;

    public OrderItemImplements() {
        MyConnection mycon = MyConnection.getMyConnection();
        con = mycon.connect();
    }

    @Override
    public int insertData(OrderItem orderItem) {
        try {
            pstmt = con.prepareStatement("insert into `order_item`(`order_id`, `menu_id`, `quantity`, `sub_total`) values(?, ?, ?, ?)");
            pstmt.setInt(1, orderItem.getOrderId());
            pstmt.setInt(2, orderItem.getMenuId());
            pstmt.setInt(3, orderItem.getQuantity());
            pstmt.setFloat(4, orderItem.getSubTotal());
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
    public int deleteOnId(int orderItemId) {
        try {
            pstmt = con.prepareStatement("delete from `order_item` where order_item_id=?");
            pstmt.setInt(1, orderItemId);
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
    public int updateQuantity(int orderItemId, int quantity) {
        try {
            pstmt = con.prepareStatement("update `order_item` set `quantity`=? where `order_item_id`=?");
            pstmt.setInt(1, quantity);
            pstmt.setInt(2, orderItemId);
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
    public List<OrderItem> fetchAllData() {
        try {
            stmt = con.createStatement();
            res = stmt.executeQuery("select * from `order_item`");
            List<OrderItem> orderItems = new ArrayList<>();
            while (res.next()) {
                OrderItem orderItem = new OrderItem(
                    res.getInt(1),
                    res.getInt(2),
                    res.getInt(3),
                    res.getInt(4),
                    res.getFloat(5)
                );
                orderItems.add(orderItem);
            }
            return orderItems;
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
    public OrderItem fetchOnOrderItemId(int orderItemId) {
        try {
            pstmt = con.prepareStatement("select * from `order_item` where `order_item_id`=?");
            pstmt.setInt(1, orderItemId);
            res = pstmt.executeQuery();
            if (res.next()) {
                 oi = new OrderItem(
                    res.getInt(1),
                    res.getInt(2),
                    res.getInt(3),
                    res.getInt(4),
                    res.getFloat(5)
                );
            }
            return oi;
        } 
        catch (SQLException e) {
            e.printStackTrace();
        }
        finally {
			MyConnection.getMyConnection().disConnect(res, pstmt, con);
		}
        return null;
    }
    
    public List<OrderItem> fetchOnOrderId(int orderId) {
        try {
            pstmt = con.prepareStatement("select * from `order_item` where `order_id`=?");
            pstmt.setInt(1, orderId);
            res = pstmt.executeQuery();
            ArrayList<OrderItem> ar=new ArrayList<OrderItem>();
            
            while(res.next())
            {
            	OrderItem or = new OrderItem(res.getInt("order_item_id"), res.getInt("order_id"),res.getInt("menu_id"),res.getInt("quantity"), res.getFloat("sub_total"));
            	ar.add(or);
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
}
