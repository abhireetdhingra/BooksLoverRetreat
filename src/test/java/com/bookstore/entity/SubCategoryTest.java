package com.bookstore.entity;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

public class SubCategoryTest
{
	public static void main(String[] args)
	{
		SubCategory subCat1=new SubCategory("Hockey");
		SubCategory subCat2=new SubCategory("badminton");
		
		Categories category=new Categories();
		category.setCategoryId(1);
		
		subCat1.setCategory(category);
		subCat2.setCategory(category);
		

		EntityManagerFactory emf=Persistence.createEntityManagerFactory("website");
		EntityManager em=emf.createEntityManager();
		
		em.getTransaction().begin();
		em.persist(subCat1);
		em.persist(subCat2);
		em.getTransaction().commit();

		System.out.println("Object saved to database");
		
		
	}
}
