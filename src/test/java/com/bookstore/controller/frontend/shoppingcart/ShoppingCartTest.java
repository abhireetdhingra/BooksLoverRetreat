package com.bookstore.controller.frontend.shoppingcart;

import static org.junit.Assert.*;

import java.util.Map;

import org.junit.BeforeClass;
import org.junit.Test;

import com.bookstore.dao.BookDao;
import com.bookstore.entity.Books;

public class ShoppingCartTest {

	private static ShoppingCart cart; //made an object of shopping cart
	private static BookDao bookDao;
	@BeforeClass
	public static void setUpBeforeClass() throws Exception
	{
		cart = new ShoppingCart();
		bookDao=new BookDao();
		Books book=bookDao.get(2);

		cart.addItem(book);
		cart.addItem(book);		
	}

	@Test
	public void testAddItem() 
	{
//		Map<Books,Integer> map=cart.getItems();
//		for(Map.Entry<Books, Integer> entry:map.entrySet())
//			System.out.println(entry.getKey().getBookId()+" quantity: "+entry.getValue());
		
		Map<Books,Integer> map=cart.getItems();
		int quantity=map.get(bookDao.get(2));
		assertEquals(2,quantity);
	}
	
	@Test
	public void testRemoveItem() {
		cart.removeItem(new Books(2));
		
		assertTrue(cart.getItems().isEmpty());
	}
	@Test
	public void testRemoveItem2() {
		Books book2 = new Books(3);
		cart.addItem(book2);
		
		cart.removeItem(new Books(3));
		
		assertNull(cart.getItems().get(book2));
	}	
	
	@Test
	public void testGetTotalQuantity() {
		Books book3 = new Books(3);
		cart.addItem(book3);
		cart.addItem(book3);
		cart.addItem(book3);
		
		assertEquals(5, cart.getTotalQuantity());
	}
	@Test
	public void testGetTotalAmount1() {
		ShoppingCart cart = new ShoppingCart();
		assertEquals(0.0f, cart.getTotalAmount(), 0.0f);
	}
	@Test
	public void testGetTotalAmount2() {		
		assertEquals(77.74f, cart.getTotalAmount(), 0.0f);
	}
	@Test
	public void testClear() {
		cart.clear();
		
		assertEquals(0, cart.getTotalQuantity());
	}
	@Test
	public void testUpdateCart()
	{
		ShoppingCart cart = new ShoppingCart();
		Books book1 = new Books(2);
		Books book2 = new Books(3);
		
		cart.addItem(book1);
		cart.addItem(book2);
		
		int[]ids= {2,3};
		int[]quantities= {3,4}; //update quantities here
		cart.updateCart(ids, quantities);
		assertEquals(7,cart.getTotalQuantity());
	}
}
