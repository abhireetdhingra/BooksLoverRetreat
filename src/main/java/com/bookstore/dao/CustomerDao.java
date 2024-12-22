package com.bookstore.dao;


import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.bookstore.entity.Customers;

public class CustomerDao extends JpaDao<Customers> implements GenericDao<Customers> 
{

	@Override
	public Customers create(Customers customer) {
	
		customer.setRegisteredDate(new Date());
		return super.create(customer);
		
	}

	@Override
	public Customers update(Customers customer) {
		return super.update(customer);
	}

	@Override
	public Customers get(Object id) {
	
		return super.get(Customers.class, id);
	}

	@Override
	public void delete(Object id) {
		super.delete(Customers.class, id);
		
	}

	@Override
	public List<Customers> listAll() {
		
		return super.findByNamedQuery("listAllCustomers");
	}

	@Override
	public long count() {
		
		return super.countEntitiesByNamedQuery("countAllCustomers");
	}
	public Customers findByEmail(String email)
	{
		List<Customers> list=super.findByNamedQuery("findCustomerByEmail", "email",email);
		if(!list.isEmpty())
			return list.get(0);
		return null;
	}
	
	public Customers checkLogin(String email,String password)
	{
		Map<String,Object> map=new HashMap<>();
		map.put("email",email);
		map.put("pass",password);
		List<Customers> result=super.findByNamedQuery("checkCustomerLogin",map);
		if(!result.isEmpty())
			return result.get(0);
		return null;
		
	}
}
