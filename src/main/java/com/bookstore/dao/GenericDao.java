package com.bookstore.dao;

import java.util.List;

//These operations are common for all dao classes
//We have created an interface of generic type
public interface GenericDao <T>
{
	public T create(T t);
	public T update(T t);
	public T get(Object id);
	public void delete(Object id);
	public List<T> listAll();
	public long count();
}
