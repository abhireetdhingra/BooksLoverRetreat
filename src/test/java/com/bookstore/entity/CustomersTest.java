package com.bookstore.entity;

import java.util.Date;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

public class CustomersTest
{
	public static void main(String[] args)
	{
		
		Customers customer1=new Customers();
		customer1.setEmail("example@gmail.com");
		customer1.setFirstName("JaiDeep");
		customer1.setLastName("Narula");
		customer1.setAddress("65,Narulas Mall");
		customer1.setCustomerCity("BeinsBerg");
		customer1.setCustomerState("Atlanta");
		customer1.setCustomerCountry("Australia");
		customer1.setCustomerPhone("233365");
		customer1.setZipCode("332");
		customer1.setPassword("Abckithegayisi");
		
		
		
		EntityManagerFactory emf=Persistence.createEntityManagerFactory("website");
		EntityManager em=emf.createEntityManager();
		em.getTransaction().begin();
		
		em.persist(customer1);
		em.getTransaction().commit();

		System.out.println("Object saved to database");
	}
	
}
