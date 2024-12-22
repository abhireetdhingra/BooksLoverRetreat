package com.bookstore.entity;

//Our category class still lacks some features from class created by instructor
import java.util.List;

import javax.persistence.*;

@Entity
@Table(name="category",catalog = "bookstoredb",uniqueConstraints=@UniqueConstraint(columnNames = "categoryName")) //i have added catalog because it was written by instructor
@NamedQueries({
	@NamedQuery(name="listAllCategories",query="Select c From Categories c Where c.categoryName is Not Null And c.categoryName <> ' ' Order By c.categoryName"),
	@NamedQuery(name="countCategories",query="Select Count(c) From Categories c"),
	@NamedQuery(name="findByName",query="Select c From Categories c Where c.categoryName=:name")

})
public class Categories implements java.io.Serializable
{

	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY) //for auto_increment
	@Column(nullable=false)
	private int categoryId;
	
	@Column(nullable=false)
	private String categoryName;
	
	@OneToMany(mappedBy = "category")
	private List<Books> listBooks;
	
	@OneToMany(mappedBy = "category")
	private List<SubCategory> listSubCategories;
	
	

	//getters and setters
	public int getCategoryId() {
		return categoryId;
	}

	public void setCategoryId(int category_id) {
		this.categoryId = category_id;
	}

	public List<SubCategory> getListSubCategories() {
		return listSubCategories;
	}

	public void setListSubCategories(List<SubCategory> listSubCategories) {
		this.listSubCategories = listSubCategories;
	}
	
	public String getCategoryName() {
		return categoryName;
	}

	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}
	
	
	//getters and setters of list<books> in category class
	public List<Books> getListBooks() {
		return listBooks;
	}

	public void setListBooks(List<Books> listBooks) {
		this.listBooks = listBooks;
	}

	//constructors
	public Categories() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Categories(int category_id, String categoryName) {
		super();
		this.categoryId = category_id;
		this.categoryName = categoryName;
	}

	public Categories(String categoryName) {
		super();
		this.categoryName = categoryName;
	}
	
	

}
