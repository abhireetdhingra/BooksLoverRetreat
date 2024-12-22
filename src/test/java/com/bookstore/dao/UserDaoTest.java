package com.bookstore.dao;

import static org.junit.Assert.*;

import java.util.List;

import javax.persistence.PersistenceException;

import org.junit.AfterClass;
import org.junit.BeforeClass;
import org.junit.Test;

import com.bookstore.entity.Users;

public class UserDaoTest {
	
	private static UserDao dao;
	//moved all commom code to BaseDaoTest class
	
	@BeforeClass
	public static void setUpCLass() throws Exception
	{

	    dao=new UserDao();
	}

	@Test
	public void testCreateUsers() 
	{
		Users user1=new Users();
		user1.setEmail("dollydhingra@gmail.com");
		user1.setFullName("Kuljit Kaur");
		user1.setPassword("KaurKuljit");

		Users user=dao.create(user1);
		
		System.out.println("Object saved to database");
		assertTrue(user.getUserId()>0); 
	}
	
	@Test(expected=PersistenceException.class)
	public void testCreateUsersFieldsNotSet()
	{
		Users user1=new Users();
		
		Users user=dao.create(user1);
		
	}
	@Test
	public void testGetUsersFound()
	{
		int id=1;	//here we know id 1 exits
		Users user=dao.get(id);
		System.out.println("User email: "+user.getEmail());
		assertNotNull(user);
	}
	
	@Test
	public void testGetUsersNotFound()
	{
		int id=7; //here we will provide an id which dosent exits in table
		Users user=dao.get(id);
		assertNull(user);
	}
	
	@Test
	public void testUpdateUsers()
	{
		Users user=new Users();
		user.setUserId(1);
		user.setEmail("abhireetdhingra18gmail.com");
		user.setFullName("Abhireet");
		user.setPassword("PasswordNahiBatana");
		Users user1=dao.update(user); //update user with new values
		String expected="PasswordNahiBatana";
		String actual=user1.getPassword();
		System.out.println("Object updated in database");
		assertEquals(expected,actual);
	}
	@Test
	public void testDeleteUsers()
	{

		int userId=2; //userId to be deleted
		dao.delete(userId);
		Users user=dao.get(userId);
		assertNull(user); //now the same user with id 2 should be null
	}
	@Test(expected=Exception.class)
	public void testDeleteNonExitsUser()
	{
		int userId=22; // this userId dosent exits in database
		dao.delete(userId);
	}
	
	@Test
	public void testListAll()
	{
		List<Users> usersList=dao.listAll();
		assertTrue(usersList.size()>1); //only true when size of returned users list is greater than 1
	}
	
	@Test
	public void testCount()
	{
		Long noOfUsers=dao.count();
		assertTrue(noOfUsers>1);
	}
	@Test
	public void testCheckLoginSuccess()
	{
		String email="abhireetdhingra18@yahoo.com";
		String password="singhAbhireet";
		boolean check=dao.checkLogin(email, password);
		assertTrue(check);
	}
	@Test
	public void testCheckLoginFail()
	{
		String email="palakchinna@gmail.com";
		String password="gaf4252";
		boolean check=dao.checkLogin(email, password);
		assertFalse(check);
	}
	
	@Test
	public void testFindUsersByEmail()
	{
		String email="abhireetdhingra18@gmail.com"; //test case
		Users user=dao.findByEmail(email);
		assertNotNull(user);
	}
	
	@AfterClass
	public static void tearDownClass() throws Exception
	{
		dao.close();
	}

}
