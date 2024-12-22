package com.bookstore.dao;

import static org.junit.Assert.*;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.junit.AfterClass;
import org.junit.BeforeClass;
import org.junit.Test;

import com.bookstore.entity.Books;
import com.bookstore.entity.Categories;
import com.bookstore.entity.SubCategory;

public class BookDaoTest {
	
	private static BookDao dao;
	@BeforeClass
	public static void setUpBeforeClass() throws Exception 
	{
		dao=new BookDao();
	}

	@AfterClass
	public static void tearDownAfterClass() throws Exception
	{
		dao.close();
	}

	@Test
	public void testCreateBooks() throws IOException, ParseException
	{
		Books book=new Books();
		book.setBookTitle("Effective Java (2nd Edition)");
		book.setBookAuthor("Joshua Bloch");
		String bookDescription="Are you looking for a deeper understanding of the Java™"
				+ " programming language so that you can write code that is clearer, more correct,"
				+ " more robust, and more reusable? Look no further! Effective Java™, Second Edition,"
				+ " brings together seventy-eight indispensable programmer’s rules of thumb: working,"
				+ " best-practice solutions for the programming challenges you encounter every day";
		book.setBookDescription(bookDescription);
		book.setBookIsbn("0321356683");
		book.setBookPrice(38.87f);
		book.setLastUpdateDate(new Date());
		
		//setting publish date
		DateFormat dateformat=new SimpleDateFormat("MM/dd/yyyy");
		Date publishDate=dateformat.parse("05/28/2008"); //28 may 2008
		book.setPublishdate(publishDate);
		
		//setting image path
		String imagePath="E:\\ProjectData\\books\\Effective Java.JPG";
		byte[] imageBytes=Files.readAllBytes(Paths.get(imagePath));
		book.setImage(imageBytes);
		
		//Setting category
		Categories category=new Categories();
		category.setCategoryId(2);
		category.setCategoryName("Technology");
		book.setCategory(category);
		
		//setting sub category
		SubCategoryDao subCatDao=new SubCategoryDao();
		SubCategory subCategory=subCatDao.get(3);
		book.setSubCategory(subCategory);
	
		
		Books newbook=dao.create(book);
		assertTrue(newbook.getBookId()>0);
	}
	@Test
	public void testCreateSecondBooks() throws IOException, ParseException
	{
		Books book=new Books();
		book.setBookTitle("Java 8 in Action: Lambdas, Streams, and functional-style programming");
		book.setBookAuthor("Raoul-Gabriel Urma, Mario Fusco, Alan Mycroft");
		String bookDescription="Java 8 in Action is a clearly written guide to the new features of Java 8. The book covers lambdas, streams, and functional-style programming. With Java 8's functional features you can now write more concise code in less time, and also automatically benefit from multicore architectures. It's time to dig in!\r\n"
				+ "\r\n"
				+ "Purchase of the print book includes a free eBook in PDF, Kindle, and ePub formats from Manning Publications.\r\n"
				+ "\r\n"
				+ "About the Book\r\n"
				+ "\r\n"
				+ "Every new version of Java is important, but Java 8 is a game changer. Java 8 in Action is a clearly written guide to the new features of Java 8. It begins with a practical introduction to lambdas, using real-world Java code. Next, it covers the new Streams API and shows how you can use it to make collection-based code radically easier to understand and maintain. It also explains other major Java 8 features including default methods, Optional, CompletableFuture, and the new Date and Time API.\r\n"
				+ "\r\n"
				+ "This book is written for programmers familiar with Java and basic OO programming.\r\n"
				+ "\r\n"
				+ "What's Inside\r\n"
				+ "\r\n"
				+ "How to use Java 8's powerful new features\r\n"
				+ "Writing effective multicore-ready applications\r\n"
				+ "Refactoring, testing, and debugging\r\n"
				+ "Adopting functional-style programming\r\n"
				+ "Quizzes and quick-check questions\r\n"
				+ "About the Authors\r\n"
				+ "\r\n"
				+ "Raoul-Gabriel Urma is a software engineer, speaker, trainer, and PhD candidate at the University of Cambridge. Mario Fusco is an engineer at Red Hat and creator of the lambdaj library. Alan Mycroft is a professor at Cambridge and cofounder of the Raspberry Pi Foundation.\r\n"
				;
		book.setBookDescription(bookDescription);
		book.setBookIsbn("1617291994");
		book.setBookPrice(36.72f);
		
		//setting publish date
		DateFormat dateformat=new SimpleDateFormat("MM/dd/yyyy");
		Date publishDate=dateformat.parse("08/28/2014"); //28 may 2008
		book.setPublishdate(publishDate);
		
		//setting image path
		String imagePath="E:\\ProjectData\\books\\Java 8 in Action.Jpg";
		byte[] imageBytes=Files.readAllBytes(Paths.get(imagePath));
		book.setImage(imageBytes);
		
		//Setting category
		Categories category=new Categories();
		category.setCategoryId(9);
		category.setCategoryName("Technology");
		
		book.setCategory(category);
		
		Books newbook=dao.create(book);
		assertTrue(newbook.getBookId()>0);
	}
	@Test
	public void testUpdateBooks() throws IOException, ParseException
	{
		Books existedBook=new Books();
		existedBook.setBookId(8);
		existedBook.setBookTitle("Effective Java (3nd Edition)");
		existedBook.setBookAuthor("Joshua Bloch");
		String bookDescription="Are you looking for a deeper understanding of the Java™"
				+ " programming language so that you can write code that is clearer, more correct,"
				+ " more robust, and more reusable? Look no further! Effective Java™, Second Edition,"
				+ " brings together seventy-eight indispensable programmer’s rules of thumb: working,"
				+ " best-practice solutions for the programming challenges you encounter every day";
		existedBook.setBookDescription(bookDescription);
		existedBook.setBookIsbn("0321356683");
		existedBook.setBookPrice(40f);
		existedBook.setLastUpdateDate(new Date());
		
		//setting publish date
		DateFormat dateformat=new SimpleDateFormat("MM/dd/yyyy");
		Date publishDate=dateformat.parse("05/28/2008"); //28 may 2008
		existedBook.setPublishdate(publishDate);
		
		//setting image path
		String imagePath="E:\\ProjectData\\books\\Effective Java.JPG";
		byte[] imageBytes=Files.readAllBytes(Paths.get(imagePath));
		existedBook.setImage(imageBytes);
		
		//Setting category
		Categories category=new Categories();
		category.setCategoryId(30);
		category.setCategoryName("Action");
		
		existedBook.setCategory(category);
		
		Books updatedbook=dao.update(existedBook);
		assertEquals(updatedbook.getBookTitle(),"Effective Java (3nd Edition)");
	}
	
