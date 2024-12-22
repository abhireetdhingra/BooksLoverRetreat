package com.bookstore.service;

import java.io.IOException;
import java.util.List;


import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bookstore.dao.UserDao;
import com.bookstore.entity.Users;

public class UserServices {
	private UserDao userdao;

	private HttpServletRequest request;
	private HttpServletResponse response;

	public UserServices(HttpServletRequest request, HttpServletResponse response)// default constructor
	{

		this.request = request;
		this.response = response;
		/* No need of this statements because we have used BaseServlet class */
		
		//factory = Persistence.createEntityManagerFactory("website"); // When an oject of UserServices would be made,all
																		// of these classes would get instantiated as
																		// well
		//entityManager = factory.createEntityManager();
		userdao = new UserDao();
	}

	public void listUsers(String message) throws ServletException, IOException {
		List<Users> usersList = userdao.listAll();
		request.setAttribute("listUsers", usersList);
		if (message != null)
			request.setAttribute("message", message);
		RequestDispatcher dispatch = request.getRequestDispatcher("Users_list.jsp");
		dispatch.forward(request, response);
	}

	// overide method
	public void listUsers() throws ServletException, IOException {
		listUsers(null);
	}

	public void createUsers() throws ServletException, IOException {
		System.out.println("Just below values to be fetched");

		String email = request.getParameter("email");
		String password = request.getParameter("fullname");
		String fullname = request.getParameter("password");

		System.out.println("Just after values to be fetched");
		// before creating a new user, check if user already exits or not
		Users user = userdao.findByEmail(email);

		System.out.println("After findByEmail method has been called successfully");
		if (user == null) {

			Users new_user = new Users(email, fullname, password); // instantiated our user with values fetched from
																	// user_form.jsp
			userdao.create(new_user); // calling create method of user dao to create our user
			listUsers("New User was created successfully in database");
		} else {
			String message = "Could not create user A same user with email: " + email + " already exits";
			request.setAttribute("message", message);
			RequestDispatcher rd = request.getRequestDispatcher("message.jsp");
			rd.forward(request, response);
		}
	}

	public void getUser() throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("UserId"));
		Users user = userdao.get(id);
		if(user==null) //that means user which we are trying to access ,is not present in database,because it has been deleted
		{
			String message = "Use not found ";
			request.setAttribute("message", message);
			RequestDispatcher rd = request.getRequestDispatcher("message.jsp");
			rd.forward(request, response);
		}
		else
		{
			request.setAttribute("User", user);
			RequestDispatcher rd = request.getRequestDispatcher("users_form.jsp");
			rd.forward(request, response);
		}
		
	}

	public void updateUser() throws IOException, ServletException
	{
		int id = Integer.parseInt(request.getParameter("userId"));
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		String fullname = request.getParameter("fullname");

		Users userByEmail = userdao.findByEmail(email);
		Users userById=userdao.get(id);
		
		if(userByEmail!=null&&userByEmail.getUserId()!=userById.getUserId()) //that is admin is trying to update an existing user with an email of another user
		{
			String message = "Could not create user A same user with email: " + email + " already exits";
			request.setAttribute("message", message);
			RequestDispatcher rd = request.getRequestDispatcher("message.jsp");
			rd.forward(request, response);
		}
		else
		{
			System.out.println("you are in else part");
			Users user=new Users();
			user.setUserId(id);
			user.setEmail(email);
			user.setFullName(fullname);
			user.setPassword(password);
			userdao.update(user);
			listUsers("User was updated successfully");
		}
	}
	public void deleteUser() throws ServletException, IOException
	{
		int id=Integer.parseInt(request.getParameter("userId"));
		if(id==1)
		{
			listUsers("can't delete user");
		}
		else
		{
			Users user=userdao.get(id);
			if(user==null)
			{
				String message = "Could not get user with id: "+id+"/n User might have been deleted by some other admin";
				request.setAttribute("message", message);
				RequestDispatcher rd = request.getRequestDispatcher("message.jsp");
				rd.forward(request, response);
			}
			else
			{
				userdao.delete(id);
				listUsers("User was deleted from database");
			}
		}
		
	}
	public void loginUser() throws IOException, ServletException
	{
		String email=request.getParameter("email");
		String password=request.getParameter("password");
		boolean check=userdao.checkLogin(email, password);
		if(check)
		{
			System.out.println("User authenticated");
			//create a session to store user email
			request.getSession().setAttribute("useremail",email);
			RequestDispatcher dispatch=request.getRequestDispatcher("/Admin/");
			dispatch.forward(request,response);
		}
		
		else
		{
			String message="login failed";
			request.setAttribute("message", message);
			RequestDispatcher dispatch=request.getRequestDispatcher("login.jsp");
			dispatch.forward(request,response);
		}
	}

	
	
	
	
	
	
	
	
}
