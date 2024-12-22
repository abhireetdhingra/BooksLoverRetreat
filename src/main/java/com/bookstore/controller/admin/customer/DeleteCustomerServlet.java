package com.bookstore.controller.admin.customer;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bookstore.service.CustomerServices;

@WebServlet("/Admin/delete_customer")

public class DeleteCustomerServlet extends HttpServlet 
{

	private static final long serialVersionUID = 1L;
	
	public void doGet(HttpServletRequest request,HttpServletResponse response) throws IOException, ServletException
	{
//		response.getWriter().println("delete customer");
		CustomerServices service=new CustomerServices(request, response);
		service.deleteCustomer();
	}

	
}
