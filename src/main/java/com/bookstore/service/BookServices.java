package com.bookstore.service;



import java.io.IOException;
import java.io.InputStream;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;


import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.bookstore.dao.BookDao;
import com.bookstore.dao.BookOrderDao;
import com.bookstore.dao.CategoryDao;
import com.bookstore.dao.ReviewDao;
import com.bookstore.entity.Books;
import com.bookstore.entity.Categories;
import com.bookstore.entity.Customers;
import com.bookstore.entity.Reviews;

public class BookServices {
	private HttpServletRequest request;
	private HttpServletResponse response;
	private BookDao dao;
	private CategoryDao catDao;

	public BookServices(HttpServletRequest request, HttpServletResponse response) {
		this.request = request;
		this.response = response;

		dao = new BookDao();
		catDao = new CategoryDao();
	}

	public void listBooks(String message) throws ServletException, IOException
	{
		List<Books> listBooks = dao.listAll();
		request.setAttribute("listBooks", listBooks);
		if(message!=null)
			request.setAttribute("message",message);
		RequestDispatcher rd = request.getRequestDispatcher("Books_list.jsp");
		rd.forward(request, response);
	}
	public void listBooks() throws ServletException, IOException
	{
		listBooks(null);
	}

	public void showBookNewForm() throws ServletException, IOException // this method will retrieve all categories from
																		// database
	{
		List<Categories> listCategories = catDao.listAll();
		request.setAttribute("listCategory", listCategories);
		RequestDispatcher rd = request.getRequestDispatcher("Book_form.jsp");
		rd.forward(request, response);
	}

	public void createBook() throws ServletException, IOException {										
		String title = request.getParameter("title");

		// check for same title
		Books existed = dao.findByTitle(title);
		if (existed != null) {
			String message = "Book with title: " + title + "already exits";
			request.setAttribute("message", message);
			showBookNewForm();
		} else {
			Books createBook=new Books();
			readBookFields(createBook);
			
			Books newlyCreatedBook = dao.create(createBook);
			if (newlyCreatedBook.getBookId() > 0) {
				String message = "Book has been created successfully";
				listBooks(message);// call to listBooks
			}

		}
	}
	
	//This method gets the fields from Book_form and sets the value to Book object
	public void readBookFields(Books book) throws ServletException, IOException
	{
		int catId = Integer.parseInt(request.getParameter("categoryList")); // category id was passed as value to input	
		Categories category = catDao.get(catId);
		
		String title = request.getParameter("title");
		String author = request.getParameter("author");
		String isbn = request.getParameter("isbn");
		float price = Float.parseFloat(request.getParameter("price"));
		String description = request.getParameter("description");
		
		//getting date
		DateFormat dateFormat = new SimpleDateFormat("MM/dd/yyyy");
		Date publishedDate = null;
		try {
			publishedDate = dateFormat.parse(request.getParameter("publishedDate"));
		} catch (ParseException ex) {
			ex.printStackTrace();
			throw new ServletException("error parsing format date Format is(MM/dd/yyyy)");
		}
		
		
		book.setBookAuthor(author);
		book.setBookIsbn(isbn);
		book.setBookDescription(description);
		book.setBookPrice(price);
		book.setPublishdate(publishedDate);
		book.setBookTitle(title);
		book.setCategory(category);
		//getting and setting picture
		Part part = request.getPart("image");
		if (part != null && part.getSize() > 0) {
			System.out.println("Part inside if condition");
			long size = part.getSize();
			byte[] imageBytes = new byte[(int) size];

			InputStream inputStream = part.getInputStream();
			inputStream.read(imageBytes);
			inputStream.close();
			book.setImage(imageBytes);
		}	
		
		
	}
	
	public void deleteBook() throws ServletException, IOException {
		int bookId=Integer.parseInt(request.getParameter("bookId"));
		//System.out.println("id: "+bookId);
		//assignment part
		Books book=dao.get(bookId);
		if(book==null)
		{
			String message = "Book not found Might have been deleted by some another admin ";
			request.setAttribute("message", message);
			RequestDispatcher rd = request.getRequestDispatcher("message.jsp");
			rd.forward(request, response);
		}
		else
		{
			BookOrderDao orderDao=new BookOrderDao();
			long countByOrder=orderDao.countOrderDetailByBook(bookId);
			
			if(!book.getReviews().isEmpty())
			{
//				System.out.println("Inside book reviews not empty block");
				listBooks("Could not delete book because book has reviews associated with it");
				
			}
			else if(countByOrder>0)
			{
				listBooks("Could not delete book because book has orders associated with it");
			}
			else
			{
				dao.delete(bookId);
				listBooks("Book has been deleted successfully");
			}
			
		}
		
	}

