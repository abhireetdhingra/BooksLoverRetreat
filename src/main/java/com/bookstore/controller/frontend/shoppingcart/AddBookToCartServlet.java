package com.bookstore.controller.frontend.shoppingcart;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bookstore.dao.BookDao;
import com.bookstore.entity.Books;

@WebServlet("/add_to_cart")
public class AddBookToCartServlet extends HttpServlet 
{

	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException
	{
		
		Integer bookId = Integer.parseInt(request.getParameter("bookId"));
		
		Object cartObject = request.getSession().getAttribute("cart");
		
		ShoppingCart shoppingCart = null;
		
		if (cartObject != null && cartObject instanceof ShoppingCart) {
			shoppingCart =  (ShoppingCart) cartObject;
		} else {
			shoppingCart = new ShoppingCart();
			request.getSession().setAttribute("cart", shoppingCart);
		}
		
		BookDao bookDAO = new BookDao();
		Books book = bookDAO.get(bookId);
		
		shoppingCart.addItem(book);
		
		String homePage = request. getContextPath();
		response.sendRedirect(homePage);
	}

}
