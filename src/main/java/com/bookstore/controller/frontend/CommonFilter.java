package com.bookstore.controller.frontend;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;

import com.bookstore.dao.CategoryDao;
import com.bookstore.dao.SubCategoryDao;
import com.bookstore.entity.Categories;
import com.bookstore.entity.SubCategory;

@WebFilter("/*")
public class CommonFilter implements Filter
{
	private final CategoryDao categoryDao;
	
	public CommonFilter()
	{
		categoryDao=new CategoryDao();
	}
	
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException
	{
		
		HttpServletRequest httpRequest=(HttpServletRequest) request;
		String path=httpRequest.getRequestURI().substring(httpRequest.getContextPath().length());
		if(!path.startsWith("/Admin/"))
		{
			List<Categories> categoryList=categoryDao.listAll();
			request.setAttribute("categoryList", categoryList);
			
			Map<Categories,List<SubCategory>> map=new HashMap<>();
			for(Categories category:categoryList)
			{
				int id=category.getCategoryId();
				SubCategoryDao subCatDao=new SubCategoryDao();
				List<SubCategory> listSubCategory=subCatDao.findByCategoryId(id);
				if(listSubCategory!=null)
					map.put(category,listSubCategory);
				else
					map.put(category, null);
			}
			request.setAttribute("SubCategoriesMap", map);
		}
		
		chain.doFilter(request, response); //process normal execution
	}
	public void destroy()
	{
		
	}
	
	//init is invoked when filter is first created
	public void init(FilterConfig fConfig) throws ServletException
	{
		
	}
	
}
