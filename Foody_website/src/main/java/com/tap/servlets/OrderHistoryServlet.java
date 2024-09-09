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
import javax.servlet.http.HttpSession;

import com.tap.daoimplementation.OrderHistoryImplements;
import com.tap.daoimplementation.OrderTableImplements;
import com.tap.daoimplementation.RestaurantImplements;
import com.tap.model.OrderHistory;
import com.tap.model.OrderTable;
import com.tap.model.Restaurant;
import com.tap.model.User;

@SuppressWarnings("serial")
@WebServlet("/orderHistory")
public class OrderHistoryServlet extends HttpServlet {
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        User user = (User) session.getAttribute("user");
        
        if (user != null) {
            OrderHistoryImplements orderHistoryImplements = new OrderHistoryImplements();
            List<OrderHistory> orderHistoryList = orderHistoryImplements.fetchOnUserId(user.getUserId());
            
            if (!orderHistoryList.isEmpty()) {
                List<OrderTable> orderTableList = new ArrayList<>();
                List<Restaurant> restaurantList = new ArrayList<>();
                
                for (OrderHistory oh : orderHistoryList) {
                    OrderTableImplements orderTableImplements = new OrderTableImplements();
                    OrderTable orderTable = orderTableImplements.fetchOnOrderId(oh.getOrderId());
                    orderTableList.add(orderTable);
                    
                    RestaurantImplements restaurantImplements = new RestaurantImplements();
                    Restaurant restaurant = restaurantImplements.fetchOnId(orderTable.getRestaurantId());
                    restaurantList.add(restaurant);
                }
                
                req.setAttribute("orderHistoryList", orderHistoryList);
                req.setAttribute("restaurantList", restaurantList);
                
                RequestDispatcher requestDispatcher = req.getRequestDispatcher("orderHistory.jsp");
                requestDispatcher.forward(req, resp);
            } 
            else
            {
            	resp.sendRedirect("orderHistory.jsp");
            }
            
        } 
        else {
        	resp.sendRedirect("orderHistory.jsp");
        }
        
    }
}
