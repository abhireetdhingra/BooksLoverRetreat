package com.bookstore.controller.admin.user;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bookstore.service.UserServices;

@WebServlet("/Admin/EditUsersServlet")
public class EditUsersServlet extends HttpServlet
{
	private static final long serialVersionUID = 1L;
	public void doGet(HttpServletRequest request,HttpServletResponse response) throws IOException, ServletException
	{
		//Working
//		int id=Integer.parseInt(request.getParameter("UserId"));
//		response.getWriter().println("Id of selected user is: "+id);
		//***********************************************************
		
		//int id=Integer.parseInt(request.getParameter("UserId"));
		//we need to fetch user from database using this id
		UserServices service =new UserServices(request, response);
		service.getUser();
		//printing user details
		//Tested its working
//		response.getWriter().println("Id of selected user is: "+id);
//		response.getWriter().println("Name of selected user is: "+user.getFullName());
//		response.getWriter().println("Email of selected user is: "+user.getEmail());
//		response.getWriter().println("Password of selected user is: "+user.getPassword());
//		
//		request.setAttribute("User",user);
//		RequestDispatcher rd=request.getRequestDispatcher("Edit_user.jsp");
//		rd.forward(request, response);
	}

}
