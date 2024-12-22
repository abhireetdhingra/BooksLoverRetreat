package com.bookstore.entity;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.Transient;

@Entity
@Table(name = "review", catalog = "bookstoredb")
@NamedQueries({
	@NamedQuery(name="listAllReviews",query="Select r From Reviews r Order by r.reviewTime Desc"),
	@NamedQuery(name="countAllReviews",query="Select Count(r) From Reviews r"),
	@NamedQuery(name="countByCustomer",query="Select Count(r) From Reviews r where r.customer.customerId=:customerId"),
	@NamedQuery(name="findByCustomerAndBook",query="Select r From Reviews r Where r.customer.customerId=:customerId And "
			+ "r.book.bookId=:bookId"),
	@NamedQuery(name = "mostFavoredBooks",
	query = "SELECT r.book FROM Reviews r "
			+ "GROUP BY r.book.bookId HAVING AVG(r.rating) >= 4.0 "
			+ "ORDER BY r.book.bookId DESC, r.rating DESC") 
	
	
	
})
public class Reviews implements java.io.Serializable 
{
	
	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(unique = true, nullable = false)
	private int reviewId;
	
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "bookId", nullable = false)	//while joining column use database column name
	private Books book;
	
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "customerId", nullable = false) ////while joining column use database column name
	private Customers customer; 
	
	@Column( nullable = false)
	private int rating;
	
	@Column( nullable = true, length = 128)
	private String headline;
	
	@Column(nullable = true, length = 500)
	private String comment;
	
	@Temporal(TemporalType.TIMESTAMP)
	@Column( nullable = false, length = 19)
	private Date reviewTime;

	@Transient
	private String stars;
	
	public int getReviewId() {
		return reviewId;
	}

	public void setReviewId(int reviewId) {
		this.reviewId = reviewId;
	}

	public Books getBook() {
		return book;
	}

	public void setBook(Books book) {
		this.book = book;
	}

	public Customers getCustomer() {
		return customer;
	}

	public void setCustomer(Customers customer) {
		this.customer = customer;
	}

	public int getRating() {
		return rating;
	}

	public void setRating(int rating) {
		this.rating = rating;
	}

	public String getHeadline() {
		return headline;
	}

	public void setHeadline(String headline) {
		this.headline = headline;
	}

	public String getComment() {
		return comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}

	public Date getReviewTime() {
		return reviewTime;
	}

	public void setReviewTime(Date reviewTime) {
		this.reviewTime = reviewTime;
	}

	//Method to get rating stars for individual customers,This method is copied with some changes from book class
	public String getStars() {
		String result = "";
		
		int numberOfStarsOn = (int) rating;
		
		for (int i = 1; i <= numberOfStarsOn; i++) {
			result += "on,";
		}
		
		for (int j = numberOfStarsOn + 1; j <= 5; j++) {
			result += "off,";
		}
		
		return result.substring(0, result.length() - 1);
	}	
	
	
	//Constructors
	public Reviews(Books book, Customers customer, int rating, String headline, String comment, Date reviewTime) {
		super();
		this.book = book;
		this.customer = customer;
		this.rating = rating;
		this.headline = headline;
		this.comment = comment;
		this.reviewTime = reviewTime;
	}

	public Reviews() {
		super();
		// TODO Auto-generated constructor stub
	}
}
