package com.bookstore.dao;

import static org.junit.Assert.*;

import java.util.List;

import org.junit.AfterClass;
import org.junit.BeforeClass;
import org.junit.Test;

import com.bookstore.entity.Categories;
import com.bookstore.entity.SubCategory;

public class SubCategoryDaoTest {
	
	private static SubCategoryDao subCatDao;

	@BeforeClass
	public static void setUpBeforeClass() throws Exception 
	{
		subCatDao=new SubCategoryDao();
	}

	@AfterClass
	public static void tearDownAfterClass() throws Exception
	{
		subCatDao.close();
	}

	@Test
	public void testCreateSubCategory() {
		SubCategory subCategory=new SubCategory();
		subCategory.setSubCategoryName("Java Core");
		
		CategoryDao catDao=new CategoryDao();
		Categories category=catDao.get(2);
		
		subCategory.setCategory(category);
		
		SubCategory newSubCat=subCatDao.create(subCategory);
		assertTrue(newSubCat!=null && newSubCat.getSubCategoryId()>0);
		
		
		
	}

	@Test
	public void testUpdateSubCategory()
	{
		SubCategory subCategory=new SubCategory();
		subCategory.setSubCategoryName("Java Advance");
		
		CategoryDao catDao=new CategoryDao();
		Categories category=catDao.get(2);
		
		subCategory.setCategory(category);
		subCategory.setSubCategoryId(3);
		
		SubCategory updatedSubCat=subCatDao.update(subCategory);
		assertEquals(3,updatedSubCat.getSubCategoryId());
		
	}

	@Test
	public void testGetSubCategory() {
		
		int id=2;
		SubCategory subCat=subCatDao.get(id);
		assertNotNull(subCat);
		
	}

	@Test
	public void testDeleteSubCategory() 
	{
		subCatDao.delete(2);
		SubCategory category=subCatDao.get(2);
		assertNull(category);
	}

	@Test
	public void testListAll() {
		List<SubCategory> list=subCatDao.listAll();
		assertTrue(list.size()>0);
	}

	@Test
	public void testCount() {
		
		long count=subCatDao.count();
		assertEquals(2, count);
	}
	
	@Test
	public void findBySubCategoryName()
	{
		String name="Java Advance";
		SubCategory category=subCatDao.findBySubCategoryName(name);
		assertNotNull(category);
	}
	@Test
	public void findByCategoryId()
	{
		int id=2;
		List<SubCategory> result=subCatDao.findByCategory(id);
		assertEquals(2, result.size());
	}
	

}
