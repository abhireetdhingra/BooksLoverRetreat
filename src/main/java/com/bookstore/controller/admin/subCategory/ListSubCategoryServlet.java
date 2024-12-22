package com.bookstore.controller.admin.subCategory;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bookstore.service.CategoryServices;
import com.bookstore.service.SubCategoryServices;


@WebServlet("/Admin/SubCategories_list")
public class ListSubCategoryServlet extends HttpServlet
{

private static final long serialVersionUID = 1L;
	
	public void doGet(HttpServletRequest request,HttpServletResponse response) throws IOException, ServletException
	{
		//response.getWriter().println("You are in list category servlet");
		SubCategoryServices service =new SubCategoryServices(request, response);
		service.listCategories();
	}
}
