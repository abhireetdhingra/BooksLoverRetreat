package com.bookstore.dao;

import static org.junit.Assert.*;

import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

import org.junit.AfterClass;
import org.junit.BeforeClass;
import org.junit.Test;

import com.bookstore.entity.BookOrders;
import com.bookstore.entity.Books;
import com.bookstore.entity.Customers;
import com.bookstore.entity.OrderDetail;

public class BookOrderDaoTest {

	private static BookOrderDao orderDAO;

	@BeforeClass
	public static void setUpBeforeClass() throws Exception {
		orderDAO = new BookOrderDao();
	}

	@AfterClass
	public static void tearDownAfterClass() throws Exception {
		orderDAO.close();
	}

	@Test
	public void testCreateBookOrders() {
		BookOrders order = new BookOrders();
		Customers customer = new Customers();
		customer.setCustomerId(7); // jaideep placed this order

		order.setCustomer(customer);
		order.setFirstname("Nam");
		order.setLastname("Ha Minh");
		order.setPhone("123456789");
		order.setAddressLine1("123 South Street");
		order.setAddressLine2("Clifton Park");
		order.setCity("New York");
		order.setState("New York");
		order.setCountry("US");
		order.setPaymentMethod("paypal");
		order.setZipcode("123456");

		Set<OrderDetail> orderDetails = new HashSet<>(); // for testing we have only one order detail in set
		OrderDetail orderDetail = new OrderDetail();

		Books book = new Books(3); // for book java 8 in action
		orderDetail.setBook(book);
		orderDetail.setQuantity(2);
		orderDetail.setSubtotal(73.44f);
		orderDetail.setBookOrder(order);

		orderDetails.add(orderDetail);

		order.setOrderDetails(orderDetails);
		order.setSubtotal(73.44f);
		order.setTotal(76.8f);

		orderDAO.create(order);
		assertTrue(order.getOrderId() > 0);

	}

	@Test
	public void testUpdateBookOrderShippingAddress() {
		Integer orderId = 1;
		BookOrders order = orderDAO.get(orderId);
		order.setAddressLine1("New Shipping Address");

		orderDAO.update(order);

		BookOrders updatedOrder = orderDAO.get(orderId);

		assertEquals(order.getAddressLine1(), updatedOrder.getAddressLine1());

	}

	@Test
	public void testUpdateBookOrderDetail() {
		Integer orderId = 1;
		BookOrders order = orderDAO.get(orderId);

		Iterator<OrderDetail> iterator = order.getOrderDetails().iterator();

		while (iterator.hasNext()) {
			OrderDetail orderDetail = iterator.next();
			if (orderDetail.getBook().getBookId() == 3) {
				orderDetail.setQuantity(3);
				orderDetail.setSubtotal(120);
			}
		}

		orderDAO.update(order);

		BookOrders updatedOrder = orderDAO.get(orderId);

		iterator = order.getOrderDetails().iterator();

		int expectedQuantity = 3;
		float expectedSubtotal = 120;
		int actualQuantity = 0;
		float actualSubtotal = 0;

		while (iterator.hasNext()) {
			OrderDetail orderDetail = iterator.next();
			if (orderDetail.getBook().getBookId() == 3) {
				actualQuantity = orderDetail.getQuantity();
				actualSubtotal = orderDetail.getSubtotal();
			}
		}

		assertEquals(expectedQuantity, actualQuantity);
		assertEquals(expectedSubtotal, actualSubtotal, 0.0f);

	}

	@Test
	public void testGetOrder() {
		Integer orderId = 1;
		BookOrders order = orderDAO.get(orderId);
		assertEquals(1, order.getOrderDetails().size());
	}

	@Test
	public void testDeleteOrder() {
		int orderId = 2;
		orderDAO.delete(orderId);
		
		BookOrders order = orderDAO.get(orderId);
		
		assertNull(order);
	}

	@Test
	public void testListAll() {
		List<BookOrders> listOrders = orderDAO.listAll();

		for (BookOrders order : listOrders) {
			System.out.println(order.getOrderId() + " - " + order.getCustomer().getFirstName() + " - "
					+ order.getTotal() + " - " + order.getStatus());
			for (OrderDetail detail : order.getOrderDetails()) {
				Books book = detail.getBook();
				int quantity = detail.getQuantity();
				float subtotal = detail.getSubtotal();
				System.out.println("\t" + book.getBookTitle() + " - " + quantity + " - " + subtotal);
			}
		}

		assertTrue(listOrders.size() > 0);
	}

	@Test
	public void testCount() {
		long totalOrders = orderDAO.count();
		assertEquals(1, totalOrders);
	}
	@Test
	public void testListByCustomerNoOrders() {
		Integer customerId = 99;
		List<BookOrders> listOrders = orderDAO.listByCustomer(customerId);
		
		assertTrue(listOrders.isEmpty());
	}
	@Test
	public void testListByCustomerHaveOrders() {
		Integer customerId = 9;
		List<BookOrders> listOrders = orderDAO.listByCustomer(customerId);
		
		assertTrue(listOrders.size() > 0);
	}	
	@Test
	public void testListMostRecentSales() {
		List<BookOrders> recentOrders = orderDAO.listMostRecentSales();
		
		assertEquals(3, recentOrders.size());
	}
	

}
