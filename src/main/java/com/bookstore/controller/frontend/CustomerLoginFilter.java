package com.bookstore.controller.frontend;

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



@WebFilter("/*")
public class CustomerLoginFilter implements Filter 
{
	
	private static final String[] loginRequiredURLs= {"/view_book","/view_customer_profile","/checkout","/place_order","/view_orders"
			,"/show_order_detail"};
	
	public CustomerLoginFilter() {
		// TODO Auto-generated constructor stub
	}
	
	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException
	{
		HttpServletRequest httpRequest=(HttpServletRequest) request;
		HttpSession session=httpRequest.getSession(false);

		String path=httpRequest.getRequestURI().substring(httpRequest.getContextPath().length());
		String requestURL=httpRequest.getRequestURL().toString();
		if(path.startsWith("/Admin/"))
		{
			chain.doFilter(request, response); //process normal execution
			return;
		}
		
		boolean loggedIn=session!=null && session.getAttribute("loggedCustomer")!=null;
		if(!loggedIn&& isLoginRequired(requestURL))
		{
			//Code to store query string as well as redirect to desired page after user is successfully logged in
			String queryString=httpRequest.getQueryString();
			String redirectURL=requestURL;
			
			if (queryString != null) {
				redirectURL = redirectURL.concat("?").concat(queryString);
			}
			session.setAttribute("redirectURL", redirectURL); //store desired url in a session object
			
			RequestDispatcher rd=httpRequest.getRequestDispatcher("Frontend/login.jsp");
			rd.forward(request, response);
		}
		else
			chain.doFilter(request, response); //process normal execution
	}
	
	private boolean isLoginRequired(String requestURL)
	{
		for (String loginRequiredURL : loginRequiredURLs) {
			if (requestURL.contains(loginRequiredURL)) {
				return true;
			}
		}
		return false;
	}
	
	public void destroy()
	{
		
	}
	
	//init is invoked when filter is first created
	public void init(FilterConfig fConfig) throws ServletException
	{
		
	}
}
