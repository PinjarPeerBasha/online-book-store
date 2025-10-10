<!DOCTYPE html>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="en">

<head>

  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>Create Account - Online Book Store</title>

  <!-- Bootstrap Css link -->
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
    integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

  <!-- Font Awesome -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">

  <!-- Custom styles for this template-->
  <link type="text/css" href="${pageContext.request.contextPath}/css/login-register.css" rel="stylesheet">

  <style>
    .account-type-selector {
      margin-bottom: 30px;
    }
    
    .account-type-card {
      border: 2px solid #e3e6f0;
      border-radius: 10px;
      padding: 20px;
      text-align: center;
      cursor: pointer;
      transition: all 0.3s ease;
      margin-bottom: 15px;
    }
    
    .account-type-card:hover {
      border-color: #4e73df;
      box-shadow: 0 0 20px rgba(78, 115, 223, 0.2);
    }
    
    .account-type-card.selected {
      border-color: #4e73df;
      background-color: #f8f9fc;
      box-shadow: 0 0 20px rgba(78, 115, 223, 0.3);
    }
    
    .account-type-icon {
      font-size: 2.5rem;
      color: #4e73df;
      margin-bottom: 15px;
    }
    
    .account-type-title {
      font-weight: bold;
      color: #5a5c69;
      margin-bottom: 10px;
    }
    
    .account-type-description {
      font-size: 0.9rem;
      color: #858796;
    }
    
    .seller-fields {
      display: none;
    }
    
    .form-section {
      margin-bottom: 25px;
    }
    
    .form-section-title {
      color: #5a5c69;
      font-weight: bold;
      margin-bottom: 15px;
      border-bottom: 1px solid #e3e6f0;
      padding-bottom: 5px;
    }
  </style>

</head>

