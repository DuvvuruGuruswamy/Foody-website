package com.tap.dao;

import java.util.List;

import com.tap.model.OrderHistory;

public interface OrderHistoryDAO {
	int insertData(OrderHistory orderHistory);
    int deleteOnId(int orderHistoryId);
    int updateStatus(int orderHistoryId, String status);
    List<OrderHistory> fetchAllData();
    OrderHistory fetchOnOrderHistoryId(int orderHistoryId);
}
