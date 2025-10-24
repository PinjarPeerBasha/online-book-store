<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  
  <title>Secure Checkout - Online Book Store</title>

  <!-- Fonts -->
  <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800&display=swap" rel="stylesheet">
  
  <!-- Font Awesome -->
  <link href="${pageContext.request.contextPath}/vendor/fontawesome-free/css/all.min.css" rel="stylesheet">
  
  <!-- Bootstrap -->
  <link href="${pageContext.request.contextPath}/css/login-register.css" rel="stylesheet">
  
  <!-- Modern Design System -->
  <link href="${pageContext.request.contextPath}/css/modern-design-system.css" rel="stylesheet">
  
  <!-- Stripe.js -->
  <script src="https://js.stripe.com/v3/"></script>
</head>

<body style="font-family: 'Inter', sans-serif; background: linear-gradient(135deg, #667eea 0%, #764ba2 100%); min-height: 100vh;">

  <div class="container py-5">
    
    <!-- Header -->
    <div class="text-center mb-5">
      <a href="${pageContext.request.contextPath}/customers" class="text-white text-decoration-none">
        <h1 class="display-4 font-weight-bold text-white mb-2">
          <i class="fas fa-book-reader"></i> Online Book Store
        </h1>
      </a>
      <p class="text-white-50">Secure Checkout</p>
    </div>

    <div class="row justify-content-center">
      
      <!-- Order Summary -->
      <div class="col-lg-5 mb-4">
        <div class="card-modern">
          <div class="card-modern-header">
            <h5 class="mb-0 font-weight-bold">
              <i class="fas fa-shopping-bag text-primary"></i> Order Summary
            </h5>
          </div>
          <div class="card-modern-body">
            
            <!-- Cart Items -->
            <div class="order-items mb-4">
              <c:set var="subtotal" value="0" />
              <c:set var="totalQuantity" value="0" />
              <c:forEach var="item" items="${shoppingItems}">
                <div class="d-flex align-items-center mb-3 pb-3 border-bottom">
                  <div class="mr-3">
                    <c:choose>
                      <c:when test="${not empty item.book.imageUrl}">
                        <img src="${item.book.imageUrl}" alt="${item.book.name}" 
                             style="width: 60px; height: 80px; object-fit: cover; border-radius: var(--rounded-lg);">
                      </c:when>
                      <c:otherwise>
                        <div style="width: 60px; height: 80px; background: var(--gray-200); border-radius: var(--rounded-lg); display: flex; align-items: center; justify-content: center;">
                          <i class="fas fa-book text-muted"></i>
                        </div>
                      </c:otherwise>
                    </c:choose>
                  </div>
                  <div class="flex-grow-1">
                    <h6 class="mb-1 font-weight-semibold">${item.book.name}</h6>
                    <p class="text-muted small mb-0">Qty: ${item.quantity}</p>
                  </div>
                  <div class="text-right">
                    <p class="mb-0 font-weight-bold">₹${item.quantity * item.book.price}</p>
                  </div>
                </div>
                <c:set var="subtotal" value="${subtotal + (item.quantity * item.book.price)}" />
                <c:set var="totalQuantity" value="${totalQuantity + item.quantity}" />
              </c:forEach>
            </div>
            
            <!-- Pricing Breakdown -->
            <div class="pricing-breakdown">
              <div class="d-flex justify-content-between mb-2">
                <span class="text-muted">Subtotal</span>
                <span class="font-weight-semibold">₹${subtotal}</span>
              </div>
              <div class="d-flex justify-content-between mb-2">
                <span class="text-muted">Shipping</span>
                <span class="text-success font-weight-semibold">FREE</span>
              </div>
              <div class="d-flex justify-content-between mb-2">
                <span class="text-muted">Tax</span>
                <span class="font-weight-semibold">₹0.00</span>
              </div>
              <hr>
              <div class="d-flex justify-content-between">
                <span class="font-weight-bold" style="font-size: 1.25rem;">Total</span>
                <span class="font-weight-bold text-primary" style="font-size: 1.5rem;">₹${subtotal}</span>
              </div>
            </div>
            
            <!-- Security Badges -->
            <div class="mt-4 pt-4 border-top">
              <div class="d-flex align-items-center justify-content-center gap-3 flex-wrap">
                <span class="badge-modern badge-success-modern">
                  <i class="fas fa-lock"></i> Secure Payment
                </span>
                <span class="badge-modern badge-primary-modern">
                  <i class="fas fa-shield-alt"></i> SSL Encrypted
                </span>
              </div>
            </div>
            
          </div>
        </div>
      </div>
      
      <!-- Payment Form -->
      <div class="col-lg-7">
        <div class="card-modern">
          <div class="card-modern-header">
            <h5 class="mb-0 font-weight-bold">
              <i class="fas fa-credit-card text-primary"></i> Choose Payment Method
            </h5>
          </div>
          <div class="card-modern-body">
            
            <!-- Payment Method Selection -->
            <div class="row mb-4">
              <!-- Cash on Delivery -->
              <div class="col-md-6 mb-3">
                <div class="payment-option-card" id="codOption" onclick="selectPayment('cod')">
                  <div class="text-center p-4">
                    <i class="fas fa-money-bill-wave fa-3x text-success mb-3"></i>
                    <h5 class="font-weight-bold">Cash on Delivery</h5>
                    <p class="text-muted small mb-0">Pay when your order arrives</p>
                  </div>
                </div>
              </div>
              
              <!-- Online Payment (Stripe) -->
              <div class="col-md-6 mb-3">
                <div class="payment-option-card" id="stripeOption" onclick="selectPayment('stripe')">
                  <div class="text-center p-4">
                    <i class="fas fa-credit-card fa-3x text-primary mb-3"></i>
                    <h5 class="font-weight-bold">Online Payment</h5>
                    <p class="text-muted small mb-0">Pay with Credit/Debit Card</p>
                  </div>
                </div>
              </div>
            </div>
            
            <!-- COD Form -->
            <div id="codForm" style="display: none;">
              <div class="alert-modern alert-success-modern mb-4">
                <i class="fas fa-check-circle alert-modern-icon"></i>
                <div>
                  <h6 class="font-weight-bold mb-2">Cash on Delivery Selected</h6>
                  <ul class="mb-0 pl-3">
                    <li>No advance payment required</li>
                    <li>Pay cash when you receive your books</li>
                    <li>Please keep exact change ready</li>
                  </ul>
                </div>
              </div>
              
              <form action="${pageContext.request.contextPath}/customers/payment/success" method="POST">
                <input type="hidden" name="paymentMethod" value="cod">
                <input type="hidden" name="amount" value="${subtotal}">
                
                <div class="form-group">
                  <label class="font-weight-semibold">Delivery Address *</label>
                  <textarea name="deliveryAddress" class="input-modern" rows="3" 
                            placeholder="Complete delivery address with pincode" required></textarea>
                </div>
                
                <div class="form-group">
                  <label class="font-weight-semibold">Contact Number *</label>
                  <input type="tel" name="contactNumber" class="input-modern" 
                         placeholder="10-digit mobile number" pattern="[0-9]{10}" required>
                </div>
                
                <button type="submit" class="btn-modern btn-success-modern w-100 py-3 mt-3">
                  <i class="fas fa-check-circle"></i> Confirm Order (COD)
                </button>
              </form>
            </div>
            
            <!-- Stripe Form -->
            <div id="stripeForm" style="display: none;">
              <div class="alert-modern alert-info-modern mb-4">
                <i class="fas fa-info-circle alert-modern-icon"></i>
                <div>
                  <h6 class="font-weight-bold mb-2">Secure Card Payment</h6>
                  <p class="mb-0">Your payment is processed securely by Stripe. We never store your card details.</p>
                </div>
              </div>
              
              <form id="payment-form">
                
                <div class="form-group">
                  <label class="font-weight-semibold">Email Address *</label>
                  <input type="email" id="email" class="input-modern" 
                         placeholder="you@example.com" required>
                  <small class="text-muted">Receipt will be sent to this email</small>
                </div>
                
                <div class="form-group">
                  <label class="font-weight-semibold">Card Information *</label>
                  <div id="card-element" class="input-modern" style="padding: 16px;"></div>
                  <div id="card-errors" class="text-danger mt-2" role="alert"></div>
                </div>
                
                <div class="form-group">
                  <label class="font-weight-semibold">Cardholder Name *</label>
                  <input type="text" id="cardholderName" class="input-modern" 
                         placeholder="Full name on card" required>
                </div>
                
                <button type="submit" id="submit-button" class="btn-modern btn-primary-modern w-100 py-3 mt-3">
                  <span id="button-text">
                    <i class="fas fa-lock"></i> Pay ₹${subtotal} Securely
                  </span>
                  <span id="spinner" class="spinner-modern" style="display: none;"></span>
                </button>
                
                <div id="payment-message" class="mt-3" style="display: none;"></div>
                
              </form>
              
              <!-- Accepted Cards -->
              <div class="text-center mt-4">
                <p class="text-muted small mb-2">We accept</p>
                <div class="d-flex justify-content-center gap-2">
                  <i class="fab fa-cc-visa fa-2x text-primary"></i>
                  <i class="fab fa-cc-mastercard fa-2x text-warning"></i>
                  <i class="fab fa-cc-amex fa-2x text-info"></i>
                  <i class="fab fa-cc-discover fa-2x text-danger"></i>
                </div>
              </div>
            </div>
            
          </div>
          
          <!-- Security Footer -->
          <div class="card-modern-footer">
            <div class="d-flex align-items-center justify-content-center text-muted small">
              <i class="fas fa-shield-alt mr-2"></i>
              Your payment information is encrypted and secure
            </div>
          </div>
        </div>
        
        <!-- Back to Cart -->
        <div class="text-center mt-4">
          <a href="${pageContext.request.contextPath}/customers/cart" class="text-white">
            <i class="fas fa-arrow-left"></i> Back to Cart
          </a>
        </div>
      </div>
      
    </div>
  </div>

  <!-- Scripts -->
  <script src="${pageContext.request.contextPath}/vendor/jquery/jquery.min.js"></script>
  <script src="${pageContext.request.contextPath}/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="${pageContext.request.contextPath}/js/toast-notifications.js"></script>

  <style>
    .payment-option-card {
      border: 3px solid #e3e6f0;
      border-radius: 12px;
      cursor: pointer;
      transition: all 0.3s ease;
      background: white;
    }
    
    .payment-option-card:hover {
      border-color: #4e73df;
      transform: translateY(-5px);
      box-shadow: 0 10px 25px rgba(0,0,0,0.15);
    }
    
    .payment-option-card.selected {
      border-color: #1cc88a;
      background: #f0fdf4;
      box-shadow: 0 10px 25px rgba(28,200,138,0.2);
    }
  </style>

  <script>
    let selectedPaymentMethod = null;
    
    // Payment method selection
    function selectPayment(method) {
      selectedPaymentMethod = method;
      
      // Reset all options
      document.querySelectorAll('.payment-option-card').forEach(card => {
        card.classList.remove('selected');
      });
      
      // Hide all forms
      document.getElementById('codForm').style.display = 'none';
      document.getElementById('stripeForm').style.display = 'none';
      
      // Select current option
      if (method === 'cod') {
        document.getElementById('codOption').classList.add('selected');
        document.getElementById('codForm').style.display = 'block';
        Toast.info('Cash on Delivery selected');
      } else if (method === 'stripe') {
        document.getElementById('stripeOption').classList.add('selected');
        document.getElementById('stripeForm').style.display = 'block';
        Toast.info('Online Payment selected');
        
        // Initialize Stripe if not already done
        if (!window.stripeInitialized) {
          initializeStripe();
        }
      }
    }
    
    // Initialize Stripe
    let stripe, elements, cardElement;
    
    function initializeStripe() {
      stripe = Stripe('pk_test_51SLnW6RuctnWg8Qjt61olbx5F23Qd23z7BTiptv0NoLPKxC4H6SlOQf4gMdJJFJe1O5VzZVsjE0ZwzeYJH8a6dzi00RdhGKdf5');
      elements = stripe.elements();
      
      cardElement = elements.create('card', {
        style: {
          base: {
            fontSize: '16px',
            color: '#1f2937',
            fontFamily: 'Inter, sans-serif',
            '::placeholder': {
              color: '#9ca3af'
            }
          },
          invalid: {
            color: '#ef4444'
          }
        }
      });
      
      cardElement.mount('#card-element');
      
      // Handle card errors
      cardElement.on('change', function(event) {
        const displayError = document.getElementById('card-errors');
        if (event.error) {
          displayError.textContent = event.error.message;
        } else {
          displayError.textContent = '';
        }
      });
      
      window.stripeInitialized = true;
    }
    
    // Handle Stripe form submission
    document.getElementById('payment-form').addEventListener('submit', async function(event) {
      event.preventDefault();
      
      const submitButton = document.getElementById('submit-button');
      submitButton.disabled = true;
      document.getElementById('button-text').style.display = 'none';
      document.getElementById('spinner').style.display = 'inline-block';
      
      try {
        // For demo purposes, simulate payment success
        Toast.success('Payment processing...');
        
        setTimeout(function() {
          Toast.success('Payment successful!');
          setTimeout(function() {
            window.location.href = '${pageContext.request.contextPath}/customers/payment/success';
          }, 1500);
        }, 2000);
        
      } catch (error) {
        Toast.error('Payment failed: ' + error.message);
        submitButton.disabled = false;
        document.getElementById('button-text').style.display = 'inline';
        document.getElementById('spinner').style.display = 'none';
      }
    });
    
    // Show initial toast
    $(document).ready(function() {
      Toast.info('Please select a payment method');
    });
  </script>

</body>
</html>
