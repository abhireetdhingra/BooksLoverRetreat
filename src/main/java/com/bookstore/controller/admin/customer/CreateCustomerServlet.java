package com.bookstore.controller.admin.customer;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bookstore.service.CustomerServices;


@WebServlet("/Admin/create_customer")
public class CreateCustomerServlet extends HttpServlet
{

	private static final long serialVersionUID = 1L;
	public void doPost(HttpServletRequest request,HttpServletResponse response) throws IOException, ServletException
	{
		//response.getWriter().println("This is create customer servlet");
		CustomerServices services=new CustomerServices(request, response);
		services.createCustomer();
	}

}
