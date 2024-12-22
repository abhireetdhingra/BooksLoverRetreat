package com.bookstore.controller.admin;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@WebFilter("/Admin/*")  //* represents anything after Admin/ 
public class AdminLoginFilter implements Filter {
	
	public AdminLoginFilter()
	{
		
	}

	//doFilter is used to write main logic
	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException
	{
		HttpServletRequest Httprequest=(HttpServletRequest)request; //cast request parameter to http request
		HttpSession session=Httprequest.getSession(false); //returns the current active session or returns null,it dosent returns a new session
		
		boolean loggedIn=session!=null &&session.getAttribute("useremail")!=null;
		String loginURI=Httprequest.getContextPath()+ "/Admin/login";
		boolean loginRequest=Httprequest.getRequestURI().equals(loginURI);
		
		//condition to prevent login page to open once user is logged in and session is active
		boolean loginPage=Httprequest.getRequestURI().endsWith("login.jsp");
		if(loggedIn && (loginRequest || loginPage))
		{
			RequestDispatcher dispatch=request.getRequestDispatcher("/Admin/");
			dispatch.forward(request,response);
		}
		
		if(loggedIn || loginRequest)
			chain.doFilter(request, response); //process normal execution
		else
		{ 
			//else redirect to login page 
			RequestDispatcher dispatch=request.getRequestDispatcher("login.jsp");
			dispatch.forward(request,response);
		}
		
	}
	public void destroy()
	{
		
	}
	
	//init is invoked when filter is first created
	public void init(FilterConfig fConfig) throws ServletException
	{
		
	}

}
