package com.bookstore.service;

import java.io.IOException;
import java.util.List;


import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bookstore.dao.BookDao;
import com.bookstore.dao.CategoryDao;
import com.bookstore.entity.Categories;

public class CategoryServices
{

	private HttpServletRequest request;
	private HttpServletResponse response;
	private CategoryDao dao;
	private BookDao bookDao;
	
	public CategoryServices(HttpServletRequest request, HttpServletResponse response)
	{

		this.request = request;
		this.response = response;
		
		/* This code is not in use because we have used Base Servlet class*/
//		factory = Persistence.createEntityManagerFactory("website"); // When an oject of CategoryServices would be made,all
//																		// of these classes would get instantiated as
//																		// well
//		entityManager = factory.createEntityManager();
		dao=new CategoryDao();
		bookDao=new BookDao();
	}
	
	public void listCategories(String message) throws ServletException, IOException
	{
		List<Categories> list=dao.listAll();
		request.setAttribute("categoriesList", list);
		if(message!=null)
			request.setAttribute("message",message);
		RequestDispatcher rd=request.getRequestDispatcher("Categories_list.jsp");
		rd.forward(request, response);
	}
	public void listCategories() throws ServletException, IOException
	{
		listCategories(null);
	}
	
	public void createCategory() throws ServletException, IOException
	{
		String catName=request.getParameter("categoryName");
		
		boolean flag=false;
		if(catName.charAt(0)==' ')  //if category name starts with space character,then it is not allowed to persist in database
		{
			flag=true;
			listCategories("Category Name can't start with a space");
		}
		
		else
		{
			for(int i=1;i<catName.length();i++)
			{
				if(catName.charAt(i)==' '&&catName.charAt(i-1)==' ')
				{
					flag=true;
					listCategories("Category Name contains more than 1 space.Try removing extra spaces");
					
				}
			}
		}
		
		if(!flag)
		{
			//check if category already exits in database
			Categories exitedCategory=dao.findByCategoryName(catName);
			if(exitedCategory!=null)
			{
				String message="A category with name: "+exitedCategory.getCategoryName()+" already exits in database";
				request.setAttribute("message", message);
				RequestDispatcher rd = request.getRequestDispatcher("message.jsp");
				rd.forward(request, response);
			}
			else
			{
				Categories category=new Categories(catName); //to remove leading and trailing spaces
				dao.create(category);
				//After successful addition of category,call listCategories()
				listCategories("Category Added");
			}
			
			
		}
		
	}

	//used in editServlet to check the existence of category in database
	public void getCategory() throws ServletException, IOException
	{
		int id=Integer.parseInt(request.getParameter("CategoryId"));
		Categories category=dao.get(id); //first of all find if user exits in database or is deleted
		
		//This if part was not used by instructor ,but i have implemented it
		if(category==null)
		{
			String message = "Category not found ";
			request.setAttribute("message", message);
			RequestDispatcher rd = request.getRequestDispatcher("message.jsp");
			rd.forward(request, response);
		}
		else
		{
			request.setAttribute("Category",category);
			RequestDispatcher rd = request.getRequestDispatcher("Category_form.jsp");
			rd.forward(request, response);
		}
		
	}
	public void updateCategory() throws ServletException, IOException
	{
		int id=Integer.parseInt(request.getParameter("catId"));
		String catName=request.getParameter("categoryName");
		
		Categories findById=dao.get(id);
		Categories findByName=dao.findByCategoryName(catName);
		
		if(findByName!=null && findById.getCategoryId()!=findByName.getCategoryId())
		{
			String message = "Could not create category A same category with name: " + catName + " already exits";
			request.setAttribute("message", message);
			RequestDispatcher rd = request.getRequestDispatcher("message.jsp");
			rd.forward(request, response);
		}
		else
		{
			Categories category=new Categories();
			category.setCategoryId(id);
			category.setCategoryName(catName);
			dao.update(category);
			listCategories("Category updated successfully");
		}
	}

	public void deleteCategory() throws ServletException, IOException
	{
		int id=Integer.parseInt(request.getParameter("catId"));
		//first get the category with specified id in order to check its existence
		// it may happen that it gets deleted when viewed by more than 1 admin
		Categories category=dao.get(id);
		if(category==null)
		{
			String message = "Could not get category with id: "+id+"\n Category might have been deleted by some other admin";
			request.setAttribute("message", message);
			RequestDispatcher rd = request.getRequestDispatcher("message.jsp");
			rd.forward(request, response);
		}
		
		else
		{
			//Check if category has some books associate with it,if yes ,dont delete it
			long count=bookDao.countByCategory(id);
			String message;
			if(count>0)
			{
				 message="Can't delete category, it might have some books associated with it";
				
			}
			else
			{
				dao.delete(id);
				 message="category deleted successfully";
			}
			listCategories(message);
			
		}
	}
}


