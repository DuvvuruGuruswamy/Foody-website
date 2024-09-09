package com.tap.servlets;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.tap.daoimplementation.OrderHistoryImplements;
import com.tap.daoimplementation.OrderItemImplements;
import com.tap.daoimplementation.OrderTableImplements;
import com.tap.model.Cart;
import com.tap.model.CartItem;
import com.tap.model.OrderHistory;
import com.tap.model.OrderItem;
import com.tap.model.OrderTable;
import com.tap.model.User;

@SuppressWarnings("serial")
@WebServlet("/order")
public class OrderServlet extends HttpServlet {
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Float totalAmount = Float.parseFloat(req.getParameter("totalAmount"));
        String paymentMode = req.getParameter("paymentMode");
        String addressLine = req.getParameter("addressLine");
        String city = req.getParameter("city");
        String state = req.getParameter("state");
        String zipcode = req.getParameter("zipCode");
        String status = "pending";
        
        String address = addressLine+", "+city+", "+state+", "+zipcode;
        HttpSession session = req.getSession();
        Cart cart = (Cart) session.getAttribute("cart");
        if (cart == null || cart.getItems().isEmpty()) {
            resp.sendRedirect("cart.jsp"); // Redirect to cart if it's empty
            return;
        }

        User user = (User) session.getAttribute("user");
       


        
        
        OrderTableImplements orderTableImplements = new OrderTableImplements();
        OrderTable orderTable = new OrderTable(cart.getItems().values().iterator().next().getRestaurantId(),user.getUserId(),totalAmount,status,paymentMode, address);
        orderTableImplements.insertData(orderTable); 
        
        OrderTableImplements orderTableImplements1 = new OrderTableImplements();
        int orderId = orderTableImplements1.getMaxOrderId();
   
        for (CartItem item : cart.getItems().values()) {
            OrderItem orderItem = new OrderItem(
                orderId,
                item.getItemId(),
                item.getQuantity(),
                item.getPrice() * item.getQuantity()
            );
        OrderItemImplements orderItemImplements = new OrderItemImplements();
            orderItemImplements.insertData(orderItem);
        }

  
        OrderHistory orderHistory = new OrderHistory(
            orderId,
            user.getUserId(),
            totalAmount,
            status
        );
        OrderHistoryImplements orderHistoryImplements = new OrderHistoryImplements();
        orderHistoryImplements.insertData(orderHistory);

        req.setAttribute("orderId", orderId);
        req.setAttribute("totalAmount", totalAmount);
        req.setAttribute("paymentMode", paymentMode);
        req.setAttribute("status", status);
        
        RequestDispatcher dispatcher = req.getRequestDispatcher("orderConfirmed.jsp");
        dispatcher.forward(req, resp);


        
    }
}
