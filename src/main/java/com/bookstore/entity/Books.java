package com.bookstore.entity;
import java.util.Base64;
import java.util.Comparator;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;
import java.util.TreeSet;

import javax.persistence.*;


@Entity
@Table(name="book",catalog = "bookstoredb",uniqueConstraints=@UniqueConstraint(columnNames = "bookTitle"))
@NamedQueries({
	@NamedQuery(name="listAllBooks",query="Select b From Books b Order By b.bookTitle"),
	@NamedQuery(name="findByTitle",query="Select b From Books b Where b.bookTitle=:title"),
	@NamedQuery(name="countAllBooks",query="Select Count(b) From Books b"),
	@NamedQuery(name="countByCategory",query="Select Count(b) From Books b Where b.category.categoryId =:catId"),
	
	@NamedQuery(name="countBySubCategory",query="Select Count(b) From Books b Where b.subCategory.subCategoryId =:subCatId"),
	
	@NamedQuery(name="listBooksByCategory",query="Select b From Books b Where b.category.categoryId=:catId"), //I have not used join while writing named query for listBooks by category. This query also works fine
	@NamedQuery(name="listNewBooks",query="Select b From Books b Order By  b.publishdate Desc"),
	@NamedQuery(name="searchByKeyword",query="Select b From Books b Where b.bookTitle Like '%' || :keyword || '%'"
		+ "or b.bookAuthor Like '%' || :keyword || '%' or b.bookIsbn Like '%' || :keyword || '%' or b.category.categoryName Like '%' || :keyword || '%' ")
	
})
public class Books implements java.io.Serializable 
{

	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY) //for auto_increment
	@Column(nullable=false,unique = true)		
	private Integer bookId;
	
	@Column(length=128 , nullable = false)	//we have not added unique constraint here because we have already added that on top of Table annotation
	private String bookTitle;
	
	@Column(name="author",length=64,nullable=false)
	private String bookAuthor;
	
	@Column(name="Description",nullable=false,length = 16777215)
	private String bookDescription;
	
	@Column(name="ISBN",nullable=false,length=15)
	private String bookIsbn;
	
	@Column(nullable=false)
	private byte[] image; //for storing images
	
	@Transient			//this will not linked to any fields in database
	private String Base64Image;
	
	@Column(name="price",nullable=false,precision=12,scale=0)
	private float bookPrice;
	
	@Temporal(TemporalType.DATE)
	@Column(nullable=false,length = 10)
	private Date publishdate;
	
	@Temporal(TemporalType.TIMESTAMP)
	@Column(length = 19,nullable=false)
	private Date lastUpdateDate;
	
	@ManyToOne(fetch=FetchType.EAGER) //this cascade is added so that removing category is not an issue in table
	@JoinColumn(name="categoryid",nullable = false)	
	private Categories category; //foreingn key
	
	@ManyToOne(fetch=FetchType.EAGER)
	@JoinColumn(name="subCategoryId",nullable = true)
	private SubCategory subCategory;
	
	@OneToMany(fetch = FetchType.EAGER,mappedBy = "book")
	private Set<Reviews> reviews = new HashSet<Reviews>(0);
	
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "book")
	private Set<OrderDetail> orderDetails = new HashSet<OrderDetail>(0);
	
	public int getBookId() {
		return bookId;
	}

	public void setBookId(Integer bookId) {
		this.bookId = bookId;
	}

	public String getBookTitle() {
		return bookTitle;
	}

	public void setBookTitle(String bookTitle) {
		this.bookTitle = bookTitle;
	}

	public String getBookAuthor() {
		return bookAuthor;
	}

	public void setBookAuthor(String bookAuthor) {
		this.bookAuthor = bookAuthor;
	}

	public String getBookDescription() {
		return bookDescription;
	}

	public void setBookDescription(String bookDescription) {
		this.bookDescription = bookDescription;
	}

	public String getBookIsbn() {
		return bookIsbn;
	}

	public void setBookIsbn(String bookIsbn) {
		this.bookIsbn = bookIsbn;
	}

	public byte[] getImage() {
		return image;
	}

	public void setImage(byte[] image) {
		this.image = image;
	}

	public float getBookPrice() {
		return bookPrice;
	}

	public void setBookPrice(float bookPrice) {
		this.bookPrice = bookPrice;
	}

	public Date getPublishdate() {
		return publishdate;
	}

	public void setPublishdate(Date publishdate) {
		this.publishdate = publishdate;
	}

	public Date getLastUpdateDate() {
		return lastUpdateDate;
	}

	public void setLastUpdateDate(Date lastUpdateDate) {
		this.lastUpdateDate = lastUpdateDate;
	}
	
	// I have set here my getters and setters of category in books class but i have not set any getters and setters for list<books> in category class
	
	public Categories getCategory() {
		return category;
	}

	public void setCategory(Categories category) {
		this.category = category;
	}
	
	
	public SubCategory getSubCategory() {
		return subCategory;
	}

	public void setSubCategory(SubCategory subCategory) {
		this.subCategory = subCategory;
	}

	//setting getters and setters for base 64 image, this is done to show image thumbnail on table
	public String getBase64Image()
	{
		this.Base64Image= Base64.getEncoder().encodeToString(this.image);
		return this.Base64Image;
	}
	public void setBase64Image(String Base64) {
		this.Base64Image=Base64;
	}

	//getters and setters for reviews

	public Set<Reviews> getReviews() {
		TreeSet<Reviews> sortedReviews = new TreeSet<>(new Comparator<Reviews>() {

			@Override
			public int compare(Reviews review1, Reviews review2) {
				return review2.getReviewTime().compareTo(review1.getReviewTime());
			}
			
		});
		sortedReviews.addAll(reviews);
		return sortedReviews;
	}

	public void setReviews(Set<Reviews> reviews) {
		this.reviews = reviews;
	}

	//Method to get average rating
	public float getAveragerating()
	{
		float averageRating=0.0f;
		float sum=0.0f;
		if(reviews.isEmpty()) 	//if book dosent contain any reviews associated with it
			return averageRating;
		//else
		for(Reviews review:reviews) //iterate through a for each loop
			sum+=review.getRating();
		
		averageRating=sum/reviews.size();
		
		return averageRating;
		
	}
	
	// Method of getting rating stars
	public String getRatingStars()
	{
		float averageRating=getAveragerating();
		return getRatingString(averageRating);
	}
	
	
	//method to convert rating to string
	public String getRatingString(float averageRating)
	{
		String result="";
		int noOfStarsOn=(int)averageRating; //if average rating is 3.0,then noOfStarsOn=3  //if average rating is 3.6,then noOfStarsOn=3
		
		for(int i=1;i<=noOfStarsOn;i++)
			result+="on,";
		
		//next stars would eithier be off or half
		int nextStar=noOfStarsOn+1;
		
		if(averageRating>noOfStarsOn)
		{
			result+="half,";
			nextStar++;
		}
		for(int j=nextStar;j<=5;j++)
			result+="off,";
		
		return result.substring(0,result.length()-1);
	}
	//constructor
		public Books(Integer bookId, String bookTitle, String bookAuthor, String bookDescription, String bookIsbn, byte[] image,
				float bookPrice, Date publishdate, Date lastUpdateDate, Categories category) {
			super();
			this.bookId = bookId;
			this.bookTitle = bookTitle;
			this.bookAuthor = bookAuthor;
			this.bookDescription = bookDescription;
			this.bookIsbn = bookIsbn;
			this.image=image;
			this.bookPrice = bookPrice;
			this.publishdate = publishdate;
			this.lastUpdateDate = lastUpdateDate;
			this.category = category;
		}


		public Books(String bookTitle, String bookAuthor, String bookDescription, String bookIsbn, byte[] image,
				float bookPrice, Date publishdate, Date lastUpdateDate, Categories category) {
			super();
			this.bookTitle = bookTitle;
			this.bookAuthor = bookAuthor;
			this.bookDescription = bookDescription;
			this.bookIsbn = bookIsbn;
			this.image = image;
			this.bookPrice = bookPrice;
			this.publishdate = publishdate;
			this.lastUpdateDate = lastUpdateDate;
			this.category = category;
		}

		public Books() {
			super();
			// TODO Auto-generated constructor stub
		}

		public Books(Integer bookId) {
			this.bookId = bookId;
		}

		@Override
		public int hashCode() {
			final int prime = 31;
			int result = 1;
			result = prime * result + ((bookId == null) ? 0 : bookId.hashCode());
			return result;
		}

		@Override
		public boolean equals(Object obj) {
			if (this == obj)
				return true;
			if (obj == null)
				return false;
			if (getClass() != obj.getClass())
				return false;
			Books other = (Books) obj;
			if (bookId == null) {
				if (other.bookId != null)
					return false;
			} else if (!bookId.equals(other.bookId))
				return false;
			return true;
		}

}
