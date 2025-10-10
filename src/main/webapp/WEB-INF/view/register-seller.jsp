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

  <title>Seller Registration - Online Book Store</title>

  <!-- Bootstrap Css link -->
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
    integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

  <!-- Font Awesome -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">

  <!-- Custom styles for this template-->
  <link type="text/css" href="${pageContext.request.contextPath}/css/login-register.css" rel="stylesheet">

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
                    <h1 class="h4 text-gray-900 mb-4">
                      <i class="fas fa-store"></i> Become a Seller!
                    </h1>
                    <p class="text-gray-600 mb-4">Start your online bookstore business today</p>
                  </c:otherwise>
                </c:choose>
              </div>
              
              <form:form class="user" action="${pageContext.request.contextPath}/register/seller" method="POST"
                modelAttribute="sellerData">
                
                <!-- Personal Information -->
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
                    <form:input type="hidden" path="role" value="ROLE_SELLER" />
                  </div>
                </div>
                
                <div class="form-group">
                  <form:input type="text" class="form-control form-control-user" path="address"
                    placeholder="Complete Address" required="true" />
                </div>

                <!-- Business Information -->
                <hr>
                <h6 class="text-gray-900 mb-3">
                  <i class="fas fa-building"></i> Business Information
                </h6>
                
                <div class="form-group">
                  <form:input type="text" class="form-control form-control-user" path="businessName"
                    placeholder="Business/Store Name" required="true" />
                </div>
                
                <div class="form-group">
                  <form:textarea class="form-control form-control-user" path="businessDescription" rows="3"
                    placeholder="Brief description of your business and the types of books you plan to sell"
                    required="true" style="resize: none; border-radius: 10rem; padding: 1.5rem;"></form:textarea>
                </div>

                <!-- Account Credentials -->
                <hr>
                <h6 class="text-gray-900 mb-3">
                  <i class="fas fa-lock"></i> Account Credentials
                </h6>
                
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
                
                <input type="submit" value="Create Seller Account" class="btn btn-primary btn-user btn-block" />
                
                <hr>
                
                <div class="text-center">
                  <a href="${pageContext.request.contextPath}/register" class="btn btn-secondary btn-user btn-block">
                    <i class="fas fa-user fa-fw"></i> Register as Customer Instead
                  </a>
                </div>
                
                <div class="text-center mt-3">
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
  <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
    integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
    crossorigin="anonymous"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
    integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
    crossorigin="anonymous"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
    integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
    crossorigin="anonymous"></script>

  <script>
    // Password validation
    $('form').submit(function(e) {
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
  </script>

</body>

</html>
