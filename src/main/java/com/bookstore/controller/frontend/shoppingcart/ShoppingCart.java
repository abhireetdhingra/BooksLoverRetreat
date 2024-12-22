package com.bookstore.controller.frontend.shoppingcart;

import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

import com.bookstore.entity.Books;

public class ShoppingCart 
{
	private Map<Books, Integer> cart = new HashMap<>();	//created a cart of type Map<Books,Integer>
	
	public void addItem(Books book) 
	{
		if (cart.containsKey(book)) 
		{
			int quantity = cart.get(book) + 1;
			cart.put(book, quantity);			
		} 
		else 
			cart.put(book, 1);
	}
	
	public Map<Books, Integer> getItems() 
	{
		return this.cart;
	}
	
	public void removeItem(Books book) {
		cart.remove(book);
	}
	public int getTotalQuantity() {
		int total = 0;
		
		Iterator<Books> iterator = cart.keySet().iterator();
		
		while (iterator.hasNext()) {
			Books next = iterator.next();
			Integer quantity = cart.get(next);
			total += quantity;
		}
		return total;
	}
	public float getTotalAmount() {
		float total = 0.0f;
		
		Iterator<Books> iterator = cart.keySet().iterator();
		
		while (iterator.hasNext()) {
			Books book = iterator.next();
			Integer quantity = cart.get(book);
			double subTotal = quantity * book.getBookPrice();
			total += subTotal;
		}		
		
		return total;
	}
	public void clear() {
		cart.clear();
	}
	public int getTotalItems() {
		return cart.size();
	}
	
	public void updateCart(int[]bookIds,int[]quantities)
	{
		for (int i = 0; i < bookIds.length; i++)
		{
			Books key = new Books(bookIds[i]);
			Integer value = quantities[i];
			cart.put(key, value);	//this will update the book quantity to new 
		}
	}
	
}
