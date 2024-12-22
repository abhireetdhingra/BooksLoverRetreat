package com.bookstore.controller.admin.category;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bookstore.service.CategoryServices;

@WebServlet("/Admin/Categories_list")
public class ListCategoryServlet extends HttpServlet
{

	private static final long serialVersionUID = 1L;
	
	public void doGet(HttpServletRequest request,HttpServletResponse response) throws IOException, ServletException
	{
		//response.getWriter().println("You are in list category servlet");
		CategoryServices service =new CategoryServices(request, response);
		service.listCategories();
	}
	
}
