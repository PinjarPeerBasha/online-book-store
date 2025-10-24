package com.shashirajraja.onlinebookstore.config;

import com.stripe.Stripe;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Configuration;

import javax.annotation.PostConstruct;

/**
 * Stripe Payment Gateway Configuration
 * Initializes Stripe API with secret key
 */
@Configuration
public class StripeConfig {

    @Value("${stripe.api.secret-key}")
    private String secretKey;

    @PostConstruct
    public void init() {
        Stripe.apiKey = secretKey;
    }
}
