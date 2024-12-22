package com.bookstore.entity;

import java.util.Date;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

public class CategoryTest 
{
	public static void main(String[] args)
	{
		Categories category=new Categories("Sports");
//		Books book1=new Books();
//		Books book2=new Books();
//		
//		book1.setBookTitle("Learn Dsa");
//		book1.setBookAuthor("Joseph Martin");
//		book1.setBookDescription("Nice book to learn dsa");
//		book1.setBookIsbn("1234");
//		book1.setImage();
//		book1.setLastUpdateDate();
		
		EntityManagerFactory emf=Persistence.createEntityManagerFactory("website");
		EntityManager em=emf.createEntityManager();
		
		em.getTransaction().begin();
		em.persist(category);
		em.getTransaction().commit();

		System.out.println("Object saved to database");
	}
	
	
	
}
