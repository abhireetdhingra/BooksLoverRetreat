package com.bookstore.dao;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.bookstore.entity.Books;
import com.bookstore.entity.Categories;

public class BookDao extends JpaDao<Books> implements GenericDao<Books>
{
	public BookDao()
	{
		
		// TODO Auto-generated constructor stub
	}
	
	@Override
	public Books create(Books book)
	{
		book.setLastUpdateDate(new Date()); //set to current date
		return super.create(book);
	}
	
	@Override
	public Books update(Books book)
	{
		book.setLastUpdateDate(new Date()); //set the updated date to recent date
		return super.update(book);
	}
	
	@Override
	public Books get(Object id) //this method returns a book with specified id
	{
		return super.get(Books.class, id);
	}

	@Override
	public void delete(Object bookid) {
		super.delete(Books.class, bookid);
		
	}

	@Override
	public List<Books> listAll() {
		
		return super.findByNamedQuery("listAllBooks");
	}

	public Books findByTitle(String title)
	{
		List<Books> listBooks=super.findByNamedQuery("findByTitle","title", title);
		if(!listBooks.isEmpty())
			return listBooks.get(0);
		return null;
	}
	
	@Override
	public long count() {
		return super.countEntitiesByNamedQuery("countAllBooks");
	}
	
	public long countByCategory(int categoryId)
	{
		return super.countEntitiesByNamedQuery("countByCategory","catId",categoryId);
	}
	
	public long countBySubCategory(int subCategoryId)
	{
		return super.countEntitiesByNamedQuery("countBySubCategory","subCatId",subCategoryId);
	}
	
	public List<Books> listByCategory(int categoryId)
	{
		return super.findByNamedQuery("listBooksByCategory","catId", categoryId);
	}
	
	public List<Books> listNewBooks()
	{
		//We could have done it in other way but jpa dosent support limit clause
		return super.findByNamedQuery("listNewBooks", 0, 5);
		
	}
	public List<Books> searchBooks(String keyword)
	{
		return super.findByNamedQuery("searchByKeyword", "keyword", keyword);
		
	}
	
	public List<Books> listBestSellingBooks() {
		return super.findByNamedQuery("bestSellingBooks", 0, 5);
	}	
	public List<Books> listMostFavouredBooks()
	{
		return super.findByNamedQuery("mostFavoredBooks", 0, 5);
		
	}
	public List<Books> listBoxSetsBooks()
	{
		//first of all get category id from category dao
		CategoryDao catDao=new CategoryDao();
		Categories category=catDao.findByCategoryName("Box Sets");
		return super.findByNamedQuery("listBooksByCategory","catId",category.getCategoryId());
	}
	public long filterReusltsByPrice(float lowerValue,float higherValue)
	{
		Map<String,Object> map=new HashMap<>();
		map.put("val1", lowerValue);
		map.put("val2", higherValue);
		return super.countEntitiesByNamedQuery("filterResultsByPrice",map);
	}
	
}
