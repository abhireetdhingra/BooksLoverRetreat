package com.bookstore.dao;

import static org.junit.Assert.*;

import java.util.List;

import org.junit.AfterClass;
import org.junit.BeforeClass;
import org.junit.Test;

import com.bookstore.entity.Customers;

public class CustomerDaoTest {
	
	private static CustomerDao customerDao;
	
	@BeforeClass
	public static void setUpBeforeClass() throws Exception 
	{
		customerDao=new CustomerDao();
	}

	@AfterClass
	public static void tearDownAfterClass() throws Exception
	{
		customerDao.close();
	}

	@Test
	public void testCreateCustomers() 
	{
		Customers customer1=new Customers();
		customer1.setEmail("abhijeet@yahoo.com");
		customer1.setFirstName("Abhijeet SIngh Dhiman");
		customer1.setAddress("67,Brampton");
		customer1.setCustomerCity("France");
		customer1.setCustomerState("Malcokyta");
		customer1.setCustomerCountry("Australia");
		customer1.setCustomerPhone("665225");
		customer1.setZipCode("2236");
		customer1.setPassword("MyNameIsAbhi");
		customerDao.create(customer1);
		assertNotNull(customer1);
	}
	@Test
	public void testGetCustomers() 
	{
		int id=1;
		Customers customer=customerDao.get(id);
		assertNotNull(customer);
	}
	
	@Test
	public void testDeleteCustomers() 
	{
		customerDao.delete(1);
		Customers customer=customerDao.get(1);
		assertNull(customer);
	}
	
	@Test
	public void testUpdateCustomers() 
	{
		Customers customerExisted=customerDao.get(2);
		customerExisted.setFirstName("Tom Marry");
		Customers updatedCustomer=customerDao.update(customerExisted);
		assertEquals("Tom Marry",updatedCustomer.getFirstName());
	}
	
	@Test
	public void testListAllCustomers() 
	{
		List<Customers> list=customerDao.listAll();
		assertEquals(1,list.size());
	}
	
	@Test
	public void testCountCustomers() 
	{
		long result=customerDao.count();
		assertEquals(1, result);
	}
	
	@Test
	public void testFindCustomerByEmail()
	{
		Customers customer=customerDao.findByEmail("abhijeet@yahoo.com");
		assertNotNull(customer);
	}
	
	@Test
	public void testCheckCustomerLoginSuccess()
	{
		Customers customer=customerDao.checkLogin("jagga@dakku.com","jaggaSingh");
		System.out.println(customer.getCustomerFullName());
		assertNotNull(customer);
	}
	@Test
	public void testCheckCustomerLoginFail()
	{
		Customers customer=customerDao.checkLogin("jagga@dakku.com","abhireet");
		System.out.println(customer);
		assertNull(customer);
	}
	
	
}
