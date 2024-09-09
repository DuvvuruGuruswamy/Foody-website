package com.tap.daoimplementation;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.tap.dao.OrderHistoryDAO;
import com.tap.model.OrderHistory;
import com.tap.util.MyConnection;

public class OrderHistoryImplements implements OrderHistoryDAO {
    private static Connection con;
    private static PreparedStatement pstmt;
    private static Statement stmt;
    private static ResultSet res;
	private OrderHistory oh;

    public OrderHistoryImplements() {
        MyConnection mycon = MyConnection.getMyConnection();
        con = mycon.connect();
    }

    @Override
    public int insertData(OrderHistory orderHistory) {
        try {
            pstmt = con.prepareStatement("insert into `order_history`(`order_id`, `user_id`, `total_amount`, `status`) values(?, ?, ?, ?)");
            pstmt.setInt(1, orderHistory.getOrderId());
            pstmt.setInt(2, orderHistory.getUserId());
            pstmt.setFloat(3, orderHistory.getTotalAmount());
            pstmt.setString(4, orderHistory.getStatus());
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
    public int deleteOnId(int orderHistoryId) {
        try {
            pstmt = con.prepareStatement("delete from `order_history` where order_history_id=?");
            pstmt.setInt(1, orderHistoryId);
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
    public int updateStatus(int orderHistoryId, String status) {
        try {
            pstmt = con.prepareStatement("update `order_history` set `status`=? where `order_history_id`=?");
            pstmt.setString(1, status);
            pstmt.setInt(2, orderHistoryId);
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
    public List<OrderHistory> fetchAllData() {
        try {
            stmt = con.createStatement();
            res = stmt.executeQuery("select * from `order_history`");
            List<OrderHistory> orderHistories = new ArrayList<>();
            while (res.next()) {
                OrderHistory orderHistory = new OrderHistory(
                    res.getInt(1),
                    res.getInt(2),
                    res.getInt(3),
                    res.getString(4),
                    res.getFloat(5),
                    res.getString(6)
                );
                orderHistories.add(orderHistory);
            }
            return orderHistories;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        finally {
			MyConnection.getMyConnection().disConnect(res, stmt, con);
		}
        return null;
    }

    @Override
    public OrderHistory fetchOnOrderHistoryId(int orderHistoryId) {
        try {
            pstmt = con.prepareStatement("select * from `order_history` where `order_history_id`=?");
            pstmt.setInt(1, orderHistoryId);
            res = pstmt.executeQuery();
            if (res.next()) {
                oh = new OrderHistory(
                    res.getInt(1),
                    res.getInt(2),
                    res.getInt(3),
                    res.getString(4),
                    res.getFloat(5),
                    res.getString(6)
                );
            }
			return oh;
        } 
        catch (SQLException e) {
            e.printStackTrace();
        }
        finally {
			MyConnection.getMyConnection().disConnect(res, pstmt, con);
		}
        return null;
    }
    
    public List<OrderHistory> fetchOnUserId(int userId) {
        try {
            pstmt = con.prepareStatement("select * from `order_history` where `user_id`=?");
            pstmt.setInt(1, userId);
            res = pstmt.executeQuery();
            List<OrderHistory> orderHistories = new ArrayList<>();
            while (res.next()) {
                oh = new OrderHistory(
                    res.getInt(1),
                    res.getInt(2),
                    res.getInt(3),
                    res.getString(4),
                    res.getFloat(5),
                    res.getString(6)
                );
                orderHistories.add(oh);
                
            }
			return orderHistories;
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

