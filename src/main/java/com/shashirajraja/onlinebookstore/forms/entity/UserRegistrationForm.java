package com.shashirajraja.onlinebookstore.forms.entity;

public class UserRegistrationForm {
    
    private String firstName;
    private String lastName;
    private String email;
    private long mobile;
    private String username;
    private String address;
    private String password;
    private String confirmPassword;
    private String userType; // "customer" or "seller"
    
    // Seller-specific fields
    private String businessName;
    private String businessDescription;
    
    public UserRegistrationForm() {
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

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
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

    public String getUserType() {
        return userType;
    }

    public void setUserType(String userType) {
        this.userType = userType;
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
    
    // Helper methods to convert to specific data types
    public CustomerData toCustomerData() {
        CustomerData customerData = new CustomerData();
        customerData.setFirstName(this.firstName);
        customerData.setLastName(this.lastName);
        customerData.setEmail(this.email);
        customerData.setMobile(this.mobile);
        customerData.setUsername(this.username);
        customerData.setAddress(this.address);
        customerData.setPassword(this.password);
        customerData.setConfirmPassword(this.confirmPassword);
        customerData.setRole("ROLE_CUSTOMER");
        return customerData;
    }
    
    public SellerData toSellerData() {
        SellerData sellerData = new SellerData();
        sellerData.setFirstName(this.firstName);
        sellerData.setLastName(this.lastName);
        sellerData.setEmail(this.email);
        sellerData.setMobile(this.mobile);
        sellerData.setUsername(this.username);
        sellerData.setAddress(this.address);
        sellerData.setPassword(this.password);
        sellerData.setConfirmPassword(this.confirmPassword);
        sellerData.setBusinessName(this.businessName);
        sellerData.setBusinessDescription(this.businessDescription);
        sellerData.setRole("ROLE_SELLER");
        return sellerData;
    }

    @Override
    public String toString() {
        return "UserRegistrationForm [firstName=" + firstName + ", lastName=" + lastName + ", email=" + email + 
               ", mobile=" + mobile + ", username=" + username + ", address=" + address + 
               ", userType=" + userType + ", businessName=" + businessName + 
               ", businessDescription=" + businessDescription + "]";
    }
}