	public void getBook() throws ServletException, IOException
	{
		int bookId=Integer.parseInt(request.getParameter("BookId"));
		Books book=dao.get(bookId);
		
		//assignment part
		if(book==null) //book might have deleted by someone
		{
			String message = "Book not found ";
			request.setAttribute("message", message);
			RequestDispatcher rd = request.getRequestDispatcher("message.jsp");
			rd.forward(request, response);
		}
		else
		{
			//We also need to send list of categories along side so that it gets dipslayed
			List<Categories> listCategories=catDao.listAll();
			request.setAttribute("Book",book);
			request.setAttribute("listCategory", listCategories);
			RequestDispatcher rd = request.getRequestDispatcher("Book_form.jsp");
			rd.forward(request, response);
		}
		
	}

	public void updateBook() throws IOException, ServletException
	{
		//first get book by id 
		int bookId=Integer.parseInt(request.getParameter("bookId"));
		//then by title
		String title=request.getParameter("title");
		
		Books bookById=dao.get(bookId);
		Books bookByTitle=dao.findByTitle(title);
		if(bookByTitle!=null && bookByTitle.getBookId()!=bookById.getBookId())
		{
			String message = "Book With Title: "+title+" already exists";
			request.setAttribute("message", message);
			RequestDispatcher rd = request.getRequestDispatcher("message.jsp");
			rd.forward(request, response);
		}
		else
		{

			readBookFields(bookById);
			dao.update(bookById);
			listBooks("Book was update successfully");
			
		}
		
	}

	public void listBooksByCategory() throws ServletException, IOException
	{
		int id=Integer.parseInt(request.getParameter("catId"));
		Categories category=catDao.get(id);
		
		if(category==null) //category might have been deleted by some other admin
		{
			String message = "Category not found Might have been deleted ";
			request.setAttribute("message", message);
			RequestDispatcher rd = request.getRequestDispatcher("Frontend/message.jsp");
			rd.forward(request, response);
		}
		else
		{
			request.setAttribute("category", category);
			
			// Code to count books by category
			long result=dao.countByCategory(id);
			request.setAttribute("countBooksByCategory", result);
			
//			System.out.println("id: "+id);
			List<Books> listBooks=dao.listByCategory(id);
			request.setAttribute("booksList", listBooks);
			RequestDispatcher rd = request.getRequestDispatcher("Frontend/list_books_by_category.jsp");
			rd.forward(request, response);
			
		}
		
	}

	public void viewBookDetails() throws ServletException, IOException 
	{
		int bookId=Integer.parseInt(request.getParameter("bookId"));
//		System.out.println("id: "+bookId);
		Books book=dao.get(bookId);
		if(book==null) //book might have deleted by someone
		{
			String message = "Book not found Might have been deleted by admin";
			request.setAttribute("message", message);
			RequestDispatcher rd = request.getRequestDispatcher("Frontend/message.jsp");
			rd.forward(request, response);
		}
		else
		{
			
			//Code to check if customer has made a review on this book or not
			HttpSession session = request.getSession();
			Customers customer = (Customers) session.getAttribute("loggedCustomer");
			ReviewDao reviewDao=new ReviewDao();
			Reviews review=reviewDao.findByCustomerAndBook(customer.getCustomerId(), bookId);
			if(review!=null) //customer has already made a review on the page
				request.setAttribute("existedReview", review);
			//************************************************************************************
			
			request.setAttribute("book",book);
		
			RequestDispatcher rd = request.getRequestDispatcher("Frontend/view_book.jsp");
			rd.forward(request, response);
		}
		
	}

	public void searchBook() throws IOException, ServletException
	{
		String keyword=request.getParameter("keyword");
		response.getWriter().println(keyword);

		List<Books> result=null;
		if(keyword.equals("")) //empty
		{
			result=dao.listAll();
		}
		else
		{
			result=dao.searchBooks(keyword);
		}
		request.setAttribute("searchBooksResult", result);
		request.setAttribute("keyword",keyword);
		RequestDispatcher rd = request.getRequestDispatcher("Frontend/search_result.jsp");
		rd.forward(request, response);
	}

}
