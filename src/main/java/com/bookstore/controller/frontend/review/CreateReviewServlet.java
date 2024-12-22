package com.bookstore.controller.frontend.review;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bookstore.service.CustomerServices;
import com.bookstore.service.ReviewServices;

@WebServlet("/create_review")
public class CreateReviewServlet extends HttpServlet 
{
	private static final long serialVersionUID = 1L;

	public void doPost(HttpServletRequest request,HttpServletResponse response) throws IOException, ServletException
	{
		//response.getWriter().println("You are in create review servlet");
		ReviewServices service=new ReviewServices(request, response);
		service.createCustomerReview();
	}
}
