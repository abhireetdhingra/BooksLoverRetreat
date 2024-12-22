package com.bookstore.dao;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.bookstore.entity.Reviews;

public class ReviewDao extends JpaDao<Reviews> implements GenericDao<Reviews> {

	@Override
	public Reviews create(Reviews review) {
		review.setReviewTime(new Date());
		return super.create(review);
	}

	@Override
	public Reviews update(Reviews review) {
		return super.update(review);
	}

	@Override
	public Reviews get(Object id) {
		return super.get(Reviews.class, id);
	}

	@Override
	public void delete(Object id) {
		super.delete(Reviews.class, id);
	}

	@Override
	public List<Reviews> listAll() {
		return super.findByNamedQuery("listAllReviews");
	}

	@Override
	public long count() {
		return super.countEntitiesByNamedQuery("countAllReviews");
	}
	public long countByCustomer(int customerId) {
		return super.countEntitiesByNamedQuery("countByCustomer","customerId",customerId);
	}
	
	public Reviews findByCustomerAndBook(int customerId,int bookId)
	{
		Map<String,Object> map=new HashMap<>();
		map.put("customerId",customerId);
		map.put("bookId",bookId);
		
		List<Reviews> list=super.findByNamedQuery("findByCustomerAndBook", map);
		if(!list.isEmpty())
			return list.get(0);
		
		return null;
		
	}
	public List<Reviews> listMostRecent() {
		return super.findByNamedQuery("listAllReviews", 0, 3);
	}
	
}
