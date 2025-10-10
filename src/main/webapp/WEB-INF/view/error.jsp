<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>Error - Online Book Store</title>

  <!-- Bootstrap CSS -->
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
  
  <!-- Font Awesome -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">

  <!-- Custom styles -->
  <link type="text/css" href="${pageContext.request.contextPath}/css/login-register.css" rel="stylesheet">

  <style>
    .error-container {
      min-height: 100vh;
      display: flex;
      align-items: center;
      justify-content: center;
    }
    
    .error-card {
      background: white;
      padding: 50px;
      border-radius: 15px;
      box-shadow: 0 0 30px rgba(0,0,0,0.1);
      text-align: center;
      max-width: 600px;
    }
    
    .error-icon {
      font-size: 5rem;
      color: #dc3545;
      margin-bottom: 30px;
    }
  </style>
</head>

<body class="bg-light">

  <div class="error-container">
    <div class="error-card">
      <i class="fas fa-exclamation-triangle error-icon"></i>
      
      <h1 class="h2 text-danger mb-4">Oops! Something went wrong</h1>
      
      <c:choose>
        <c:when test="${not empty error}">
          <p class="text-muted mb-4">${error}</p>
        </c:when>
        <c:otherwise>
          <p class="text-muted mb-4">
            We encountered an unexpected error while processing your request. 
            Please try again or contact support if the problem persists.
          </p>
        </c:otherwise>
      </c:choose>
      
      <div class="mt-4">
        <a href="javascript:history.back()" class="btn btn-secondary btn-lg mr-3">
          <i class="fas fa-arrow-left"></i> Go Back
        </a>
        <a href="${pageContext.request.contextPath}/" class="btn btn-primary btn-lg">
          <i class="fas fa-home"></i> Home
        </a>
      </div>
      
      <hr class="mt-5">
      
      <div class="text-center">
        <small class="text-muted">
          If you continue to experience issues, please contact our support team.
        </small>
      </div>
    </div>
  </div>

  <!-- Bootstrap and jQuery -->
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>

</body>
</html>
