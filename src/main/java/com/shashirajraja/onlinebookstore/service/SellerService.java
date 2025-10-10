package com.shashirajraja.onlinebookstore.service;

import java.util.List;

import com.shashirajraja.onlinebookstore.entity.Seller;
import com.shashirajraja.onlinebookstore.forms.entity.ChangePassword;
import com.shashirajraja.onlinebookstore.forms.entity.SellerData;
import com.shashirajraja.onlinebookstore.forms.entity.ForgotPassword;

public interface SellerService {

	public List<Seller> getAllSellers();
	
	public Seller getSeller(String username);
		
	public String saveSeller(Seller theSeller);
	
	public String updateSeller(Seller theSeller);
	
	public String removeSeller(Seller theSeller);
	
	public String registerSeller(SellerData data);

	public SellerData getSellerData(String username);

	public String updateSeller(SellerData sellerData);
	
	public String updatePassword(ChangePassword changePassword);
	
	public String resetPassword(ForgotPassword forgotPassword);
}
