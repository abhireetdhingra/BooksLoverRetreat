package com.bookstore.dao;

import static org.junit.Assert.*;

import java.util.List;


import org.junit.AfterClass;
import org.junit.BeforeClass;
import org.junit.Test;

import com.bookstore.entity.Categories;

public class CategoryDaoTest {

	//Moved all common code to BaseDaoTest class
	private static CategoryDao dao;
	
	@BeforeClass
	public static void setUpBeforeClass() throws Exception
	{

		dao=new CategoryDao();
	}

	@AfterClass
	public static void tearDownAfterClass() throws Exception
	{
		dao.close();
	}

	@Test
	public void testCreateCategories() {
		Categories category=new Categories();
		category.setCategoryName("Technology");
		Categories newCategory=dao.create(category);
		assertTrue(newCategory!=null && newCategory.getCategoryId()>0);

	}

	@Test
	public void testUpdateCategories()
	{
		Categories category=new Categories();
		category.setCategoryId(1);
		category.setCategoryName("Engineering Basic"); //changed name from "Engineering" to "Engineering Basic"
		Categories updatedCategory=dao.update(category);
		assertTrue(updatedCategory.getCategoryId()==1);
	}

	@Test
	public void testGetCategory()
	{
		int id=2;
		Categories category=dao.get(id);
		System.out.println("Category name: "+category.getCategoryName());
		assertNotNull(category);
	}

	@Test
	public void testDeleteCategory()
	{
		int id=2; //user to be deleted with id:2
		dao.delete(id);
		Categories deletedCategory=dao.get(id);
		assertNull(deletedCategory); //this should result null because we have deleted our user
	}

	@Test
	public void testListAll() {
		List<Categories> listCategories=dao.listAll();
		assertTrue(listCategories.size()>1);
	}

	@Test
	public void testCount()
	{
		long count=dao.count();
		assertTrue(count==3);
	}
	
	@Test
	public void testFindByName()
	{
		String catName="Fashion";
		Categories category=dao.findByCategoryName(catName);
		assertNotNull(category);
	}
	
	@Test
	public void testFindByNameNotFound()
	{
		String catName="Law1"; //law1 doesent exits in database
		Categories category=dao.findByCategoryName(catName);
		assertNull(category);
	}
}
