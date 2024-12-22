package com.bookstore.service;

import java.io.IOException;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bookstore.controller.frontend.shoppingcart.ShoppingCart;
import com.bookstore.dao.BookOrderDao;
import com.bookstore.entity.BookOrders;
import com.bookstore.entity.Books;
import com.bookstore.entity.Customers;
import com.bookstore.entity.OrderDetail;
import com.bookstore.entity.Reviews;
import com.paypal.api.payments.ItemList;
import com.paypal.api.payments.Payment;
import com.paypal.api.payments.ShippingAddress;

public class BookOrderServices {

	private HttpServletRequest request;
	private HttpServletResponse response;
	private BookOrderDao orderDao;

	public BookOrderServices(HttpServletRequest request, HttpServletResponse response) {
		super();
		this.request = request;
		this.response = response;
		orderDao = new BookOrderDao();
	}

	public void listOrders(String message) throws ServletException, IOException {
		List<BookOrders> list = orderDao.listAll();
		request.setAttribute("orderList", list);
		if (message != null)
			request.setAttribute("message", message);
		RequestDispatcher rd = request.getRequestDispatcher("BookOrder_list.jsp");
		rd.forward(request, response);

	}

	public void listOrders() throws ServletException, IOException {
		listOrders(null);
	}

	public void viewOrderDetailForAdmin() throws ServletException, IOException {

		int orderId = Integer.parseInt(request.getParameter("OrderId"));
		BookOrders order = orderDao.get(orderId);
		if (order == null) // if order has been deleted by some other admin
		{
			listOrders("Order: " + orderId + " has been removed");
		} else {
			request.setAttribute("order", order);

			String detailPage = "order_detail.jsp";
			RequestDispatcher dispatcher = request.getRequestDispatcher(detailPage);
			dispatcher.forward(request, response);
		}

	}

	public void showCheckOutForm() throws ServletException, IOException 
	{
		
		//Code to calculate shipping fee,tax,and Total amount
		HttpSession session = request.getSession();
		ShoppingCart shoppingCart = (ShoppingCart) session.getAttribute("cart");
		
		// tax is 10% of subtotal
		float tax = shoppingCart.getTotalAmount() * 0.1f;
		
		// shipping fee is 1.0 USD per copy
		float shippingFee = shoppingCart.getTotalQuantity() * 1.0f;
		
		//calculate total by adding shipping and tax to actual total amount
		float total = shoppingCart.getTotalAmount() + tax + shippingFee;
		
		session.setAttribute("tax", tax);
		session.setAttribute("shippingFee", shippingFee);
		session.setAttribute("total", total);
		
		CommonUtility.generateCountryList(request);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("Frontend/checkout.jsp");
		dispatcher.forward(request, response);
	}

