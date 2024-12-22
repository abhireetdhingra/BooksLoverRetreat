package com.bookstore.service;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bookstore.dao.BookOrderDao;
import com.bookstore.dao.CustomerDao;
import com.bookstore.dao.ReviewDao;
import com.bookstore.entity.Customers;

public class CustomerServices {
	private HttpServletRequest request;
	private HttpServletResponse response;
	private CustomerDao customerDao;

	public CustomerServices(HttpServletRequest request, HttpServletResponse response) {

		this.request = request;
		this.response = response;

		customerDao = new CustomerDao();
	}

	public void listCustomer(String message) throws ServletException, IOException {
		List<Customers> list = customerDao.listAll();
		request.setAttribute("customerList", list);

		if (message != null)
			request.setAttribute("message", message);

		RequestDispatcher rd = request.getRequestDispatcher("Customer_list.jsp");
		rd.forward(request, response);

	}

	public void listCustomer() throws ServletException, IOException {
		listCustomer(null);

	}

	public void createCustomer() throws ServletException, IOException {
		String email = request.getParameter("email");
		// check if email provided while creating servlet is associated with some other
		// customer as well
		Customers customer = customerDao.findByEmail(email);
		if (customer != null) // Customer exits already in database
		{
			String message = "Customer already exits !!";
			request.setAttribute("message", message);
			RequestDispatcher rd = request.getRequestDispatcher("Customer_form.jsp");
			rd.forward(request, response);
		} else {
			// fetch all values
			customer = new Customers();
			readCustomerFields(customer);
			customer.setEmail(email);

			Customers customerCreated = customerDao.create(customer);
			if (customerCreated.getCustomerId() > 0) {
				listCustomer("Customer created successfully");
			}

			/*
			 * System.out.println("email: "+email);
			 * System.out.println("firstName: "+firstName);
			 * System.out.println("lastName: "+lastName);
			 * System.out.println("address: "+address);
			 * System.out.println("password: "+password);
			 * System.out.println("country: "+country); System.out.println("state: "+state);
			 * System.out.println("phoneNum: "+phoneNum);
			 * System.out.println("zipCode: "+zipCode); System.out.println("city: "+city);
			 */

		}
	}

	// similar method of create Customer

	public void registerCustomer() throws ServletException, IOException {

		String email = request.getParameter("email");
		Customers customer = customerDao.findByEmail(email);
		String message = null;
		if (customer != null) // Customer exits already in database
		{
			message = "Customer already exits with the provided email id !!";
			request.setAttribute("message", message);
			RequestDispatcher rd = request.getRequestDispatcher("Frontend/message.jsp");
			rd.forward(request, response);
		}

		else { // fetch all values
			customer = new Customers();
			readCustomerFields(customer);
			customer.setEmail(email);
			Customers customerCreated = customerDao.create(customer);
			if (customerCreated.getCustomerId() > 0) {
				message = "Customer created Successfully. Click to login";
				request.setAttribute("message", message);
				RequestDispatcher rd = request.getRequestDispatcher("Frontend/login.jsp");
				rd.forward(request, response);
			}

		}

	}

	public void getCustomer() throws ServletException, IOException {

		int custId = Integer.parseInt(request.getParameter("CustomerId"));
//		System.out.println("id: "+custId);
		Customers customer = customerDao.get(custId);
		if (customer == null) {
			String message = "Customer not found Might have been deleted ";
			request.setAttribute("message", message);
			RequestDispatcher rd = request.getRequestDispatcher("message.jsp");
			rd.forward(request, response);
		} else 
		{
			CommonUtility.generateCountryList(request);
			request.setAttribute("Customer", customer);
			RequestDispatcher rd = request.getRequestDispatcher("Customer_form.jsp");
			rd.forward(request, response);
		}

	}

