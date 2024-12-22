package com.bookstore.dao;

import java.util.List;

import com.bookstore.entity.Categories;
import com.bookstore.entity.SubCategory;

public class SubCategoryDao extends JpaDao<SubCategory> implements GenericDao<SubCategory> 
{

	public SubCategory create(SubCategory subCat)
	{
		return super.create(subCat);
	}
	
	public SubCategory update(SubCategory subCat)
	{
		return super.update(subCat);
	}
	
	@Override
	public SubCategory get(Object id) {
		return super.get(SubCategory.class, id);
	}

	@Override
	public void delete(Object id) {
		 super.delete(SubCategory.class, id);
		
	}

	@Override
	public List<SubCategory> listAll() {
		return super.findByNamedQuery("listAllSubCategories");
	}

	@Override
	public long count() {
		return super.countEntitiesByNamedQuery("countSubCategories");
	}

	public SubCategory findBySubCategoryName(String name)
	{
		List<SubCategory> subCategoryList=super.findByNamedQuery("findBySubCategoryName","name", name);
		if(subCategoryList!=null &&subCategoryList.size()==1)
			return subCategoryList.get(0);
		return null;
	}
	public List<SubCategory> findByCategoryId(int catId)
	{
		return super.findByNamedQuery("findByCategoryId", "categoryId", catId);
	}
	
}
