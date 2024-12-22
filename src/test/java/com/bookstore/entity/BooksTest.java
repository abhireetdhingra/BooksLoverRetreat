package com.bookstore.entity;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

public class BooksTest {

	public static void main(String[] args) throws ParseException, IOException
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
		category.setCategoryId(1);
		category.setCategoryName("Technology");
		
		book.setCategory(category);
		//all the fields have been set 
		
		EntityManagerFactory emf=Persistence.createEntityManagerFactory("website");
		EntityManager em=emf.createEntityManager();
		
		em.getTransaction().begin();
		em.persist(book);
		em.getTransaction().commit();

		System.out.println("Object saved to database");
	}

}
