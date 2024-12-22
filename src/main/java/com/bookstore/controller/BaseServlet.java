package com.bookstore.controller;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;

//This class is made for the purpose to reduce duplicate code and data redundancy

//we have made this class is made abstract so that no one can instantiate this class
public abstract class BaseServlet extends HttpServlet
{
	private static final long serialVersionUID = 1L;
	protected EntityManager entityManager;		//made protected so that its base class can extend parent's property
	protected EntityManagerFactory factory;
	
	@Override
	public void init() throws ServletException
	{
		factory = Persistence.createEntityManagerFactory("website");
		entityManager = factory.createEntityManager();
	}
	
	@Override
	public void destroy()
	{
		entityManager.close();
		factory.close();
	}
	
	
	
}
