package com.bookstore.dao;

import static org.junit.Assert.*;

import java.util.List;

import org.junit.AfterClass;
import org.junit.BeforeClass;
import org.junit.Test;

import com.bookstore.entity.Books;
import com.bookstore.entity.Customers;
import com.bookstore.entity.Reviews;

public class ReviewDaoTest {

	private static ReviewDao reviewDao;
	@BeforeClass
	public static void setUpBeforeClass() throws Exception 
	{
		reviewDao = new ReviewDao();
	}

	@AfterClass
	public static void tearDownAfterClass() throws Exception
	{
		reviewDao.close();
	}

	@Test
	public void testCreateReview() {
		Reviews review = new Reviews();
		Books book = new Books();
		book.setBookId(3);
		
		Customers customer = new Customers();
		customer.setCustomerId(8);
		
		review.setBook(book);
		review.setCustomer(customer);
		
		review.setHeadline("Must have book for every graduate");
		review.setRating(3);
		review.setComment("This book covers all java concepts in depth with clear understanding");
		
		Reviews savedReview = reviewDao.create(review);
		
		assertTrue(savedReview.getReviewId() > 0);
	}
	@Test
	public void testCreateReviewWithNoHeadlineAndComment() {
		Reviews review = new Reviews();
		Books book = new Books();
		book.setBookId(5);
		
		Customers customer = new Customers();
		customer.setCustomerId(7);
		
		review.setBook(book);
		review.setCustomer(customer);
		review.setRating(5);
		
		Reviews savedReview = reviewDao.create(review);
		assertTrue(savedReview.getReviewId() > 0);
	}
	
	@Test
	public void testGetReviewSuccess()
	{
		Reviews review=reviewDao.get(1);
		assertNotNull(review);
	}
	
	@Test
	public void testGetReviewFail()
	{
		Reviews review=reviewDao.get(9);
		assertNull(review);
	}
	
	@Test
	public void testUpdateReview()
	{
		Reviews review=reviewDao.get(1);
		review.setHeadline("Loved this book alot");
		Reviews updatedReview=reviewDao.update(review);
		assertEquals(review.getHeadline(), updatedReview.getHeadline());
	}
	
	@Test
	public void testDeleteReview()
	{
		reviewDao.delete(1);
		Reviews review=reviewDao.get(1);
		assertNull(review);
	}
	@Test
	public void testListAllReviews()
	{
		List<Reviews> list=reviewDao.listAll();
		assertTrue(list.size()==1);
	}
	@Test
	public void testCountAllReviews()
	{
		Long count=reviewDao.count();
		assertTrue(count==1);
	}
	
	@Test
	public void testFindByCustomerAndBookFail()
	{
		Reviews review=reviewDao.findByCustomerAndBook(99,100);
		assertNull(review);
	}
	@Test
	public void testFindByCustomerAndBookFSuccess()
	{
		Reviews review=reviewDao.findByCustomerAndBook(7,3);
		assertNotNull(review);
	}
	@Test
	public void testListMostRecent() {
		List<Reviews> recentReviews = reviewDao.listMostRecent();
		for(Reviews review:recentReviews)
		{
			System.out.println(review.getCustomer().getCustomerId());
		}
		assertEquals(3, recentReviews.size());
	}
}
