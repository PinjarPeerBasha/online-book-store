package com.shashirajraja.onlinebookstore.service.impl;

import com.shashirajraja.onlinebookstore.service.StripePaymentService;
import com.stripe.exception.StripeException;
import com.stripe.model.PaymentIntent;
import com.stripe.model.checkout.Session;
import com.stripe.param.PaymentIntentCancelParams;
import com.stripe.param.PaymentIntentCreateParams;
import com.stripe.param.checkout.SessionCreateParams;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.Map;

/**
 * Implementation of StripePaymentService for payment processing
 */
@Service
public class StripePaymentServiceImpl implements StripePaymentService {

    @Value("${stripe.api.public-key}")
    private String publicKey;

    @Override
    public Session createCheckoutSession(Long amount, String currency, String successUrl, 
                                        String cancelUrl, String customerEmail, String orderId) throws Exception {
        try {
            SessionCreateParams params = SessionCreateParams.builder()
                    .setMode(SessionCreateParams.Mode.PAYMENT)
                    .setSuccessUrl(successUrl)
                    .setCancelUrl(cancelUrl)
                    .setCustomerEmail(customerEmail)
                    .addLineItem(
                            SessionCreateParams.LineItem.builder()
                                    .setPriceData(
                                            SessionCreateParams.LineItem.PriceData.builder()
                                                    .setCurrency(currency)
                                                    .setUnitAmount(amount)
                                                    .setProductData(
                                                            SessionCreateParams.LineItem.PriceData.ProductData.builder()
                                                                    .setName("Book Order #" + orderId)
                                                                    .setDescription("Online Book Store Purchase")
                                                                    .build()
                                                    )
                                                    .build()
                                    )
                                    .setQuantity(1L)
                                    .build()
                    )
                    .putMetadata("orderId", orderId)
                    .build();

            return Session.create(params);
            
        } catch (StripeException e) {
            throw new Exception("Failed to create Stripe checkout session: " + e.getMessage(), e);
        }
    }

    @Override
    public PaymentIntent createPaymentIntent(Long amount, String currency, 
                                            String customerEmail, String orderId) throws Exception {
        try {
            PaymentIntentCreateParams params = PaymentIntentCreateParams.builder()
                    .setAmount(amount)
                    .setCurrency(currency)
                    .setReceiptEmail(customerEmail)
                    .setDescription("Book Order #" + orderId)
                    .putMetadata("orderId", orderId)
                    .setAutomaticPaymentMethods(
                            PaymentIntentCreateParams.AutomaticPaymentMethods.builder()
                                    .setEnabled(true)
                                    .build()
                    )
                    .build();

            return PaymentIntent.create(params);
            
        } catch (StripeException e) {
            throw new Exception("Failed to create payment intent: " + e.getMessage(), e);
        }
    }

    @Override
    public PaymentIntent retrievePaymentIntent(String paymentIntentId) throws Exception {
        try {
            return PaymentIntent.retrieve(paymentIntentId);
        } catch (StripeException e) {
            throw new Exception("Failed to retrieve payment intent: " + e.getMessage(), e);
        }
    }

    @Override
    public PaymentIntent cancelPaymentIntent(String paymentIntentId) throws Exception {
        try {
            PaymentIntent paymentIntent = PaymentIntent.retrieve(paymentIntentId);
            
            PaymentIntentCancelParams params = PaymentIntentCancelParams.builder().build();
            
            return paymentIntent.cancel(params);
            
        } catch (StripeException e) {
            throw new Exception("Failed to cancel payment intent: " + e.getMessage(), e);
        }
    }
}
