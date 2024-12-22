package com.bookstore.controller.admin.review;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bookstore.service.CustomerServices;
import com.bookstore.service.ReviewServices;

@WebServlet("/Admin/Reviews_list")
public class ListReviewServlet extends HttpServlet  
{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	public void doGet(HttpServletRequest request,HttpServletResponse response) throws IOException, ServletException
	{
		//response.getWriter().println("You are in reviews management servlet");
		ReviewServices service=new ReviewServices(request, response);
		service.listReviews();
	}

}
