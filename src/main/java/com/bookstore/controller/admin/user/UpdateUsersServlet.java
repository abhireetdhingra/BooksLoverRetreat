package com.bookstore.controller.admin.user;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bookstore.service.UserServices;

@WebServlet("/Admin/update_user")
public class UpdateUsersServlet extends HttpServlet {


	private static final long serialVersionUID = 1L;
	public void doPost(HttpServletRequest request,HttpServletResponse response) throws IOException, ServletException
	{
		//first all of it will check the email exits in database or not
//		response.getWriter().println("You are in update servlet user");
		UserServices services=new UserServices(request,response);
		services.updateUser();
		
	}

}
