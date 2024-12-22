package com.bookstore.dao;

import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Persistence;
import javax.persistence.Query;


//We are going to create java persistence api 
//for reference watch, telusko video
//The purpose of jpaDao is to provide common operations that are shared among its subclasses
public class JpaDao<E> {

	private static EntityManagerFactory entityManagerFactory;

	public JpaDao() {
		super();

	}

	static {
		entityManagerFactory = Persistence.createEntityManagerFactory("website");

	}

	public E create(E entity) {
		EntityManager entityManager = entityManagerFactory.createEntityManager();

		entityManager.getTransaction().begin(); // begin transaction
		entityManager.persist(entity); // saving the object to database
		entityManager.flush(); // closing session(what i assume to be)
		entityManager.refresh(entity);
		entityManager.getTransaction().commit(); // commit transaction

		entityManager.close();
		return entity;
	}

	public E update(E entity) {
		EntityManager entityManager = entityManagerFactory.createEntityManager();

		entityManager.getTransaction().begin(); // begin transaction
		entity = entityManager.merge(entity); // it will help to merge new data with old data
		entityManager.getTransaction().commit(); // commit transaction

		entityManager.close();
		return entity;
	}

	public E get(Class<E> entity, Object id) {
		EntityManager entityManager = entityManagerFactory.createEntityManager();

		EntityTransaction tx = entityManager.getTransaction();// begin transaction
		tx.begin();
		E e = entityManager.find(entity, id);
		if (e != null) {
			entityManager.refresh(e);
		}
		// a small change which was not done by instructor
//		
		entityManager.getTransaction().rollback();

		entityManager.close();
		return e;
	}

	public void delete(Class<E> entity, Object userId) {
		EntityManager entityManager = entityManagerFactory.createEntityManager();

		entityManager.getTransaction().begin(); // begin transaction
		E e = entityManager.find(entity, userId);

		// basically remove method wants a reference of object to be deleted
		// We can provide the reference using find method as well as getReference()
		// Object reference =entityManager.getReference(entity,userId) //just as finnd
		// method
		entityManager.remove(e); // e is removed from table
		entityManager.getTransaction().commit(); // commit transaction

		entityManager.close();
	}

	public List<E> findByNamedQuery(String query_name) // a method that returns a list of entities and operates by JPQL
														// using named queries
	{
		EntityManager entityManager = entityManagerFactory.createEntityManager();

		Query query = entityManager.createNamedQuery(query_name);
		List<E> result = query.getResultList();

		entityManager.close();
		return result;

	}

	
	public List<E> findByNamedQuery(String query_name,int firstResult,int maxResult)
	{
		
		EntityManager entityManager = entityManagerFactory.createEntityManager();

		Query query = entityManager.createNamedQuery(query_name);
		query.setFirstResult(firstResult);
		query.setMaxResults(maxResult);
		List<E> result = query.getResultList();

		entityManager.close();
		return result;
	}
	
	// same name method of findNamedQuery for functionalities like: Find user with
	// given email
	public List<E> findByNamedQuery(String query_name, String paramName, Object paramValue) // a method that returns a
																							// list of entities and																						// operates by JPQL using																						// named queries
	{
		EntityManager entityManager = entityManagerFactory.createEntityManager();

		Query query = entityManager.createNamedQuery(query_name);
		query.setParameter(paramName, paramValue);

		List<E> result = query.getResultList();

		entityManager.close();
		return result;  // we will assume that there are more than 1 user with same email
		
	}

	public List<E> findByNamedQuery(String query_name, Map<String, Object> parameters)
	{
		EntityManager entityManager = entityManagerFactory.createEntityManager();
		
		Query query = entityManager.createNamedQuery(query_name);
		Set<Entry<String, Object>> setParameters = parameters.entrySet();

		for (Entry<String, Object> entry : setParameters)
			query.setParameter(entry.getKey(), entry.getValue());
		List<E> result = query.getResultList();

		entityManager.close();
		return result;
	}

	public long countEntitiesByNamedQuery(String query_name) {
		EntityManager entityManager = entityManagerFactory.createEntityManager();
		
		Query query = entityManager.createNamedQuery(query_name);
		long result=(long) query.getSingleResult();
		
		entityManager.close();
		return result;
	}
	public long countEntitiesByNamedQuery(String query_name, String paramName, Object paramValue) {
		EntityManager entityManager = entityManagerFactory.createEntityManager();
		
		Query query = entityManager.createNamedQuery(query_name);
		query.setParameter(paramName, paramValue);

		long result=(long) query.getSingleResult();
		
		entityManager.close();
		return result;
	}
	public long countEntitiesByNamedQuery(String query_name, Map<String,Object> parameters) {
		EntityManager entityManager = entityManagerFactory.createEntityManager();
		
		Query query = entityManager.createNamedQuery(query_name);
		Set<Entry<String, Object>> setParameters = parameters.entrySet();
		for (Entry<String, Object> entry : setParameters)
			query.setParameter(entry.getKey(), entry.getValue());

		long result=(long) query.getSingleResult();
		
		entityManager.close();
		return result;
	}
	
	
	public void close()
	{
		if(entityManagerFactory!=null)
			entityManagerFactory.close();
	}
	
}
