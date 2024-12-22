package com.bookstore.entity;

import java.util.List;

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
import javax.persistence.OneToMany;

@Entity
@NamedQueries({
	@NamedQuery(name="listAllSubCategories",query="Select sc From SubCategory sc Where sc.subCategoryName is Not Null And sc.subCategoryName <> ' ' Order By sc.subCategoryName"),
	@NamedQuery(name="countSubCategories",query="Select Count(sc) From SubCategory sc"),
	@NamedQuery(name="findBySubCategoryName",query="Select sc From SubCategory sc Where sc.subCategoryName=:name"),
	@NamedQuery(name="findByCategoryId",query="Select sc From SubCategory sc Where sc.category.categoryId=:categoryId")
})
public class SubCategory implements java.io.Serializable 
{

	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY) //for auto_increment
	@Column(nullable=false)
	private int subCategoryId;
	
	@Column(nullable=false)
	private String subCategoryName;
	
	@OneToMany(mappedBy = "subCategory")
	private List<Books> listBooks;
	
	@ManyToOne(fetch=FetchType.EAGER)
	@JoinColumn(name="categoryid",nullable = false)	
	private Categories category;

	public SubCategory() {
		super();
		// TODO Auto-generated constructor stub
	}

	public SubCategory(int subCategoryId, String subCategoryName, List<Books> listBooks, Categories category) {
		super();
		this.subCategoryId = subCategoryId;
		this.subCategoryName = subCategoryName;
		this.listBooks = listBooks;
		this.category = category;
	}
	
	
	
	public SubCategory(String subCategoryName) {
		super();
		this.subCategoryName = subCategoryName;
	}

	public int getSubCategoryId() {
		return subCategoryId;
	}

	public void setSubCategoryId(int subCategoryId) {
		this.subCategoryId = subCategoryId;
	}

	public String getSubCategoryName() {
		return subCategoryName;
	}

	public void setSubCategoryName(String subCategoryName) {
		this.subCategoryName = subCategoryName;
	}

	public List<Books> getListBooks() {
		return listBooks;
	}

	public void setListBooks(List<Books> listBooks) {
		this.listBooks = listBooks;
	}

	public Categories getCategory() {
		return category;
	}

	public void setCategory(Categories category) {
		this.category = category;
	}

}
