<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
      <p class="text-white-50">Secure Checkout powered by Stripe</p>
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
              <c:forEach var="item" items="${cartItems}">
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
                <span class="font-weight-bold text-primary" style="font-size: 1.5rem;">₹${total}</span>
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
                <span class="badge-modern badge-success-modern">
                  <i class="fab fa-cc-stripe"></i> Stripe Verified
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
              <i class="fas fa-credit-card text-primary"></i> Payment Information
            </h5>
          </div>
          <div class="card-modern-body">
            
            <!-- Payment Method Tabs -->
            <div class="payment-methods mb-4">
              <div class="btn-group w-100" role="group">
                <button type="button" class="btn btn-outline-modern active" id="cardPaymentBtn">
                  <i class="fas fa-credit-card"></i> Card Payment
                </button>
                <button type="button" class="btn btn-outline-modern" id="codPaymentBtn">
                  <i class="fas fa-money-bill-wave"></i> Cash on Delivery
                </button>
              </div>
            </div>
            
            <!-- Card Payment Section -->
            <div id="cardPaymentSection">
              <form id="payment-form">
                
                <!-- Customer Email -->
                <div class="form-group">
                  <label class="font-weight-semibold">Email Address</label>
                  <input type="email" id="email" class="input-modern" 
                         placeholder="you@example.com" value="${customerEmail}" required>
                  <small class="text-muted">Receipt will be sent to this email</small>
                </div>
                
                <!-- Stripe Card Element -->
                <div class="form-group">
                  <label class="font-weight-semibold">Card Information</label>
                  <div id="card-element" class="input-modern" style="padding: var(--space-4);"></div>
                  <div id="card-errors" class="text-danger mt-2" role="alert"></div>
                </div>
                
                <!-- Cardholder Name -->
                <div class="form-group">
                  <label class="font-weight-semibold">Cardholder Name</label>
                  <input type="text" id="cardholderName" class="input-modern" 
                         placeholder="Full name on card" required>
                </div>
                
                <!-- Billing Address -->
                <div class="form-group">
                  <label class="font-weight-semibold">Billing Address</label>
                  <textarea id="billingAddress" class="input-modern" rows="2" 
                            placeholder="Street address, City, State, ZIP" required>${customerAddress}</textarea>
                </div>
                
                <!-- Submit Button -->
                <button type="submit" id="submit-button" class="btn-modern btn-primary-modern w-100 py-3 mt-4">
                  <span id="button-text">
                    <i class="fas fa-lock"></i> Pay ₹${total} Securely
                  </span>
                  <span id="spinner" class="spinner-modern" style="display: none;"></span>
                </button>
                
                <!-- Payment Processing Message -->
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
            
            <!-- COD Payment Section -->
            <div id="codPaymentSection" style="display: none;">
              <div class="alert-modern alert-info-modern">
                <i class="fas fa-info-circle alert-modern-icon"></i>
                <div>
                  <h6 class="font-weight-bold mb-2">Cash on Delivery</h6>
                  <p class="mb-2">Pay with cash when your order is delivered to your doorstep.</p>
                  <ul class="mb-0 pl-3">
                    <li>No advance payment required</li>
                    <li>Pay only when you receive the books</li>
                    <li>Exact change appreciated</li>
                  </ul>
                </div>
              </div>
              
              <form action="${pageContext.request.contextPath}/customers/cart/pay/cod" method="POST">
                <div class="form-group">
                  <label class="font-weight-semibold">Delivery Address</label>
                  <textarea name="deliveryAddress" class="input-modern" rows="3" 
                            placeholder="Complete delivery address" required>${customerAddress}</textarea>
                </div>
                
                <div class="form-group">
                  <label class="font-weight-semibold">Contact Number</label>
                  <input type="tel" name="contactNumber" class="input-modern" 
                         placeholder="10-digit mobile number" pattern="[0-9]{10}" required>
                </div>
                
                <button type="submit" class="btn-modern btn-success-modern w-100 py-3 mt-4">
                  <i class="fas fa-check-circle"></i> Place Order (COD)
                </button>
              </form>
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
  <script src="${pageContext.request.contextPath}/js/loading-spinner.js"></script>

  <script>
    // Initialize Stripe
    const stripe = Stripe('${stripePublicKey}');
    
    // Create card element
    const elements = stripe.elements();
    const cardElement = elements.create('card', {
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
    
    // Handle form submission
    const form = document.getElementById('payment-form');
    const submitButton = document.getElementById('submit-button');
    
    form.addEventListener('submit', async function(event) {
      event.preventDefault();
      
      // Disable submit button
      submitButton.disabled = true;
      document.getElementById('button-text').style.display = 'none';
      document.getElementById('spinner').style.display = 'inline-block';
      
      try {
        // Create payment intent on server
        const response = await fetch('${pageContext.request.contextPath}/api/payment/create-intent', {
          method: 'POST',
          headers: {
            'Content-Type': 'application/json'
          },
          body: JSON.stringify({
            amount: ${total * 100}, // Convert to cents
            currency: 'inr',
            email: document.getElementById('email').value
          })
        });
        
        const data = await response.json();
        
        if (data.error) {
          throw new Error(data.error);
        }
        
        // Confirm payment with Stripe
        const {error, paymentIntent} = await stripe.confirmCardPayment(data.clientSecret, {
          payment_method: {
            card: cardElement,
            billing_details: {
              name: document.getElementById('cardholderName').value,
              email: document.getElementById('email').value,
              address: {
                line1: document.getElementById('billingAddress').value
              }
            }
          }
        });
        
        if (error) {
          // Show error message
          const messageDiv = document.getElementById('payment-message');
          messageDiv.className = 'alert-modern alert-danger-modern';
          messageDiv.innerHTML = '<i class="fas fa-exclamation-circle alert-modern-icon"></i><div>' + error.message + '</div>';
          messageDiv.style.display = 'flex';
          
          // Re-enable submit button
          submitButton.disabled = false;
          document.getElementById('button-text').style.display = 'inline';
          document.getElementById('spinner').style.display = 'none';
        } else {
          // Payment successful
          Toast.success('Payment successful! Redirecting...');
          setTimeout(function() {
            window.location.href = '${pageContext.request.contextPath}/customers/payment/success?payment_intent=' + paymentIntent.id;
          }, 1500);
        }
        
      } catch (error) {
        const messageDiv = document.getElementById('payment-message');
        messageDiv.className = 'alert-modern alert-danger-modern';
        messageDiv.innerHTML = '<i class="fas fa-exclamation-circle alert-modern-icon"></i><div>' + error.message + '</div>';
        messageDiv.style.display = 'flex';
        
        // Re-enable submit button
        submitButton.disabled = false;
        document.getElementById('button-text').style.display = 'inline';
        document.getElementById('spinner').style.display = 'none';
      }
    });
    
    // Payment method toggle
    document.getElementById('cardPaymentBtn').addEventListener('click', function() {
      this.classList.add('active');
      document.getElementById('codPaymentBtn').classList.remove('active');
      document.getElementById('cardPaymentSection').style.display = 'block';
      document.getElementById('codPaymentSection').style.display = 'none';
    });
    
    document.getElementById('codPaymentBtn').addEventListener('click', function() {
      this.classList.add('active');
      document.getElementById('cardPaymentBtn').classList.remove('active');
      document.getElementById('cardPaymentSection').style.display = 'none';
      document.getElementById('codPaymentSection').style.display = 'block';
    });
  </script>

</body>
</html>
