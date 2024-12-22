package com.bookstore.controller.frontend.order;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bookstore.service.BookOrderServices;
import com.bookstore.service.ReviewServices;

@WebServlet("/checkout")
public class CheckOutServlet extends HttpServlet 
{

	private static final long serialVersionUID = 1L;
	
	public void doGet(HttpServletRequest request,HttpServletResponse response) throws IOException, ServletException
	{

		BookOrderServices service=new BookOrderServices(request, response);
		service.showCheckOutForm();
	}
	
}
