package com.bookstore.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.bookstore.entity.Users;

public class UserDao extends JpaDao<Users> implements GenericDao<Users>
{

	public UserDao() {
		
		// TODO Auto-generated constructor stub
	}
	
	public Users create(Users user) //this method is tested over UserDaoTest
	{ 
		return super.create(user);
	}
	
	@Override
	public Users update(Users user) {
		
		return super.update(user);
	}

	@Override
	public Users get(Object userId) {
		
		return super.get(Users.class, userId);
	}

	@Override
	public void delete(Object id) {
		super.delete(Users.class,id);
		
	}

	@Override
	public List<Users> listAll() {
		
		return super.findByNamedQuery("findAllUsers");
	}

	@Override
	public long count() {
		
		return super.countEntitiesByNamedQuery("CountAllUSers");
	}
	
	public Users findByEmail(String email)
	{
		List<Users> list= super.findByNamedQuery("findUserByEmail","email",email); //this will eithier result in null or a user object
		if(list!=null&&list.size()==1)
			return list.get(0);
		else
			return null;
	}
	public boolean checkLogin(String email,String password)
	{
		Map<String,Object> parameters=new HashMap<>();
		parameters.put("email", email);
		parameters.put("password", password);
		List<Users> listUsers=super.findByNamedQuery("checkLogin",parameters);
		if(listUsers.size()==1)
			return true;
		return false;
	}
	
	
}
