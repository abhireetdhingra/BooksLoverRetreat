package com.bookstore.controller.admin.customer;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import com.bookstore.service.CustomerServices;


@WebServlet("/Admin/Edit_Customer")	
public class EditCustomerServlet extends HttpServlet {
	

private static final long serialVersionUID = 1L;
	
	public void doGet(HttpServletRequest request,HttpServletResponse response) throws IOException, ServletException
	{
		
//		response.getWriter().println("edit customer");
		CustomerServices service=new CustomerServices(request, response);
		service.getCustomer();
	}
}
