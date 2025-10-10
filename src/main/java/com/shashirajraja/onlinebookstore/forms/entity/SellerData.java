package com.shashirajraja.onlinebookstore.forms.entity;

import com.shashirajraja.onlinebookstore.entity.Seller;

public class SellerData {

	private String firstName;
	private String lastName;
	private String email;
	private long mobile;
	private String username;
	private String role;
	private String address;
	private String businessName;
	private String businessDescription;
	private String password;
	private String confirmPassword;
		
	public SellerData() {
	}

	public SellerData(Seller seller) {
		this.firstName = seller.getFirstName();
		this.lastName = seller.getLastName();
		this.email = seller.getEmail();
		this.mobile = seller.getMobile();
		this.username = seller.getUsername();
		this.password = seller.getUser().getPassword();
		this.confirmPassword = password;
		this.address = seller.getAddress();
		this.businessName = seller.getBusinessName();
		this.businessDescription = seller.getBusinessDescription();
		this.role = "ROLE_SELLER";
	}
	
	public SellerData(String firstName, String lastName, String email, long mobile, String username, String role,
			String address, String businessName, String businessDescription, String password, String confirmPassword) {
		this.firstName = firstName;
		this.lastName = lastName;
		this.email = email;
		this.mobile = mobile;
		this.username = username;
		this.role = role;
		this.address = address;
		this.businessName = businessName;
		this.businessDescription = businessDescription;
		this.password = password;
		this.confirmPassword = confirmPassword;
	}

	public SellerData(SellerData sellerData) {
		this.firstName = sellerData.firstName;
		this.lastName = sellerData.lastName;
		this.email = sellerData.email;
		this.mobile = sellerData.mobile;
		this.username = sellerData.username;
		this.role = sellerData.role;
		this.address = sellerData.address;
		this.businessName = sellerData.businessName;
		this.businessDescription = sellerData.businessDescription;
		this.password = sellerData.password;
		this.confirmPassword = sellerData.confirmPassword;
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

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
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

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getConfirmPassword() {
		return confirmPassword;
	}

	public void setConfirmPassword(String confirmPassword) {
		this.confirmPassword = confirmPassword;
	}

	@Override
	public String toString() {
		return "SellerData [firstName=" + firstName + ", lastName=" + lastName + ", email=" + email + ", mobile="
				+ mobile + ", username=" + username + ", role=" + role + ", address=" + address + 
				", businessName=" + businessName + ", businessDescription=" + businessDescription + 
				", password=" + password + ", confirmPassword=" + confirmPassword + "]";
	}
}
