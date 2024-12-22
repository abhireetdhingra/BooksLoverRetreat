package com.bookstore.controller.admin.user;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bookstore.service.UserServices;


public class ListUsersServlet extends HttpServlet
{
	private static final long serialVersionUID = 1L;


	public void doGet(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException
	{

		UserServices service=new UserServices(request,response);
		service.listUsers();
		
//		for(Users user:usersList)
//		{
//			out.println(user.getUserId()+user.getFullName());
//		}
		

//		out.println("<h1>You are in users servlet class</h1>");
//		out.println("<h2>Users list: "+usersList+"</h2>");
		
	
		
	}
}
