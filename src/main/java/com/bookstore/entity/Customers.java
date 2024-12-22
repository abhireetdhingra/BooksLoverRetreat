package com.bookstore.entity;

import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.Transient;
import javax.persistence.UniqueConstraint;

@Entity
@Table(name="customer",catalog = "bookstoredb",uniqueConstraints=@UniqueConstraint(columnNames = "email"))
@NamedQueries({
	@NamedQuery(name="listAllCustomers",query="Select c From Customers c Order By c.registeredDate Desc"),
	@NamedQuery(name="countAllCustomers",query="Select Count(c) From Customers c"),
	@NamedQuery(name="findCustomerByEmail",query="Select c From Customers c Where c.email=:email"),
	@NamedQuery(name="checkCustomerLogin",query="Select c From Customers c Where c.email=:email And c.password=:pass")
	
	
})
public class Customers implements java.io.Serializable
{
	
	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(unique = true, nullable = false)
	private int customerId;
	
	@Column(unique = true, nullable = false, length = 64)
	private String email;
	
	
	@Column(name = "firstName", nullable = false, length = 30)
	private String firstName;
	
	@Column(name = "lastName", length = 30) //removed nullable property from lastName
	private String lastName;
	
	@Transient		//this will not linked to any fields in database
	private String customerFullName;
	
	@Column( nullable = true, length = 128)
	private String address;
	
	@Column(name = "city", nullable = true, length = 32)
	private String customerCity;
	
	@Column(name = "state", nullable = true, length = 45)
	private String customerState;
	
	@Column(name = "country", nullable = true, length = 4)  
	private String customerCountry;
	
	@Transient
	private String countryName;
	
	@Column(name = "phoneNumber", nullable = true, length = 15)
	private String customerPhone;
	
	@Column( nullable = false, length = 24)
	private String zipCode;
	
	@Column(name = "password", nullable = true, length = 16)
	private String password;
	
	@Temporal(TemporalType.TIMESTAMP)
	@Column(nullable = false, length = 19)
	private Date registeredDate;
	
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "customer")
	private List<Reviews> reviews;
	
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "customer")
	private List<BookOrders> bookOrders;
	
	

	//getters and setters
	public int getCustomerId() {
		return customerId;
	}

	public void setCustomerId(int customerId) {
		this.customerId = customerId;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getCustomerFullName() {
		
		if(this.lastName==null)
			return this.firstName;
		return this.firstName + " " + this.lastName;
	}

	/* This field was not provided by admin ,hence i commented it
	 * public void setCustomerFullName(String customerFullName) {
	 * this.customerFullName = customerFullName; }
	 */

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	
	public String getCustomerCity() {
		return customerCity;
	}

	public void setCustomerCity(String customerCity) {
		this.customerCity = customerCity;
	}

	public String getCustomerState() {
		return customerState;
	}

	public void setCustomerState(String customerState) {
		this.customerState = customerState;
	}

	public String getCustomerCountry() {
		return customerCountry;
	}

	public void setCustomerCountry(String customerCountry) {
		this.customerCountry = customerCountry;
	}

	public String getCountryName() {
		if(this.customerCountry==null)
			return null;
		else
			return new Locale("", this.customerCountry).getDisplayCountry();
	}

	/* This field was not provided by admin ,hence i commented it
	 * public void setCountryName(String countryName) { this.countryName =
	 * countryName; }
	 */

	public String getCustomerPhone() {
		return customerPhone;
	}

	public void setCustomerPhone(String customerPhone) {
		this.customerPhone = customerPhone;
	}

	public String getZipCode() {
		return zipCode;
	}

	public void setZipCode(String zipCode) {
		this.zipCode = zipCode;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public Date getRegisteredDate() {
		return registeredDate;
	}

	public void setRegisteredDate(Date registeredDate) {
		this.registeredDate = registeredDate;
	}

	
	public List<Reviews> getReviews() {
		return reviews;
	}

	public void setReviews(List<Reviews> reviews) {
		this.reviews = reviews;
	}

	public List<BookOrders> getBookOrders() {
		return bookOrders;
	}

	public void setBookOrders(List<BookOrders> bookOrders) {
		this.bookOrders = bookOrders;
	}
	
	public String getProfileName()
	{
		return this.firstName+this.customerId;
	}
	
	
	
	//constructors
	//according to video
	public Customers(String email, String firstName, String lastName, String address,
			String customerCity, String customerState, String customerCountry, String customerPhone, String zipCode,
			String password, Date registeredDate) {
		super();
		this.email = email;
		this.firstName = firstName;
		this.lastName = lastName;
		this.address = address;
		this.customerCity = customerCity;
		this.customerState = customerState;
		this.customerCountry = customerCountry;
		this.customerPhone = customerPhone;
		this.zipCode = zipCode;
		this.password = password;
		this.registeredDate = registeredDate;
	}
	
	public Customers() {
		super();
		// TODO Auto-generated constructor stub
	}




	
	
	
}
