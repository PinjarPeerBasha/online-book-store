package com.shashirajraja.onlinebookstore.service;

import java.util.List;
import java.util.Optional;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.shashirajraja.onlinebookstore.dao.SellerRepository;
import com.shashirajraja.onlinebookstore.entity.Authority;
import com.shashirajraja.onlinebookstore.entity.CurrentSession;
import com.shashirajraja.onlinebookstore.entity.Seller;
import com.shashirajraja.onlinebookstore.forms.entity.ChangePassword;
import com.shashirajraja.onlinebookstore.forms.entity.SellerData;
import com.shashirajraja.onlinebookstore.forms.entity.ForgotPassword;
import com.shashirajraja.onlinebookstore.entity.User;

@Service
public class SellerServiceImpl implements SellerService {

	@Autowired
	CurrentSession currentSession;
	
	@Autowired
	SellerRepository theSellerRepository;
	
	@Autowired
	PasswordEncoder thePasswordEncoder;
	
	@Override
	@Transactional
	public List<Seller> getAllSellers() {
		return theSellerRepository.findAll();
	}

	@Override
	@Transactional
	public Seller getSeller(String username) {
		Optional<Seller> sellerOpt = theSellerRepository.findById(username);
		
		Seller theSeller = null;
		
		if(sellerOpt.isPresent())
			theSeller = sellerOpt.get();
		
		return theSeller;
	}

	@Override
	@Transactional
	public Seller findByUsername(String username) {
		return getSeller(username);
	}

	@Override
	@Transactional
	public String saveSeller(Seller theSeller) {
		theSellerRepository.save(theSeller);
		return "Data Saved Successfully!";
	}

	@Override
	public String updateSeller(Seller theSeller) {
		saveSeller(theSeller);
		return "Data Updated Successfully!";
	}

	@Override
	@Transactional
	public String removeSeller(Seller theSeller) {
		theSellerRepository.delete(theSeller);
		return "Seller Data Deleted Successfully!";
	}

	@Override
	@Transactional
	public String registerSeller(SellerData data) {
		String message = "Registration Successful, Login Now!";

		if(!data.getPassword().equals(data.getConfirmPassword())) 
			return "Password and Confirm-Password do not matches!";
		
		//encode the password
		data.setPassword(thePasswordEncoder.encode(data.getPassword()));
		data.setConfirmPassword(data.getPassword());
		
		long mobile = data.getMobile();
		String mobStr = mobile + "";
		if(mobStr.length() > 12 || mobStr.length() < 10)
			return "Invalid Mobile Number!";
		if(mobStr.length() == 11 && mobStr.charAt(0) == '0') {
			mobStr = mobStr.substring(1, mobStr.length());
			mobile = Long.parseLong(mobStr);
		}else if(mobStr.length()==12 && mobStr.charAt(0)=='9' && mobStr.charAt(1) == '1'){
			mobStr = mobStr.substring(2,mobStr.length());
			mobile = Long.parseLong(mobStr);
		}
		else if(mobStr.length() != 10 || mobStr.charAt(0)=='0') {
			return "Please Enter a valid Mobile Number!";
		}
		data.setMobile(mobile);
		
		//create user with username, password and authority
		User theUser = new User(data.getUsername(),data.getPassword());
		theUser.addAuthority(new Authority(theUser,data.getRole()));
		
		//create the seller and map it to the user
		Seller seller = new Seller(data.getUsername(),data.getFirstName(),data.getLastName(),data.getEmail(),
				data.getMobile(),data.getAddress(),data.getBusinessName(),data.getBusinessDescription());
		seller.setUser(theUser);		
		
		Optional<Seller> theSeller = theSellerRepository.findById(data.getUsername());
		if(theSeller.isPresent()) {
			return "Username is already Registered, try new !";
		}
		
		List<Seller> availSeller = theSellerRepository.findByEmail(data.getEmail());
		
		if(availSeller.isEmpty()) {
			theSellerRepository.save(seller);	
		}
		else {
			return "Email Id Already Registered!";
		}
		
		return message;
	}

