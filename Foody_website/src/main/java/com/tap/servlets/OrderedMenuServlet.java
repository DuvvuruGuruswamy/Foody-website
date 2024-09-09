package com.tap.servlets;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tap.daoimplementation.MenuImplements;
import com.tap.daoimplementation.OrderItemImplements;
import com.tap.daoimplementation.OrderTableImplements;
import com.tap.daoimplementation.RestaurantImplements;
import com.tap.model.Menu;
import com.tap.model.OrderItem;
import com.tap.model.OrderTable;
import com.tap.model.Restaurant;

@SuppressWarnings("serial")
@WebServlet("/orderedMenu")
public class OrderedMenuServlet extends HttpServlet {
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int orderId = Integer.parseInt(req.getParameter("orderId"));
		OrderItemImplements orderItemImplements = new OrderItemImplements();
		List<OrderItem> menuFromOrderItem = orderItemImplements.fetchOnOrderId(orderId);
		ArrayList<Menu> menuList = new ArrayList<Menu>(); 
		for(OrderItem orderItem:menuFromOrderItem)
		{
			int menuId = orderItem.getMenuId();
			MenuImplements menuImplements = new MenuImplements();
			Menu menu = menuImplements.fetchOnMenuId(menuId);
			menuList.add(menu);
			
		}
		
		OrderTableImplements orderTableImplements = new OrderTableImplements();
		OrderTable fetchOrderTable= orderTableImplements.fetchOnOrderId(orderId);
		
		RestaurantImplements restaurantImplements = new RestaurantImplements();
		Restaurant fetch = restaurantImplements.fetchOnId(fetchOrderTable.getRestaurantId());
		String restaurantName = fetch.getRestaurantName();
		req.setAttribute("menuList", menuList);
		req.setAttribute("restaurantName", restaurantName);
		RequestDispatcher requestDispatcher = req.getRequestDispatcher("/orderedMenuList.jsp");
		requestDispatcher.forward(req, resp);
		
	}

}
