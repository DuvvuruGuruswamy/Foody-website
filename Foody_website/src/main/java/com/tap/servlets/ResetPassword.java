package com.tap.servlets;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tap.daoimplementation.UserImplements;

@SuppressWarnings("serial")
@WebServlet("/resetPassword")
public class ResetPassword extends HttpServlet {
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String email = req.getParameter("email");
		Long phoneNumber = Long.parseLong(req.getParameter("phoneNumber"));
		String password = req.getParameter("password");
		UserImplements userImplements = new UserImplements(); 
		int user = userImplements.changePassword(email, phoneNumber, password);
		
		if(user!=0)
		{
			RequestDispatcher requestDispatcher = req.getRequestDispatcher("/emailCheck");
			requestDispatcher.forward(req, resp);
			
		}
		else
		{
			req.setAttribute("problem", "email&passwordNotMatch");
			RequestDispatcher requestDispatcher = req.getRequestDispatcher("/problems.jsp");
			requestDispatcher.forward(req, resp);
		}
	}
}
