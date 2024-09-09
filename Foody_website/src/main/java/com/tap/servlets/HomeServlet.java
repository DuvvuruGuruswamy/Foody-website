package com.tap.servlets;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.tap.daoimplementation.RestaurantImplements;
import com.tap.model.Restaurant;

@SuppressWarnings("serial")
@WebServlet("/homeStart")
public class HomeServlet extends HttpServlet {
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		RestaurantImplements restaurantImplements = new RestaurantImplements();
        List<Restaurant> displayData = restaurantImplements.fetchAllData();
        
        HttpSession session = req.getSession();
        session.setAttribute("restaurantDetails", displayData);
        
        resp.sendRedirect("home.jsp");
	}

}
