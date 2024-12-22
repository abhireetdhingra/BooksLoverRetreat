package com.bookstore.controller.frontend;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bookstore.dao.BookDao;
import com.bookstore.entity.Books;

@WebServlet("")
public class HomeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public HomeServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		BookDao bookDao=new BookDao();
		List<Books> newBooks=bookDao.listNewBooks();
		request.setAttribute("listNewBooks",newBooks);
		
		List<Books> bestSellingBooks=bookDao.listBestSellingBooks();
		request.setAttribute("listBestSellingBooks",bestSellingBooks);
		
		List<Books> mostFavouredBooks=bookDao.listMostFavouredBooks();
		request.setAttribute("listMostFavouredBooks",mostFavouredBooks);
		
		List<Books> boxSetsBooks=bookDao.listBoxSetsBooks();
		request.setAttribute("BoxSetsBooks", boxSetsBooks);
		
		String homePage="Frontend/index.jsp";
		RequestDispatcher dispatch=request.getRequestDispatcher(homePage);
		dispatch.forward(request, response);
		
	}


	

}
