package com.tap.servlets;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tap.daoimplementation.RestaurantImplements;
import com.tap.model.Restaurant;

@SuppressWarnings("serial")
@WebServlet("/search")
public class SearchServlet extends HttpServlet {
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String name = req.getParameter("query");
		RestaurantImplements restaurantImplements = new RestaurantImplements();
		List<Restaurant> restaurantList = restaurantImplements.fetchOnName(name);
		
		req.setAttribute("restaurantList", restaurantList);
		RequestDispatcher requestDispatcher = req.getRequestDispatcher("/search.jsp");
		requestDispatcher.forward(req, resp);
	}
	
}