	public void readCustomerFields(Customers customer) {
		String firstName = request.getParameter("firstName");
		String lastName = request.getParameter("lastName");
		String password = request.getParameter("password");
		String address = request.getParameter("address");
		String country = request.getParameter("country");
		String state = request.getParameter("state");
		String phoneNum = request.getParameter("phoneNum");
		String zipCode = request.getParameter("zipCode");
		String city = request.getParameter("city");

		customer.setFirstName(firstName);
		customer.setLastName(lastName);

		if (password != null && !password.equals("")) // this is done in reference to update customer details
			customer.setPassword(password);

		customer.setAddress(address);
		customer.setCustomerCountry(country);
		customer.setCustomerState(state);
		customer.setCustomerPhone(String.valueOf(phoneNum));
		customer.setZipCode(String.valueOf(zipCode));
		customer.setCustomerCity(city);

//		  System.out.println("firstName: "+firstName);
//		  System.out.println("lastName: "+lastName);
//		  System.out.println("address: "+address);
//		  System.out.println("password: "+password);
//		  System.out.println("country: "+country); 
//		  System.out.println("state: "+state);
//		  System.out.println("phoneNum: "+phoneNum);
//		  System.out.println("zipCode: "+zipCode);
//		  System.out.println("city: "+city);
	}

	public void updateCustomer() throws ServletException, IOException {

		int custId = Integer.parseInt(request.getParameter("customerId"));
		String email = request.getParameter("email");

		Customers customerByEmail = customerDao.findByEmail(email);
		Customers customerById = customerDao.get(custId);

		if (customerByEmail != null && customerById.getCustomerId() != customerByEmail.getCustomerId()) {
			String message = "Customer already exists";
			request.setAttribute("message", message);
			RequestDispatcher rd = request.getRequestDispatcher("message.jsp");
			rd.forward(request, response);
		} else {
			readCustomerFields(customerById);
			customerById.setEmail(email);
			customerDao.update(customerById);
			listCustomer("Customer was updated successfully");
		}
//		System.out.println("id: "+request.getParameter("customerId"));
//		System.out.println("email: "+email);

	}

	public void deleteCustomer() throws ServletException, IOException {

		int Id = Integer.parseInt(request.getParameter("custId"));
//		 System.out.println("id: "+Id);
		Customers customer = customerDao.get(Id);
		if (customer == null) {
			String message = "Customer not found Might have been deleted by some another admin ";
			request.setAttribute("message", message);
			RequestDispatcher rd = request.getRequestDispatcher("message.jsp");
			rd.forward(request, response);
		} else {
			/* Code to check if customer has any associated reviews with it or not */
			/* For this purpose we have coded a named query in review class */
			ReviewDao reviewDao = new ReviewDao();
			long reviewCount = reviewDao.countByCustomer(Id);

			// Code to check if customer is assciated with any order or not
			BookOrderDao orderDao = new BookOrderDao();
			long customerCount = orderDao.countBookOrderByCustomer(Id);

			if (reviewCount != 0)
				listCustomer("Could not delete customer ,because it has reviews associated with it");
			else if (customerCount > 0)
				listCustomer("Could not delete customer ,because it has orders associated with it");
			else {
				customerDao.delete(Id);
				listCustomer("Customer has been deleted successfully");
			}
		}
	}

	public void doLogin() throws ServletException, IOException {

		String email = request.getParameter("email");
		String password = request.getParameter("password");
//		System.out.println(email);
//		System.out.println(password);
		Customers customer = customerDao.checkLogin(email, password);
		if (customer == null) {

			String message = "Log In Failed.Please check your email and password";
			request.setAttribute("message", message);
			RequestDispatcher rd = request.getRequestDispatcher("Frontend/message.jsp");
			rd.forward(request, response);
		} else {
			HttpSession session = request.getSession();

			session.setAttribute("loggedCustomer", customer);

			Object objRedirectURL = session.getAttribute("redirectURL");

			if (objRedirectURL != null) {
				String redirectURL = (String) objRedirectURL;
				session.removeAttribute("redirectURL");
				response.sendRedirect(redirectURL);
			} else {
				showCustomerProfile();
			}
		}
	}

	public void showCustomerProfile() throws ServletException, IOException 
	{
		CommonUtility.generateCountryList(request);
		RequestDispatcher rd = request.getRequestDispatcher("Frontend/my_account.jsp");
		rd.forward(request, response);
	}

	public void updateCustomerProfile() throws ServletException, IOException {
		Customers customer = (Customers) request.getSession().getAttribute("loggedCustomer");
//		System.out.println("email of customer: "+customer.getEmail());
		// System.out.println("Customer: "+customer);
		
		readCustomerFields(customer);
		
		customerDao.update(customer);
		showCustomerProfile();
	}

	public void newCustomer() throws ServletException, IOException {
		// This method is made to pass country list as map parameter to show on customer
		// form
		CommonUtility.generateCountryList(request);
		String customerForm = "Customer_form.jsp";
		request.getRequestDispatcher(customerForm).forward(request, response);

	}
}
