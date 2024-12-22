package com.bookstore.service;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bookstore.dao.BookDao;
import com.bookstore.dao.ReviewDao;
import com.bookstore.entity.Books;
import com.bookstore.entity.Customers;
import com.bookstore.entity.Reviews;

public class ReviewServices {
	private HttpServletRequest request;
	private HttpServletResponse response;
	private ReviewDao reviewDao;
	
	public ReviewServices(HttpServletRequest request, HttpServletResponse response) {
		this.request = request;
		this.response = response;
		
		reviewDao=new ReviewDao();
	}

	public void listReviews(String message) throws ServletException, IOException
	{
		List<Reviews> list=reviewDao.listAll();
		request.setAttribute("reviewList", list);
		if (message != null)
			request.setAttribute("message", message);
		RequestDispatcher rd = request.getRequestDispatcher("Review_list.jsp");
		rd.forward(request, response);
		
		
	}
	public void listReviews() throws ServletException, IOException
	{
		listReviews(null);
	}

	public void editReview() throws ServletException, IOException 
	{
		int reviewId = Integer.parseInt(request.getParameter("ReviewId"));
//		System.out.println("id: "+reviewId);
		
		Reviews review= reviewDao.get(reviewId);
		if(review==null)
			listReviews("Review might have been deleted by some other admin...");
		else
		{
			request.setAttribute("Review", review);
			String editPage = "Review_form.jsp";
			RequestDispatcher dispatcher = request.getRequestDispatcher(editPage);
			dispatcher.forward(request, response);		
		}
		
	}

	public void updateReview() throws ServletException, IOException
	{
		int reviewId = Integer.parseInt(request.getParameter("reviewId"));
//		System.out.println("id: "+reviewId);
		String headline = request.getParameter("headline");
		String comment = request.getParameter("comment");
		
		Reviews review = reviewDao.get(reviewId);
		review.setHeadline(headline);
		review.setComment(comment);
		
		reviewDao.update(review);
		
		String message = "The review has been updated successfully.";
		
		listReviews(message);
	}

	public void deleteReview() throws ServletException, IOException
	{	
		int reviewId = Integer.parseInt(request.getParameter("reviewId"));
//		System.out.println("id: "+reviewId);
		Reviews review= reviewDao.get(reviewId);
		if(review==null)
			listReviews("Review might have been deleted by some other admin...");
		else
		{
			reviewDao.delete(reviewId);
			
			String message = "The review has been deleted successfully.";
			listReviews(message);
		}
		
	}

	public void createCustomerReview() throws ServletException, IOException 
	{
		int bookId = Integer.parseInt(request.getParameter("bookId"));
		int rating=0;
		if(!request.getParameter("rating").equals(""))
			rating=Integer.parseInt(request.getParameter("rating"));
	
		String headline = request.getParameter("reiewHeadline");
		String comment = request.getParameter("reviewComment");
//		System.out.println("bookId: "+request.getParameter("bookId"));
//		System.out.println("rating: "+request.getParameter("rating"));
//		System.out.println("headline: "+headline);
//		System.out.println("comment: "+comment);
		BookDao bookDao=new BookDao();
		Books book=bookDao.get(bookId);
		
		Customers customer=(Customers)request.getSession().getAttribute("loggedCustomer");
		
		Reviews review=new Reviews();
		review.setBook(book);
		review.setComment(comment);
		review.setHeadline(headline);
		review.setRating(rating);
		review.setCustomer(customer);
		
		reviewDao.create(review);
		System.out.println("Review created successfully");
		
		request.setAttribute("book",book);
		RequestDispatcher rd = request.getRequestDispatcher("Frontend/review_success.jsp");
		rd.forward(request, response);
//		String UriPath=request.getRequestURI();
//		String pagePath=request.getRequestURL().toString();
//		String homePage=request.getContextPath();
//		System.out.println("home page: "+homePage);
//		System.out.println("Uri path: "+UriPath);
//		String queryString=request.getQueryString();
//		String targetPage="Frontend/view_book";
//		System.out.println("pagePath: "+pagePath);
		//RequestDispatcher dispatcher = request.getRequestDispatcher("Frontend/view_book.jsp");
		//dispatcher.forward(request, response);
		
	}
	
}
