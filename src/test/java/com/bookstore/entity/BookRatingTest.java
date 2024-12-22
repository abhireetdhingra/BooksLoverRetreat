package com.bookstore.entity;

import static org.junit.Assert.*;

import java.util.HashSet;
import java.util.Set;

import org.junit.Test;

public class BookRatingTest {

	@Test
	public void testAverageRating1() 
	{
		Books book=new Books();
		Set<Reviews> reviews=new HashSet<>();
		
		Reviews review1=new Reviews();
		review1.setRating(5);
		reviews.add(review1);
		
		book.setReviews(reviews);
		
		float averageRating=book.getAveragerating();
		assertEquals(5.0,averageRating,0.0);
	}
	
	@Test
	public void testAverageRating2() 
	{
		Books book=new Books();
		Set<Reviews> reviews=new HashSet<>();
		
		book.setReviews(reviews);
		
		float averageRating=book.getAveragerating();
		assertEquals(0.0,averageRating,0.0);
	}
	
	@Test
	public void testAverageRating3() 
	{
		Books book=new Books();
		Set<Reviews> reviews=new HashSet<>();
		
		Reviews review1=new Reviews();
		review1.setRating(5);
		reviews.add(review1);
		
		Reviews review2=new Reviews();
		review2.setRating(4);
		reviews.add(review2);
		
		Reviews review3=new Reviews();
		review3.setRating(3);
		reviews.add(review3);
		
		book.setReviews(reviews);
		
		float averageRating=book.getAveragerating();
		assertEquals(4.0,averageRating,0.0);
	}
	
	@Test
	public void testRatingString1()
	{
		float averageRating=0.0f;
		Books book=new Books();
		
		String actual=book.getRatingString(averageRating);
		
		String expected="off,off,off,off,off";
		assertEquals(expected,actual);
	}
	
	@Test
	public void testRatingString2()
	{
		float averageRating=5.0f;
		Books book=new Books();
		
		String actual=book.getRatingString(averageRating);
		
		String expected="on,on,on,on,on";
		assertEquals(expected,actual);
		
	}
	@Test
	public void testRatingString3()
	{
		float averageRating=3.0f;
		Books book=new Books();
		
		String actual=book.getRatingString(averageRating);
		
		String expected="on,on,on,off,off";
		assertEquals(expected,actual);
		
	}
	@Test
	public void testRatingString4()
	{
		float averageRating=4.5f;
		Books book=new Books();
		
		String actual=book.getRatingString(averageRating);
		
		String expected="on,on,on,on,half";
		assertEquals(expected,actual);
		
	}
	@Test
	public void testRatingString5()
	{
		float averageRating=3.5f;
		Books book=new Books();
		
		String actual=book.getRatingString(averageRating);
		
		String expected="on,on,on,half,off";
		assertEquals(expected,actual);
		
	}

}