	@Test
	public void testDeleteBooks()
	{
		int bookid=20;
		dao.delete(bookid);
		Books book=dao.get(19);
		assertTrue(book!=null);
	}
	
	@Test
	public void testGetBookSuccess()
	{
		int bookid=9;
		Books book=dao.get(bookid);
		assertTrue(book.getBookId()>0);
	}
	@Test
	public void testGetBookFail()
	{
		int bookid=99;
		Books book=dao.get(bookid);
		assertNull(book);
	}
	
	@Test
	public void testListAllBooks() 
	{
		List<Books> listBooks=dao.listAll();
		assertTrue(listBooks.size()==6);
	}
	@Test
	public void testFindByTitle() {
		String title="Effective Java (2nd Edition)";
		Books book=dao.findByTitle(title);
		assertEquals(book.getBookTitle(),title);
	}
	
	@Test
	public void testFindByTitleNotFound() {
		String title="Java is good";
		Books book=dao.findByTitle(title);
		assertNull(book);
	}
	@Test
	public void testCountBooks()
	{
		long count=dao.count();
		System.out.println("No of books: "+count);
		assertTrue(count>0);
	}
	@Test
	public void testListByCategory()
	{
		int catId=42;
		List<Books> list=dao.listByCategory(catId);
		for(Books book:list)
			System.out.println(book.getBookTitle());
		assertTrue(list.size()>0);
	}
	
	@Test
	public void testListNewBooks()
	{
		List<Books> list=dao.listNewBooks();
		System.out.println(list.size());
		assertEquals(5,list.size());
	}
	
	@Test
	public void testSearchBookByTitle() 
	{ 
		List<Books>
		list=dao.searchBooks("Java");
		assertEquals(4, list.size()); 
	}
	
	@Test
	public void testSearchBookByAuthor() 
	{ 
		List<Books>
		list=dao.searchBooks("Alan");
		assertEquals(2, list.size()); 
	}
	@Test
	public void testSearchBookByIsbn() 
	{ 
		List<Books> list=dao.searchBooks("2");
		assertEquals(6, list.size()); 
	}
	 
	@Test
	public void testCountBooksByCategory() 
	{
		long result=dao.countByCategory(44);
		assertEquals(4, result);
	}
	
	@Test
	public void testCountBooksBySubCategory() 
	{
		long result=dao.countBySubCategory(3);
		assertEquals(1, result);
	}
	
	
	/*
	 * @Test public void testGetBookReviews() { Books book=dao.get(3);
	 * System.out.println(book.getReviews()); assertTrue(book!=null); }
	 */
	@Test
	public void testListBestSellingBooks() {
		List<Books> topBestSellingBooks = dao.listBestSellingBooks();
		
		for (Books book : topBestSellingBooks) {
			System.out.println(book.getBookTitle());
		}
		
		assertEquals(1, topBestSellingBooks.size());
	}
	@Test
	public void testListMostFavouredSellingBooks() 
	{
		List<Books>result=dao.listMostFavouredBooks();
		for (Books book : result) {
			System.out.println(book.getBookTitle());
		}
		assertEquals(2,result.size());
	}
	@Test
	public void testListBoxSetsBooks()
	{
		List<Books> result=dao.listBoxSetsBooks();
		for (Books book : result) {
			System.out.println(book.getBookTitle());
		}
		assertEquals(1,result.size());
	}
	@Test
	public void testFilterReusltByPrice()
	{
		long result=dao.filterReusltsByPrice(10.0f, 30.0f);
		assertEquals(4, result);
	}
}
