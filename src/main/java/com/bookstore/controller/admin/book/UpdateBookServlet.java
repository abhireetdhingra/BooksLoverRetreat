package com.bookstore.controller.admin.book;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bookstore.service.BookServices;

@WebServlet("/Admin/update_book")
@MultipartConfig(
		fileSizeThreshold=1024*10, //10Kb
		maxFileSize=1024*300,//300kb
		maxRequestSize=1024*1024 //1MB
		)
public class UpdateBookServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;
	public void doPost(HttpServletRequest request,HttpServletResponse response) throws IOException, ServletException
	{
		BookServices service=new BookServices(request,response);
		service.updateBook();
	}

}
