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
@WebServlet("/update")
public class profileUpdateServlet extends HttpServlet {
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String email = req.getParameter("email");
		String password = req.getParameter("password");
		String newPassword = req.getParameter("newPassword");
		
		
		HttpSession session = req.getSession();
		User user = (User)session.getAttribute("user");
		if(password.equals(user.getPassword()))
		{
			UserImplements userImplements = new UserImplements();
			userImplements.updatePassword(email,newPassword);		
			resp.sendRedirect("profile.jsp");
		}
		else
		{
			req.setAttribute("problem", "passwordIncorrect");
			RequestDispatcher requestDispatcher = req.getRequestDispatcher("/problems.jsp");
			requestDispatcher.forward(req, resp);
		}
	}
}
