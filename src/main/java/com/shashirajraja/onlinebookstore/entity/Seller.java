package com.shashirajraja.onlinebookstore.entity;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name="seller")
public class Seller {

	@Id
	@Column(name="id")
	private String username;
	
	@Column(name="first_name")
	private String firstName;
	
	@Column(name="last_name")
	private String lastName;
	
	@Column(name="email")
	private String email;
	
	@Column(name="mob")
	private long mobile;
	
	@Column(name="address")
	private String address;
	
	@Column(name="business_name")
	private String businessName;
	
	@Column(name="business_description")
	private String businessDescription;
	
	@Column(name="profile_photo")
	private String profilePhotoPath;

	@JoinColumn(name="id")
	@OneToOne(fetch = FetchType.EAGER, cascade = {CascadeType.DETACH, CascadeType.PERSIST,
												CascadeType.MERGE, CascadeType.REFRESH})
	private User user;
	
	@OneToMany(mappedBy = "seller", fetch = FetchType.LAZY, cascade = CascadeType.ALL)
	private Set<Book> books;
	
	public Seller() {
		this.books = new HashSet<Book>();
	}
	
	public Seller(String username, String firstName, String lastName, String email, long mobile, 
			String address, String businessName, String businessDescription) {
		this.username = username;
		this.firstName = firstName;
		this.lastName = lastName;
		this.email = email;
		this.mobile = mobile;
		this.address = address;
		this.businessName = businessName;
		this.businessDescription = businessDescription;
		this.profilePhotoPath = null;
		this.books = new HashSet<Book>();
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
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

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public long getMobile() {
		return mobile;
	}

	public void setMobile(long mobile) {
		this.mobile = mobile;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getBusinessName() {
		return businessName;
	}

	public void setBusinessName(String businessName) {
		this.businessName = businessName;
	}

	public String getBusinessDescription() {
		return businessDescription;
	}

	public void setBusinessDescription(String businessDescription) {
		this.businessDescription = businessDescription;
	}

	public String getProfilePhotoPath() {
		return profilePhotoPath;
	}

	public void setProfilePhotoPath(String profilePhotoPath) {
		this.profilePhotoPath = profilePhotoPath;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Set<Book> getBooks() {
		return books;
	}

	public void setBooks(Set<Book> books) {
		if(this.books == null) {
			this.books = new HashSet<Book>();
		} else {
			this.books.clear();
		}
		if(books != null)
			this.books.addAll(books);
	}
	
	public void addBook(Book book) {
		if(this.books == null)
			this.books = new HashSet<Book>();
		if(book != null) {
			this.books.add(book);
			book.setSeller(this);
		}
	}

	@Override
	public String toString() {
		return "Seller [username=" + username + ", firstName=" + firstName + ", lastName=" + lastName + 
				", email=" + email + ", mobile=" + mobile + ", address=" + address + 
				", businessName=" + businessName + ", businessDescription=" + businessDescription + "]";
	}
}
