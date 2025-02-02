package com.bookstore.entity;
// Generated May 22, 2018 5:46:15 AM by Hibernate Tools 5.2.10.Final

import javax.persistence.AttributeOverride;
import javax.persistence.AttributeOverrides;
import javax.persistence.Column;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;


@Entity
@Table(name = "order_detail", catalog = "bookstoredb")
@NamedQueries({
	@NamedQuery(name = "countByBook", query = "Select Count(od) From OrderDetail od Where od.book.bookId=:bookId"),
	@NamedQuery(name = "bestSellingBooks", 
	query = "SELECT od.book FROM OrderDetail od GROUP by od.book.bookId "
			+ "ORDER BY SUM(od.quantity) DESC")
})

public class OrderDetail implements java.io.Serializable {

	
	private static final long serialVersionUID = 1L;
	
	
	private OrderDetailId id = new OrderDetailId();
	private Books book;
	private BookOrders bookOrder;
	private int quantity;
	private float subtotal;	

	public OrderDetail() {
	}

	public OrderDetail(OrderDetailId id) {
		this.id = id;
	}

	public OrderDetail(OrderDetailId id, Books book, BookOrders bookOrder, int quantity, float subtotal) {
		this.id = id;
		this.book = book;
		this.bookOrder = bookOrder;
		this.quantity = quantity;
		this.subtotal = subtotal;
	}

	@EmbeddedId
	@AttributeOverrides({ @AttributeOverride(name = "orderId", column = @Column(name = "order_id", nullable = false)),
		@AttributeOverride(name = "bookId", column = @Column(name = "book_id", nullable = false))})
	public OrderDetailId getId() {
		return this.id;
	}

	public void setId(OrderDetailId id) {
		this.id = id;
	}

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "book_id", insertable = false, updatable = false, nullable = false)
	public Books getBook() {
		return this.book;
	}

	public void setBook(Books book) {
		this.book = book;
		this.id.setBook(book);
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "order_id", insertable = false, updatable = false, nullable = false)
	public BookOrders getBookOrder() {
		return this.bookOrder;
	}

	public void setBookOrder(BookOrders bookOrder) {
		this.bookOrder = bookOrder;
		this.id.setBookOrder(bookOrder);
	}
	
	@Column(name = "quantity", nullable = false)
	public int getQuantity() {
		return this.quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	@Column(name = "subtotal", nullable = false, precision = 12, scale = 0)
	public float getSubtotal() {
		return this.subtotal;
	}

	public void setSubtotal(float subtotal) {
		this.subtotal = subtotal;
	}	

}
