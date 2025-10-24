package com.shashirajraja.onlinebookstore.service;

import java.util.Set;

import com.shashirajraja.onlinebookstore.entity.Customer;
import com.shashirajraja.onlinebookstore.entity.PurchaseDetail;
import com.shashirajraja.onlinebookstore.entity.PurchaseHistory;

public interface PaymentService {

	String createTransaction(Customer customer);
	
	String createTransaction(Customer customer, String paymentMethod);
	
	Set<PurchaseHistory> getPurchaseHistories(Customer customer);
	
	Set<PurchaseDetail> getPurchaseDetails(PurchaseHistory purchaseHistory);

	PurchaseHistory getPurchaseHistory(Customer customer, String transId);
}
