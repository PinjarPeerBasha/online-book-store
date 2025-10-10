package com.shashirajraja.onlinebookstore.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="book_detail")
public class BookDetail {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="id")
	private int id;
	
	@Column(name="type", length = 100)
	private String type;
	
	@Column(name="detail", length = 2000)
	private String detail;
	
	@Column(name="sold")
	private int sold;
	
	@Column(name="author", length = 255)
	private String author;
	
	@Column(name="publisher", length = 255)
	private String publisher;
	
	@Column(name="isbn", length = 50)
	private String isbn;
	
	@Column(name="pages")
	private Integer pages;
	
	@Column(name="category", length = 100)
	private String category;
	
	@Column(name="description", length = 1000)
	private String description;
	
	@Column(name="dimensions", length = 100)
	private String dimensions;
	
	public BookDetail() {}

	public BookDetail(String type, String detail, int sold) {
		this.type = type;
		this.detail = detail;
		this.sold = sold;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getDetail() {
		return detail;
	}

	public void setDetail(String detail) {
		this.detail = detail;
	}

	public int getSold() {
		return sold;
	}

	public void setSold(int sold) {
		this.sold = sold;
	}

	public String getAuthor() {
		return author;
	}

	public void setAuthor(String author) {
		this.author = author;
	}

	public String getPublisher() {
		return publisher;
	}

	public void setPublisher(String publisher) {
		this.publisher = publisher;
	}

	public String getIsbn() {
		return isbn;
	}

	public void setIsbn(String isbn) {
		this.isbn = isbn;
	}

	public Integer getPages() {
		return pages;
	}

	public void setPages(Integer pages) {
		this.pages = pages;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getDimensions() {
		return dimensions;
	}

	public void setDimensions(String dimensions) {
		this.dimensions = dimensions;
	}

	@Override
	public String toString() {
		return "BookDetail [id=" + id + ", type=" + type + ", detail=" + detail + ", sold=" + sold + 
				", author=" + author + ", category=" + category + "]";
	}
	
}
