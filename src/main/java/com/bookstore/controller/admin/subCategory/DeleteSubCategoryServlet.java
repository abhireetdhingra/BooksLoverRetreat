package com.bookstore.controller.admin.subCategory;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import com.bookstore.service.SubCategoryServices;

@WebServlet("/Admin/delete_subCategory")
public class DeleteSubCategoryServlet extends HttpServlet
{
	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest request,HttpServletResponse response) throws IOException, ServletException
	{
		SubCategoryServices service=new SubCategoryServices(request,response);
		service.deleteSubCategory();
	}
}
