package com.bookstore.controller.frontend.shoppingcart;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bookstore.dao.BookDao;
import com.bookstore.entity.Books;

@WebServlet("/view_cart")
public class ViewCartServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException
	{
		//get cart object stored in session if any
		
		Object cartObject = request.getSession().getAttribute("cart");

		if (cartObject == null)  //else store a new session
		{ 
			ShoppingCart shoppingCart = new ShoppingCart();
			request.getSession().setAttribute("cart", shoppingCart);
		}

		//Get a book from bookdao for testing purpose
		/*
		 * BookDao bookDao=new BookDao(); Books book1=bookDao.get(2); Books
		 * book2=bookDao.get(3);
		 * 
		 * ShoppingCart shoppingCart=(ShoppingCart)
		 * request.getSession().getAttribute("cart"); shoppingCart.addItem(book1);
		 * shoppingCart.addItem(book1); shoppingCart.addItem(book2);
		 * shoppingCart.addItem(book2); shoppingCart.addItem(book2);
		 */
		 
		
		
		// forward request to shopping_cart page
		String cartPage = "Frontend/shopping_cart.jsp";
		RequestDispatcher dispatcher = request.getRequestDispatcher(cartPage);
		dispatcher.forward(request, response);

	}

}
