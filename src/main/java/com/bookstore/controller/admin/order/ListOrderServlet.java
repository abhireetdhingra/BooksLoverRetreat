package com.bookstore.controller.admin.order;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bookstore.service.BookOrderServices;


@WebServlet("/Admin/Orders_list")
public class ListOrderServlet extends HttpServlet 
{
	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest request,HttpServletResponse response) throws IOException, ServletException
	{
		BookOrderServices service=new BookOrderServices(request, response);
		service.listOrders();
	}
}
