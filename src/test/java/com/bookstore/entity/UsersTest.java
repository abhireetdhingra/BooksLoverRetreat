package com.bookstore.entity;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import com.bookstore.entity.Users;

public class UsersTest {

	public static void main(String[] args)
	{
		Users user1=new Users();
		user1.setEmail("Rashneet1234@gmail.com");
		user1.setFullName("Rashneet Singh");
		user1.setPassword("rash");
		
		EntityManagerFactory emf=Persistence.createEntityManagerFactory("website");
		EntityManager em=emf.createEntityManager();
		
		em.getTransaction().begin();
		em.persist(user1);
		em.getTransaction().commit();

		System.out.println("Object saved to database");
	}

}
