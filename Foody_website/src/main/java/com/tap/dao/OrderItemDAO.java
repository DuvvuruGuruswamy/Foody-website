package com.tap.dao;

import java.util.List;

import com.tap.model.OrderItem;

public interface OrderItemDAO {
	int insertData(OrderItem u);
    int deleteOnId(int orderItemId);
    int updateQuantity(int orderItemId, int quantity);
    List<OrderItem> fetchAllData();
    OrderItem fetchOnOrderItemId(int orderItemId);
}
