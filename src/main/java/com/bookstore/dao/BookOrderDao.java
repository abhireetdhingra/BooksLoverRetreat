package com.bookstore.dao;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.bookstore.entity.BookOrders;

public class BookOrderDao extends JpaDao<BookOrders> implements GenericDao<BookOrders> {

	@Override
	public BookOrders create(BookOrders order) {
		order.setOrderDate(new Date());
		order.setStatus("Processing");
		return super.create(order);
	}

	@Override
	public BookOrders update(BookOrders order) {
		return super.update(order);
	}

	@Override
	public BookOrders get(Object orderId) {

		return super.get(BookOrders.class, orderId);
	}

	// This method is created to fix the bug oder_Detail.jsp page in Frontend
	public BookOrders get(Integer orderId, Integer customerId) {
		Map<String, Object> parameters = new HashMap<>();
		parameters.put("orderId", orderId);
		parameters.put("customerId", customerId);

		List<BookOrders> result = super.findByNamedQuery("findByIdAndCustomer", parameters);

		if (!result.isEmpty()) {
			return result.get(0);
		}
		return null;
	}

	@Override
	public void delete(Object orderId) {
		super.delete(BookOrders.class, orderId);

	}

	@Override
	public List<BookOrders> listAll() {
		return super.findByNamedQuery("listAllOrders");
	}

	@Override
	public long count() {
		return super.countEntitiesByNamedQuery("countAllOrders");
	}

	public long countOrderDetailByBook(int bookId) // This method is implemented to prevent deletion of book who has
													// orders associated with it
	{
		return super.countEntitiesByNamedQuery("countByBook", "bookId", bookId);
	}

	public long countBookOrderByCustomer(int customerId) {
		return super.countEntitiesByNamedQuery("countBookOrdersByCustomer", "customerId", customerId);
	}

	public List<BookOrders> listByCustomer(Integer customerId) {
		return super.findByNamedQuery("findOrdersByCustomer", "customerId", customerId);
	}
	//for admin module to list most recent sales
	public List<BookOrders> listMostRecentSales() {
		return super.findByNamedQuery("listAllOrders", 0, 3);
	}
}
