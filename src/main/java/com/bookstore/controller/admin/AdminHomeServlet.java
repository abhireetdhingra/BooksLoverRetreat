package com.bookstore.controller.admin;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bookstore.dao.BookDao;
import com.bookstore.dao.BookOrderDao;
import com.bookstore.dao.CustomerDao;
import com.bookstore.dao.ReviewDao;
import com.bookstore.dao.UserDao;
import com.bookstore.entity.BookOrders;
import com.bookstore.entity.Reviews;

@WebServlet("/Admin/")
public class AdminHomeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public AdminHomeServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		doGet(request, response);
	}
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		
		
		UserDao userDao = new UserDao();
		BookOrderDao orderDao = new BookOrderDao();
		ReviewDao reviewDao = new ReviewDao();
		BookDao bookDao = new BookDao();
		CustomerDao customerDao = new CustomerDao();
		
		List<BookOrders> listMostRecentSales = orderDao.listMostRecentSales();
		List<Reviews> listMostRecentReviews = reviewDao.listMostRecent();
		
		long totalUsers = userDao.count();
		long totalBooks = bookDao.count();
		long totalCustomers = customerDao.count();
		long totalReviews = reviewDao.count();
		long totalOrders = orderDao.count();
		
		request.setAttribute("listMostRecentSales", listMostRecentSales);
		request.setAttribute("listMostRecentReviews", listMostRecentReviews);
		
		request.setAttribute("totalUsers", totalUsers);
		request.setAttribute("totalBooks", totalBooks);
		request.setAttribute("totalCustomers", totalCustomers);
		request.setAttribute("totalReviews", totalReviews);
		request.setAttribute("totalOrders", totalOrders);
		
		//code to transfer request to admin home page i.e (index.jsp)
		String homePage="index.jsp";
		System.out.println("Servlet called");
		RequestDispatcher dispatch=request.getRequestDispatcher(homePage);
		dispatch.forward(request, response);
	}
	



}
