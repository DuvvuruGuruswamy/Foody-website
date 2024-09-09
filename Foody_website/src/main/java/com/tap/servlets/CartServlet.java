package com.tap.servlets;

import java.io.IOException;
import java.util.Collection;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.tap.daoimplementation.MenuImplements;
import com.tap.daoimplementation.RestaurantImplements;
import com.tap.model.Cart;
import com.tap.model.CartItem;
import com.tap.model.Menu;
import com.tap.model.Restaurant;

@SuppressWarnings("serial")
@WebServlet("/cart")
public class CartServlet extends HttpServlet {
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        HttpSession session = req.getSession();
        Cart cart = (Cart) session.getAttribute("cart");

        
        if(action.equals("Add to cart"))
        {
        	add(req,cart,session);
            resp.sendRedirect("menu.jsp");
        }
        else if(action.equals("increase"))
        {
        	updateIncrease(req,cart,session);
        	resp.sendRedirect("cart.jsp");
        }
        else if(action.equals("decrease"))
        {
        	updateDecrease(req,cart,session);
        	resp.sendRedirect("cart.jsp");
        }
        else if(action.equals("remove"))
        {
        	int itemId = Integer.parseInt(req.getParameter("itemId"));
        	cart.removeItem(itemId);
        	resp.sendRedirect("cart.jsp");
        }
        else
        {
        	req.setAttribute("problem", "someProblem");
        	RequestDispatcher requestDispatcher = req.getRequestDispatcher("/problems.jsp");
        	requestDispatcher.forward(req, resp);
        }
        
    }
    
    public void add(HttpServletRequest req,Cart cart,HttpSession session)
    {
    	int menuId = Integer.parseInt(req.getParameter("menuId"));
    	int quantity = Integer.parseInt(req.getParameter("quantity"));
    	
    	
    	MenuImplements menuImplements = new MenuImplements();
    	Menu fetch = menuImplements.fetchOnMenuId(menuId);
    	
    	RestaurantImplements restaurantImplements = new RestaurantImplements();
    	Restaurant fetchRes = restaurantImplements.fetchOnId(fetch.getRestaurant_id());
    	int resId = 0;
    	if(cart != null) {
    		Map<Integer, CartItem> items = cart.getItems();
        	Collection<CartItem> values = items.values();
        	
        	for(CartItem item : values) {
        		resId = item.getRestaurantId();
        	}
    	}
    	if(cart == null || resId != fetch.getRestaurant_id()) {
    		cart = new Cart();
    		
    	}   		
    		
    	
    	
        CartItem cartItem = new CartItem(fetch.getMenu_id(), fetch.getRestaurant_id(), fetchRes.getRestaurantName(), fetch.getMenu_item_name(), fetch.getPrice(),quantity, fetch.getIs_available(),fetch.getImage_path());
        cart.addItem(cartItem);
    	
        // Save the updated cart back to the session
        session.setAttribute("cart", cart);
        
    	
    }
    
    public void updateIncrease(HttpServletRequest req,Cart cart,HttpSession session)
    {
    	int itemId =Integer.parseInt( req.getParameter("itemId"));
    	int quantity=Integer.parseInt(req.getParameter("quantity"))+1;
    	cart.updateQuantity(itemId, quantity);
    	session.setAttribute("cart", cart);
    	
    }
    
    public void updateDecrease(HttpServletRequest req,Cart cart,HttpSession session)
    {
    	int itemId =Integer.parseInt( req.getParameter("itemId"));
    	int quantity=Integer.parseInt(req.getParameter("quantity"))-1;
    	
    	if(quantity<=0)
    	{
    		cart.removeItem(itemId);
    	}
    	else
    	{
    		cart.updateQuantity(itemId, quantity);
    		session.setAttribute("cart", cart);
    		
    	}
    	
    }
    
}
