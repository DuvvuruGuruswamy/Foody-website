package com.tap.dao;

import java.util.List;

import com.tap.model.OrderTable;

public interface OrderTableDAO {
	  	int insertData(OrderTable order);
	    int deleteOnId(int orderId);
	    int updateOrderStatus(int orderId, String status);
	    List<OrderTable> fetchAllData();
	    OrderTable fetchOnOrderId(int orderId);
}