<body class="bg-gradient-primary">

  <div class="container">

    <div class="card o-hidden border-0 shadow-lg my-5">
      <div class="card-body p-0">
        <!-- Nested Row within Card Body -->
        <div class="row">
          <div class="col-lg-5 d-none d-lg-block bg-login-image"></div>
          <div class="col-lg-7">
            <div class="p-5">
              <div class="text-center">
                <c:choose>
                  <c:when test="${message != null }">
                    <c:choose>
                      <c:when test="${message.contains('successful') || message.contains('Login Now')}">
                        <h6 class="h4 text-success mb-4">${message}</h6>
                      </c:when>
                      <c:otherwise>
                        <h6 class="h4 text-danger mb-4">${message}</h6>
                      </c:otherwise>
                    </c:choose>
                  </c:when>
                  <c:otherwise>
                    <h1 class="h4 text-gray-900 mb-4">Create Your Account!</h1>
                    <p class="text-gray-600 mb-4">Choose your account type to get started</p>
                  </c:otherwise>
                </c:choose>
              </div>

              <!-- Account Type Selection -->
              <div class="account-type-selector">
                <div class="row">
                  <div class="col-md-6">
                    <div class="account-type-card" data-type="customer" id="customerCard">
                      <i class="fas fa-user account-type-icon"></i>
                      <div class="account-type-title">Customer</div>
                      <div class="account-type-description">
                        Browse and purchase books from various sellers
                      </div>
                    </div>
                  </div>
                  <div class="col-md-6">
                    <div class="account-type-card" data-type="seller" id="sellerCard">
                      <i class="fas fa-store account-type-icon"></i>
                      <div class="account-type-title">Become a Seller</div>
                      <div class="account-type-description">
                        Start your own bookstore and sell books online
                      </div>
                    </div>
                  </div>
                </div>
              </div>

              <form:form class="user" action="${pageContext.request.contextPath}/register" method="POST"
                modelAttribute="userRegistrationForm" id="registrationForm">
                
                <!-- Hidden field for user type -->
                <form:hidden path="userType" id="userTypeField" />

                <!-- Personal Information Section -->
                <div class="form-section">
                  <div class="form-section-title">
                    <i class="fas fa-user-circle"></i> Personal Information
                  </div>
                  
                  <div class="form-group row">
                    <div class="col-sm-6 mb-3 mb-sm-0">
                      <form:input type="text" class="form-control form-control-user" path="firstName"
                        placeholder="First Name" required="true" />
                    </div>
                    <div class="col-sm-6">
                      <form:input type="text" class="form-control form-control-user" path="lastName"
                        placeholder="Last Name" required="true" />
                    </div>
                  </div>

                  <div class="form-group row">
                    <div class="col-sm-6 mb-3 mb-sm-0">
                      <form:input type="email" class="form-control form-control-user" path="email"
                        placeholder="Email Address" required="true" />
                    </div>
                    <div class="col-sm-6">
                      <form:input type="tel" class="form-control form-control-user" path="mobile"
                        placeholder="Mobile Number" required="true" />
                    </div>
                  </div>
                  
                  <div class="form-group">
                    <form:textarea class="form-control form-control-user" path="address" rows="2"
                      placeholder="Complete Address" required="true" style="resize: none; border-radius: 10rem;"></form:textarea>
                  </div>
                </div>

                <!-- Business Information Section (Seller Only) -->
                <div class="form-section seller-fields" id="businessSection">
                  <div class="form-section-title">
                    <i class="fas fa-building"></i> Business Information
                  </div>
                  
                  <div class="form-group">
                    <form:input type="text" class="form-control form-control-user" path="businessName"
                      placeholder="Business/Store Name" />
                  </div>
                  
                  <div class="form-group">
                    <form:textarea class="form-control form-control-user" path="businessDescription" rows="3"
                      placeholder="Brief description of your business/store" style="resize: none; border-radius: 10rem;"></form:textarea>
                  </div>
                </div>

                <!-- Account Credentials Section -->
                <div class="form-section">
                  <div class="form-section-title">
                    <i class="fas fa-lock"></i> Account Credentials
                  </div>
                  
                  <div class="form-group">
                    <form:input type="text" class="form-control form-control-user" path="username"
                      placeholder="Choose a Username" required="true" />
                  </div>
                  
                  <div class="form-group row">
                    <div class="col-sm-6 mb-3 mb-sm-0">
                      <form:input type="password" class="form-control form-control-user" path="password"
                        placeholder="Create Password" required="true" />
                    </div>
                    <div class="col-sm-6 mb-3 mb-sm-0">
                      <form:input type="password" class="form-control form-control-user" path="confirmPassword"
                        placeholder="Confirm Password" required="true" />
                    </div>
                  </div>
                </div>

                <input type="submit" value="Create Account" class="btn btn-primary btn-user btn-block" id="submitBtn" disabled />
                
                <hr>
                
                <div class="text-center">
                  <a href="${pageContext.request.contextPath}/login" class="btn btn-google btn-user btn-block">
                    <i class="fas fa-sign-in-alt fa-fw"></i> Already have an account? Login Here
                  </a>
                </div>

              </form:form>
              <hr>

            </div>
          </div>
        </div>
      </div>
    </div>

  </div>

  <!-- Bootstrap core JavaScript-->
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
    integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
    crossorigin="anonymous"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
    integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
    crossorigin="anonymous"></script>

  <script>
    $(document).ready(function() {
      // Account type selection
      $('.account-type-card').click(function() {
        var accountType = $(this).data('type');
        
        // Remove selected class from all cards
        $('.account-type-card').removeClass('selected');
        
        // Add selected class to clicked card
        $(this).addClass('selected');
        
        // Set the user type in hidden field
        $('#userTypeField').val(accountType);
        
        // Show/hide seller-specific fields
        if (accountType === 'seller') {
          $('.seller-fields').slideDown();
          $('#businessName').attr('required', true);
          $('#businessDescription').attr('required', true);
        } else {
          $('.seller-fields').slideUp();
          $('#businessName').removeAttr('required');
          $('#businessDescription').removeAttr('required');
        }
        
        // Enable submit button
        $('#submitBtn').prop('disabled', false);
        
        // Update submit button text
        if (accountType === 'seller') {
          $('#submitBtn').val('Create Seller Account');
        } else {
          $('#submitBtn').val('Create Customer Account');
        }
      });

      // Form validation
      $('#registrationForm').submit(function(e) {
        var userType = $('#userTypeField').val();
        if (!userType) {
          e.preventDefault();
          alert('Please select an account type (Customer or Seller)');
          return false;
        }
        
        var password = $('input[name="password"]').val();
        var confirmPassword = $('input[name="confirmPassword"]').val();
        
        if (password !== confirmPassword) {
          e.preventDefault();
          alert('Passwords do not match!');
          return false;
        }
        
        if (password.length < 5) {
          e.preventDefault();
          alert('Password must be at least 5 characters long!');
          return false;
        }
      });
    });
  </script>

</body>

</html>
