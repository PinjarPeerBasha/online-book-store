package com.shashirajraja.onlinebookstore.service;

import com.stripe.model.PaymentIntent;
import com.stripe.model.checkout.Session;

/**
 * Service interface for Stripe payment processing
 */
public interface StripePaymentService {
    
    /**
     * Create a Stripe Checkout Session
     * @param amount Amount in cents (e.g., 1000 = $10.00)
     * @param currency Currency code (e.g., "usd", "inr")
     * @param successUrl URL to redirect on success
     * @param cancelUrl URL to redirect on cancel
     * @param customerEmail Customer email
     * @param orderId Order ID for reference
     * @return Stripe Checkout Session
     */
    Session createCheckoutSession(Long amount, String currency, String successUrl, 
                                  String cancelUrl, String customerEmail, String orderId) throws Exception;
    
    /**
     * Create a Payment Intent
     * @param amount Amount in cents
     * @param currency Currency code
     * @param customerEmail Customer email
     * @param orderId Order ID for reference
     * @return PaymentIntent
     */
    PaymentIntent createPaymentIntent(Long amount, String currency, 
                                     String customerEmail, String orderId) throws Exception;
    
    /**
     * Retrieve a Payment Intent
     * @param paymentIntentId Payment Intent ID
     * @return PaymentIntent
     */
    PaymentIntent retrievePaymentIntent(String paymentIntentId) throws Exception;
    
    /**
     * Cancel a Payment Intent
     * @param paymentIntentId Payment Intent ID
     * @return Cancelled PaymentIntent
     */
    PaymentIntent cancelPaymentIntent(String paymentIntentId) throws Exception;
}
