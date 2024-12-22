package com.bookstore.service;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bookstore.dao.BookDao;
import com.bookstore.dao.CategoryDao;
import com.bookstore.dao.SubCategoryDao;
import com.bookstore.entity.Categories;
import com.bookstore.entity.SubCategory;

public class SubCategoryServices 
{
	private HttpServletRequest request;
	private HttpServletResponse response;
	private SubCategoryDao subCatDao;
	private BookDao bookDao;
	private CategoryDao catDao;
	
	public SubCategoryServices(HttpServletRequest request, HttpServletResponse response) {
		
		this.request = request;
		this.response = response;
		subCatDao=new SubCategoryDao();
		bookDao=new BookDao();
		catDao=new CategoryDao();
	}

	public void listCategories(String message) throws ServletException, IOException 
	{
		List<SubCategory> list=subCatDao.listAll();
		request.setAttribute("subCategoriesList", list);
		if(message!=null)
			request.setAttribute("message",message);
		RequestDispatcher rd=request.getRequestDispatcher("SubCategories_list.jsp");
		rd.forward(request, response);
	}
	public void listCategories() throws ServletException, IOException 
	{
		listCategories(null);
	}

	public void getSubCategory() throws ServletException, IOException 
	{
		int id=Integer.parseInt(request.getParameter("SubCategoryId"));
		SubCategory category=subCatDao.get(id); //first of all find if sub category exits in database or is deleted
		
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
			request.setAttribute("SubCategory",category);
			RequestDispatcher rd = request.getRequestDispatcher("SubCategory_form.jsp");
			rd.forward(request, response);
		}
	}

	public void deleteSubCategory() throws ServletException, IOException
	{
		int id=Integer.parseInt(request.getParameter("subCatId"));
		SubCategory category=subCatDao.get(id);
		if(category==null)
		{
			String message = "Could not get sub category with id: "+id+"\n Sub  Category might have been deleted by some other admin";
			request.setAttribute("message", message);
			RequestDispatcher rd = request.getRequestDispatcher("message.jsp");
			rd.forward(request, response);
		}
		else
		{
			long count=bookDao.countBySubCategory(id);
			String message;
			if(count>0)
			{
				 message="Can't delete sub category, it might have some books associated with it";
				
			}
			else
			{
				subCatDao.delete(id);
				message="sub category deleted successfully";
			}
			listCategories(message);
		}
		
		
	}

	public void createSubCategory() throws ServletException, IOException
	{
		String subCategoryName=request.getParameter("subCategoryName");
		boolean flag=false;
		if(subCategoryName.charAt(0)==' ')  //if category name starts with space character,then it is not allowed to persist in database
		{
			flag=true;
			listCategories("Category Name can't start with a space");
		}
		else
		{
			for(int i=1;i<subCategoryName.length();i++)
			{
				if(subCategoryName.charAt(i)==' '&&subCategoryName.charAt(i-1)==' ')
				{
					flag=true;
					listCategories("Category Name contains more than 1 space.Try removing extra spaces");
					
				}
			}
		}
		if(!flag)
		{
			//check if category already exits in database
			SubCategory exitedCategory=subCatDao.findBySubCategoryName(subCategoryName);
			if(exitedCategory!=null)
			{
				String message="A sub category with name: "+exitedCategory.getSubCategoryName()+" already exits in database";
				request.setAttribute("message", message);
				RequestDispatcher rd = request.getRequestDispatcher("message.jsp");
				rd.forward(request, response);
			}
			else
			{
				int categoryId=Integer.parseInt(request.getParameter("categoryName"));
				Categories category=catDao.get(categoryId);
				if(category==null)
					listCategories("Could not find category with id: "+categoryId);
				
				else
				{
					SubCategory subCategory=new SubCategory();
					subCategory.setSubCategoryName(subCategoryName);
					subCategory.setCategory(category);
					
					subCatDao.create(subCategory);
					//After successful addition of category,call listCategories()
					listCategories("Category Added");
				}
				
				
			}
			
		}
		
	}

	public void updateCategory() throws ServletException, IOException 
	{		
		int id=Integer.parseInt(request.getParameter("catId"));
		String subCatName=request.getParameter("subCategoryName");
		
		int categoryId=Integer.parseInt(request.getParameter("categoryName"));
		Categories category=catDao.get(categoryId);
		
	
		SubCategory findById=subCatDao.get(id);
		SubCategory findByName=subCatDao.findBySubCategoryName(subCatName);

		
		if(findByName!=null && findById.getSubCategoryId()!=findByName.getSubCategoryId())
		{
			String message = "Could not create category A same category with name: " + subCatName + " already exits";
			request.setAttribute("message", message);
			RequestDispatcher rd = request.getRequestDispatcher("message.jsp");
			rd.forward(request, response);
		}
		else
		{	
			if(category==null)
				listCategories("Could not find category with id: "+categoryId);
			else
			{
				SubCategory subcategory=new SubCategory();
				subcategory.setSubCategoryId(id);
				subcategory.setSubCategoryName(subCatName);
				subcategory.setCategory(category);
				subCatDao.update(subcategory);
				listCategories("Category updated successfully");
			}
			
		}
	}
}
