package com.tap.servlets;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tap.daoimplementation.HelpLineImplements;
import com.tap.model.HelpLine;

@WebServlet("/helpSend")
public class HelpServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
   @Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String name = req.getParameter("name");
		String email = req.getParameter("email");
		Long phoneNumber = Long.parseLong(req.getParameter("phoneNumber"));
		String message = (String) req.getParameter("message");
		
		HelpLine helpLine = new HelpLine(name, email, phoneNumber, message);
		HelpLineImplements helpLineImplements =new  HelpLineImplements();
		helpLineImplements.insertData(helpLine);
		
		req.setAttribute("problem", "helpSend");
		RequestDispatcher requestDispatcher = req.getRequestDispatcher("/problems.jsp");
		requestDispatcher.forward(req, resp);
	}
}
