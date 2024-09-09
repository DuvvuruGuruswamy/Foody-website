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
@WebServlet("/register")
public class RegisterServlet extends HttpServlet {
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String userName = req.getParameter("name");
		String email = req.getParameter("email");
		String phoneNumber = req.getParameter("phonenumber");
		String password = req.getParameter("password");
		String cPassword = req.getParameter("cpassword");
		String address = req.getParameter("address");
		RequestDispatcher requestDispatcher = req.getRequestDispatcher("/problems.jsp");

		// Validate phone number
		if(!isValidPhoneNumber(phoneNumber)) {
			
			req.setAttribute("problem", "phoneNumber");
			requestDispatcher.forward(req, resp);
		}

		UserImplements userImplements = new UserImplements();
		User user = userImplements.fetchOnEmail(email);
		if(user != null) {
			req.setAttribute("problem", "emailAlreadyPresent");
			requestDispatcher.forward(req, resp);
		} 
		else {
			if(password.equals(cPassword)) {
				
				User user1 = new User(userName, password, email, address, phoneNumber);
				UserImplements userImplements1 = new UserImplements();
				userImplements1.insertData(user1);
				UserImplements userImplements2 = new UserImplements();
				user = userImplements2.fetchOnEmail(email);
				
				HttpSession session = req.getSession();
				session.setAttribute("user", user);
				resp.sendRedirect("home.jsp");
			} 
			else 
			{
				req.setAttribute("problem", "pwdCpwdNotMatch");	
				requestDispatcher.forward(req, resp);
			}
		}
	}

	private boolean isValidPhoneNumber(String phoneNumber) {
		
		if(phoneNumber.length()>8 && phoneNumber.length()<=10)
		{
			
			return true;
		}
		else
		{
			return false;
		}
	}
}
