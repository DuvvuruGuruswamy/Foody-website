package com.tap.servlets;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.tap.daoimplementation.UserImplements;
import com.tap.model.User;

@SuppressWarnings("serial")
@WebServlet("/emailCheck")
public class EmailCheck extends HttpServlet {
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String email = req.getParameter("email");
		String password = req.getParameter("password");
		
		HttpSession session = req.getSession();
		
		UserImplements userImplements = new UserImplements(); 
		User user = userImplements.fetchOnEmail(email);
		if(user!=null)
		{
			if(user.getPassword().equals(password))
			{
				
				session.setAttribute("user", user);
				
				RequestDispatcher requestDispatcher = req.getRequestDispatcher("home.jsp");
				requestDispatcher.forward(req, resp);
			}
			else
			{
				req.setAttribute("problem", "passwordIncorrect");
				RequestDispatcher requestDispatcher = req.getRequestDispatcher("/problems.jsp");
				requestDispatcher.forward(req, resp);
				
			}
		}
		else
		{
			req.setAttribute("problem", "emailIncorrect");
			RequestDispatcher requestDispatcher = req.getRequestDispatcher("/problems.jsp");
			requestDispatcher.forward(req, resp);
		}
		
	
	}
	
	
		
	
}
