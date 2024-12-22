package com.bookstore.entity;

import javax.persistence.*;

@Entity
@Table(name="users")		//for changing table name
@NamedQueries({
	@NamedQuery(name = "findAllUsers",query = "Select u From Users u Order By u.userId"),
	@NamedQuery(name = "findUserByEmail",query = "Select u From Users u Where u.email=:email"), //We will set parameter here
	@NamedQuery(name="CountAllUSers",query="Select Count(u) From Users u"),
	@NamedQuery(name = "checkLogin",query = "Select u From Users u Where u.email=:email AND u.password=:password")
	
})
public class Users {
	@Id							// to declare primary key of table
	@Column(name="user_id")		//to change name of column
	@GeneratedValue(strategy=GenerationType.IDENTITY) //for auto_increment
	private int userId;
	
	private String email;
	private String password;
	private String fullName;
	
	//getters and setters
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassword() {
		return password;
	}
	
	public void setPassword(String password) {
		this.password = password;
	}
	public String getFullName() {
		return fullName;
	}
	public void setFullName(String fullName) {
		this.fullName = fullName;
	}
	
	
	//constructors
	public Users(int userId, String email, String password, String fullName) {
		super();
		this.userId = userId;
		this.email = email;
		this.password = password;
		this.fullName = fullName;
	}
	public Users(String email, String password, String fullName) {
		super();
		this.email = email;
		this.password = password;
		this.fullName = fullName;
	}
	public Users() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
	
	
	
}

