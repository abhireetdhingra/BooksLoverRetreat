package com.bookstore.dao;

import java.util.List;

import com.bookstore.entity.Categories;


public class CategoryDao  extends JpaDao<Categories> implements GenericDao<Categories>
{

	public CategoryDao() {
	
		// TODO Auto-generated constructor stub
	}
	
	@Override
	public Categories create(Categories category)
	{
		return super.create(category);
		
	}
	
	public Categories update(Categories category)
	{
		return super.update(category);
		
	}
	
	@Override
	public Categories get(Object id)
	{
		return super.get(Categories.class, id);
	}

	@Override
	public void delete(Object id) {
		super.delete(Categories.class,id);
		
	}

	@Override
	public List<Categories> listAll() {
		
		return super.findByNamedQuery("listAllCategories");
	}

	@Override
	public long count() {
		
		return super.countEntitiesByNamedQuery("countCategories");
	}

	public Categories findByCategoryName(String name)
	{
		List<Categories> categoryList=super.findByNamedQuery("findByName","name", name);
		if(categoryList!=null &&categoryList.size()==1)
			return categoryList.get(0);
		return null;
	}
	
}
