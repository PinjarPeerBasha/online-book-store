package com.shashirajraja.onlinebookstore.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.shashirajraja.onlinebookstore.forms.entity.CustomerData;
import com.shashirajraja.onlinebookstore.forms.entity.SellerData;
import com.shashirajraja.onlinebookstore.forms.entity.UserRegistrationForm;
import com.shashirajraja.onlinebookstore.service.CustomerService;
import com.shashirajraja.onlinebookstore.service.SellerService;

@Controller
public class RegisterController {
	
	@Autowired
	private CustomerService theCustomerService;
	
	@Autowired
	private SellerService theSellerService;
	
	@GetMapping("/register")
	public String showRegisterForm(Model theModel) {
		theModel.addAttribute("userRegistrationForm", new UserRegistrationForm());
		return "register-unified";
	}
	
	@PostMapping("/register")
	public String processRegistration(@ModelAttribute UserRegistrationForm userRegistrationForm, Model theModel) {
		String message;
		
		try {
			if ("customer".equals(userRegistrationForm.getUserType())) {
				// Process customer registration
				CustomerData customerData = userRegistrationForm.toCustomerData();
				message = theCustomerService.registerCustomer(customerData);
			} else if ("seller".equals(userRegistrationForm.getUserType())) {
				// Process seller registration
				SellerData sellerData = userRegistrationForm.toSellerData();
				message = theSellerService.registerSeller(sellerData);
			} else {
				message = "Please select a valid account type!";
			}
		} catch (Exception e) {
			message = "Registration failed: " + e.getMessage();
		}
		
		theModel.addAttribute("message", message);
		theModel.addAttribute("userRegistrationForm", new UserRegistrationForm());
		return "register-unified";
	}
	
	// Legacy endpoints for backward compatibility
	@GetMapping("/register/customer")
	public String showCustomerRegisterForm(Model theModel) {
		theModel.addAttribute("customerData", new CustomerData());
		theModel.addAttribute("registrationType", "customer");
		return "register-customer";
	}
	
	@PostMapping("/register/customer")
	public String processCustomerRegistration(@ModelAttribute CustomerData theCustomerData, Model theModel) {
		theCustomerData.setRole("ROLE_CUSTOMER");
		String message = theCustomerService.registerCustomer(theCustomerData);
		
		theModel.addAttribute("message",message);
		theModel.addAttribute("registrationType", "customer");

		return "register-customer";
	}
	
	@GetMapping("/register/seller")
	public String showSellerRegisterForm(Model theModel) {
		theModel.addAttribute("sellerData", new SellerData());
		theModel.addAttribute("registrationType", "seller");
		return "register-seller";
	}
	
	@PostMapping("/register/seller")
	public String processSellerRegistration(@ModelAttribute SellerData theSellerData, Model theModel) {
		theSellerData.setRole("ROLE_SELLER");
		String message = theSellerService.registerSeller(theSellerData);
		
		theModel.addAttribute("message",message);
		theModel.addAttribute("registrationType", "seller");

		return "register-seller";
	}

}
