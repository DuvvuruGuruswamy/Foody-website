package com.tap.servlets;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.tap.daoimplementation.MenuImplements;
import com.tap.daoimplementation.RestaurantImplements;
import com.tap.model.Menu;
import com.tap.model.Restaurant;

@SuppressWarnings("serial")
@WebServlet("/menu")
public class MenuServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
      
            int restaurantId = Integer.parseInt(req.getParameter("restaurantId"));
     
            MenuImplements menuImplements = new MenuImplements();

            List<Menu> menuItems = menuImplements.fetchOnResData(restaurantId);

            HttpSession session = req.getSession();
            session.setAttribute("itemsList", menuItems);

            RestaurantImplements restaurantImplements = new RestaurantImplements();
            Restaurant restaurant = restaurantImplements.fetchOnId(restaurantId);

            session.setAttribute("restaurant", restaurant);
            RequestDispatcher requestDispatcher = req.getRequestDispatcher("/menu.jsp");
            requestDispatcher.forward(req, resp);
        
    }
}