	@Override
	@Transactional
	public SellerData getSellerData(String username) {
		Seller seller = getSeller(username);
		
		SellerData data = new SellerData(seller);
	
		return data;
	}

	@Override
	@Transactional
	public String updateSeller(SellerData data) {
		Optional<Seller> sellerOpt = theSellerRepository.findById(data.getUsername());
		Seller theSeller = new Seller();
		
		if(sellerOpt.isPresent())
			theSeller = sellerOpt.get();
		else
			return "Invalid Seller Data!";
		if(data.getPassword() == null) {
			return "Please Enter Password first!";
		}
		
		if(!thePasswordEncoder.matches(data.getPassword(), theSeller.getUser().getPassword())) 
			return "Invalid Password!";
		
		long mobile = data.getMobile();
		String mobStr = mobile + "";
		if(mobStr.length() > 12 || mobStr.length() < 10)
			return "Invalid Mobile Number!";
		if(mobStr.length() == 11 && mobStr.charAt(0) == '0') {
			mobStr = mobStr.substring(1, mobStr.length());
			mobile = Long.parseLong(mobStr);
		}else if(mobStr.length()==12 && mobStr.charAt(0)=='9' && mobStr.charAt(1) == '1'){
			mobStr = mobStr.substring(2,mobStr.length());
			mobile = Long.parseLong(mobStr);
		}
		else if(mobStr.length() != 10 || mobStr.charAt(0)=='0') {
			return "Please Enter a valid Mobile Number!";
		}
		data.setMobile(mobile);
		
		theSeller.setFirstName(data.getFirstName());
		theSeller.setLastName(data.getLastName());
		theSeller.setAddress(data.getAddress());
		theSeller.setEmail(data.getEmail());
		theSeller.setMobile(data.getMobile());
		theSeller.setUsername(data.getUsername());
		theSeller.setBusinessName(data.getBusinessName());
		theSeller.setBusinessDescription(data.getBusinessDescription());
		
		theSeller = theSellerRepository.save(theSeller);
		
		User theUser = theSeller.getUser();
		
		currentSession.setUser(theUser);
		
		return "Your profile data has been updated successfully!";
	}

	@Override
	@Transactional
	public String updatePassword(ChangePassword changePassword) {
		if(!changePassword.getNewPassword().equals(changePassword.getConfirmPassword()))
			return "new Password don't matches";
		String newPassword = changePassword.getNewPassword();
		if(newPassword.length() <= 4)
			return "Password Length must be greater than 4";
		
		Optional<Seller> theSeller = theSellerRepository.findById(changePassword.getUsername());
		Seller seller = null;
		if(theSeller.isPresent())
			seller = theSeller.get();
		if(!thePasswordEncoder.matches(changePassword.getOldPassword(), seller.getUser().getPassword()))
			return "Wrong Old Password!";
		
		newPassword = thePasswordEncoder.encode(newPassword);
		
		seller.getUser().setPassword(newPassword);
		
		theSellerRepository.save(seller);
		
		return "Password Updated Successfully!";
	}

	@Override
	@Transactional
	public String resetPassword(ForgotPassword forgotPassword) {
		if(!forgotPassword.getNewPassword().equals(forgotPassword.getConfirmPassword()))
			return "New passwords don't match";
		
		String newPassword = forgotPassword.getNewPassword();
		if(newPassword.length() <= 4)
			return "Password length must be greater than 4";
		
		// Find seller by email
		List<Seller> sellers = theSellerRepository.findByEmail(forgotPassword.getEmail().toLowerCase());
		Seller seller = null;
		if(!sellers.isEmpty())
			seller = sellers.get(0);
		else
			return "No account found with this email address!";
		
		// Encode the new password
		newPassword = thePasswordEncoder.encode(newPassword);
		
		// Update the password
		seller.getUser().setPassword(newPassword);
		
		theSellerRepository.save(seller);
		
		return "Password reset successfully! You can now login with your new password.";
	}
}