	public void placeOrder() throws ServletException, IOException 
	{
		String paymentMethod = request.getParameter("paymentMethod");
		BookOrders order = readOrderInfo();
		
		if (paymentMethod.equals("paypal")) {
			PaymentServices paymentServices = new PaymentServices(request, response);
			request.getSession().setAttribute("order4Paypal", order);
			paymentServices.authorizePayment(order);
		} else {	// Cash on Delivery
			placeOrderCOD(order);
		}		
	}
	public Integer placeOrderPaypal(Payment payment) {
		BookOrders order = (BookOrders) request.getSession().getAttribute("order4Paypal");
		ItemList itemList = payment.getTransactions().get(0).getItemList();
		ShippingAddress shippingAddress = itemList.getShippingAddress();
		String shippingPhoneNumber = itemList.getShippingPhoneNumber();
		
		String recipientName = shippingAddress.getRecipientName();
		String[] names = recipientName.split(" ");
		
		order.setFirstname(names[0]);
		order.setLastname(names[1]);
		order.setAddressLine1(shippingAddress.getLine1());
		order.setAddressLine2(shippingAddress.getLine2());
		order.setCity(shippingAddress.getCity());
		order.setState(shippingAddress.getState());
		order.setCountry(shippingAddress.getCountryCode());
		order.setPhone(shippingPhoneNumber);
		
		return saveOrder(order);
		
	}
	private Integer saveOrder(BookOrders order) 
	{
		BookOrders savedOrder = orderDao.create(order);
		
		ShoppingCart shoppingCart = (ShoppingCart) request.getSession().getAttribute("cart");
		shoppingCart.clear();	
		
		return savedOrder.getOrderId();
		
	}
	private BookOrders readOrderInfo()
	{
		String firstname = request.getParameter("firstName");
		String lastname = request.getParameter("lastName");
		String phone = request.getParameter("phone");
		String address1 = request.getParameter("address1");
		String address2 = request.getParameter("address2");
		String city = request.getParameter("city");
		String state = request.getParameter("state");
		String zipcode = request.getParameter("zipcode");
		String country = request.getParameter("country");
		String paymentMethod=request.getParameter("paymentMethod");
		
		BookOrders order = new BookOrders();
		order.setFirstname(firstname);
		order.setLastname(lastname);
		order.setPhone(phone);
		order.setAddressLine1(address1);
		order.setAddressLine2(address2);
		order.setCity(city);
		order.setState(state);
		order.setCountry(country);
		order.setZipcode(zipcode);
		order.setPaymentMethod(paymentMethod);

		HttpSession session = request.getSession();
		Customers customer = (Customers) session.getAttribute("loggedCustomer");
		order.setCustomer(customer);
		
		ShoppingCart shoppingCart = (ShoppingCart) session.getAttribute("cart");
		Map<Books, Integer> items = shoppingCart.getItems();
		
		Iterator<Books> iterator = items.keySet().iterator();
		
		Set<OrderDetail> orderDetails = new HashSet<>();
		
		while (iterator.hasNext()) {
			Books book = iterator.next();
			Integer quantity = items.get(book);
			float subtotal = quantity * book.getBookPrice();
			
			OrderDetail orderDetail = new OrderDetail();
			orderDetail.setBook(book);
			orderDetail.setBookOrder(order);
			orderDetail.setQuantity(quantity);
			orderDetail.setSubtotal(subtotal);
			
			orderDetails.add(orderDetail);
		}
		
		order.setOrderDetails(orderDetails);
		
		float tax = (Float) session.getAttribute("tax");
		float shippingFee = (Float) session.getAttribute("shippingFee");
		float total = (Float) session.getAttribute("total");
		
		order.setSubtotal(shoppingCart.getTotalAmount());
		order.setTax(tax);
		order.setShippingFee(shippingFee);
		order.setTotal(total);		
		
		return order;
	}
	private void placeOrderCOD(BookOrders order) throws ServletException, IOException 
	{
		saveOrder(order);
		
		String message = "Thank you. Your order has been received."
				+ "We will deliver your books within a few days.";
		request.setAttribute("message", message);
		
		String messagePage = "frontend/message.jsp";
		RequestDispatcher dispatcher = request.getRequestDispatcher(messagePage);
		dispatcher.forward(request, response);		
	}

	

	
	public void listOrderByCustomer() throws ServletException, IOException {
		// get the "loggedCustomer" from session to view its orders
		HttpSession session = request.getSession();
		Customers customer = (Customers) session.getAttribute("loggedCustomer");
		// call to listByCustomer method odf orderDao
		List<BookOrders> listOrders = orderDao.listByCustomer(customer.getCustomerId());
		request.setAttribute("listOrders", listOrders);

		String historyPage = "Frontend/order_list.jsp";
		RequestDispatcher dispatcher = request.getRequestDispatcher(historyPage);
		dispatcher.forward(request, response);
	}

	public void showOrderDetailForCustomer() throws ServletException, IOException {
		int orderId = Integer.parseInt(request.getParameter("id"));

		// To fix a bug in order_detail page,we must use overloaded method of get
		HttpSession session = request.getSession();
		Customers customer = (Customers) session.getAttribute("loggedCustomer");

		BookOrders order = orderDao.get(orderId, customer.getCustomerId());
		request.setAttribute("order", order);

		String detailPage = "Frontend/order_detail.jsp";
		RequestDispatcher dispatcher = request.getRequestDispatcher(detailPage);
		dispatcher.forward(request, response);
	}

	public void deleteOrder() throws ServletException, IOException 
	{
		Integer orderId = Integer.parseInt(request.getParameter("orderId"));
		BookOrders order=orderDao.get(orderId);
		if(order==null)
			listOrders("Order not found. Might have been deletd by other admin(s)");
		else
		{
			orderDao.delete(orderId);
			String message = "The order ID " + orderId + " has been deleted.";
			listOrders(message);
		}
		
	}

}
