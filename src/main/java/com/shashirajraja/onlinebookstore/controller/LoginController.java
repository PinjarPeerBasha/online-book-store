package com.shashirajraja.onlinebookstore.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.shashirajraja.onlinebookstore.entity.CurrentSession;
import com.shashirajraja.onlinebookstore.entity.User;
import com.shashirajraja.onlinebookstore.forms.entity.ForgotPassword;
import com.shashirajraja.onlinebookstore.service.CustomerService;
import com.shashirajraja.onlinebookstore.service.SellerService;
import com.shashirajraja.onlinebookstore.service.UserService;

@Controller
public class LoginController {

	@Autowired
	UserService theUserService;
	
	@Autowired
	CurrentSession currentSession;
	
	@Autowired
	CustomerService theCustomerService;
	
	@Autowired
	SellerService theSellerService;
	
	@GetMapping("/login")
	public String showLoginForm(HttpSession session) {
		session.setAttribute("var", "My Variable");
		return "login-form";
	}
	
	@GetMapping({"/",""})
	public String showHome(Model theModel) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		
		if (auth != null && auth.isAuthenticated() && !auth.getName().equals("anonymousUser")) {
			// Set current session user
			User user = theUserService.getUserByUsername(auth.getName());
			if (user != null) {
				currentSession.setUser(user);
			}
			
			// Role-based redirect
			if (auth.getAuthorities().contains(new SimpleGrantedAuthority("ROLE_ADMIN"))) {
				return "redirect:/admin";
			} else if (auth.getAuthorities().contains(new SimpleGrantedAuthority("ROLE_SELLER"))) {
				return "redirect:/seller";
			} else if (auth.getAuthorities().contains(new SimpleGrantedAuthority("ROLE_CUSTOMER"))) {
				return "redirect:/books";
			}
		}
		
		return "login-form";
	}
	
	@GetMapping("/access-denied")
	public String accessDenied() {
		return "access-denied";
	}
	
	@GetMapping("/forgot-password")
	public String showForgotPasswordForm(Model theModel) {
		theModel.addAttribute("forgotPassword", new ForgotPassword());
		String message = null;
		theModel.addAttribute("message", message);
		return "forgot-password-form";
	}
	
	@PostMapping("/forgot-password/reset")
	public String processForgotPassword(@ModelAttribute("forgotPassword") ForgotPassword forgotPassword, Model theModel) {
		String message;
		
		// Try customer first
		message = theCustomerService.resetPassword(forgotPassword);
		
		// If customer reset failed, try seller
		if (message.contains("No account found")) {
			message = theSellerService.resetPassword(forgotPassword);
		}
		
		theModel.addAttribute("message", message);
		theModel.addAttribute("forgotPassword", new ForgotPassword());
		return "forgot-password-form";
	}
	
}