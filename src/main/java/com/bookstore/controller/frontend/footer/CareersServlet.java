package com.bookstore.controller.frontend.footer;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/career")
public class CareersServlet  extends HttpServlet   
{
	
	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest request,HttpServletResponse response) throws IOException, ServletException
	{
		RequestDispatcher rd=request.getRequestDispatcher("Frontend/Careers.jsp");
		rd.forward(request, response);
	}
}
