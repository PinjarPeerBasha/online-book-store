package com.shashirajraja.onlinebookstore.controller;

import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.shashirajraja.onlinebookstore.entity.CurrentSession;
import com.shashirajraja.onlinebookstore.entity.Customer;
import com.shashirajraja.onlinebookstore.entity.PurchaseDetail;
import com.shashirajraja.onlinebookstore.entity.PurchaseHistory;
import com.shashirajraja.onlinebookstore.entity.ShoppingCart;
import com.shashirajraja.onlinebookstore.service.PaymentService;

@Controller
public class PaymentController {

	@Autowired
	private PaymentService paymentService;
	
	@Autowired
	private CurrentSession currentSession;
	
	// Helper method to add cart data to model
	private void addCartDataToModel(Model theModel) {
		Customer customer = currentSession.getUser().getCustomer();
		Set<ShoppingCart> shoppingItems = customer.getShoppingCart();
		theModel.addAttribute("shoppingItems", shoppingItems);
	}
	
	@GetMapping("customers/cart/pay")
	public String showPaymentForm(Model theModel) {
		addCartDataToModel(theModel);
		return "customer-payment-modern";
	}
	
	@GetMapping("customers/payment/success")
	public String paymentSuccessGet(Model theModel) {
		Customer customer = currentSession.getUser().getCustomer();
		Set<PurchaseHistory> purchaseHistories = paymentService.getPurchaseHistories(customer);
		theModel.addAttribute("purchaseHistories", purchaseHistories);
		addCartDataToModel(theModel);
		return "customer-payment-success";
	}
	
	@PostMapping("customers/payment/success")
	public String paymentSuccess(@Param("upi") String upi, @Param("otp") String otp, @Param("paymentMethod") String paymentMethod, Model theModel) {
		Customer customer = currentSession.getUser().getCustomer();
		//load the purchase history
		paymentService.getPurchaseHistories(customer);
		//create purchase History with payment method
		String transId = paymentService.createTransaction(customer, paymentMethod);
		
		String paymentMethodText = "";
		if ("cod".equals(paymentMethod)) {
			paymentMethodText = "Cash on Delivery";
		} else if ("upi".equals(paymentMethod)) {
			paymentMethodText = "UPI Payment";
		} else if ("stripe".equals(paymentMethod)) {
			paymentMethodText = "Card Payment";
		} else {
			paymentMethodText = "Online Payment";
		}
		
		theModel.addAttribute("message", "Payment Successful (" + paymentMethodText + ") with transaction Id: "+ transId);
		theModel.addAttribute("purchaseHistory", paymentService.getPurchaseHistory(customer, transId));
		addCartDataToModel(theModel);
		return "customer-transaction-detail";
	}
	
	@GetMapping("customers/transactions")
	public String showTransactions(Model theModel) {
		Customer customer = currentSession.getUser().getCustomer();
		//load the purchaseHistories
		Set<PurchaseHistory> purchaseHistories = paymentService.getPurchaseHistories(customer);
		theModel.addAttribute("purchaseHistories", purchaseHistories);
		theModel.addAttribute("purchaseHistory", new PurchaseHistory());
		addCartDataToModel(theModel);
		return "customer-transactions";
	}
	
	@PostMapping("customers/transactions/detail")
	public String getTransactionDetail(@ModelAttribute("transId") String transId, Model theModel) {
		theModel.addAttribute("message", "Details for Transaction Id: "+ transId);
		Customer customer = currentSession.getUser().getCustomer();
		theModel.addAttribute("purchaseHistory", paymentService.getPurchaseHistory(customer, transId));
		addCartDataToModel(theModel);
		return "customer-transaction-detail";
	}
}
