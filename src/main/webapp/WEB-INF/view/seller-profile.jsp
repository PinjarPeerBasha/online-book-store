<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>Seller Profile - Online Book Store</title>

  <!-- Bootstrap CSS -->
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
  
  <!-- Font Awesome -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">

  <!-- Custom styles -->
  <link type="text/css" href="${pageContext.request.contextPath}/css/login-register.css" rel="stylesheet">

  <style>
    .profile-section {
      background: white;
      padding: 30px;
      border-radius: 15px;
      box-shadow: 0 0 20px rgba(0,0,0,0.1);
      margin-bottom: 30px;
    }
    
    .profile-header {
      background: linear-gradient(135deg, #4facfe 0%, #00f2fe 100%);
      color: white;
      padding: 30px;
      border-radius: 15px;
      text-align: center;
      margin-bottom: 30px;
    }
    
    .info-row {
      border-bottom: 1px solid #e3e6f0;
      padding: 15px 0;
    }
    
    .info-label {
      font-weight: bold;
      color: #5a5c69;
    }
  </style>
</head>

<body class="bg-light">

  <div class="container mt-5">
    
    <!-- Header -->
    <div class="row mb-4">
      <div class="col-12">
        <div class="d-flex justify-content-between align-items-center">
          <h2><i class="fas fa-user text-primary"></i> Seller Profile</h2>
          <div>
            <a href="${pageContext.request.contextPath}/seller" class="btn btn-secondary">
              <i class="fas fa-dashboard"></i> Dashboard
            </a>
            <a href="${pageContext.request.contextPath}/logout" class="btn btn-outline-danger ml-2">
              <i class="fas fa-sign-out-alt"></i> Logout
            </a>
          </div>
        </div>
      </div>
    </div>

    <!-- Profile Header -->
    <div class="profile-header">
      <i class="fas fa-store fa-3x mb-3"></i>
      <h2>${seller.firstName} ${seller.lastName}</h2>
      <h4>${seller.businessName}</h4>
      <p class="mb-0">${seller.businessDescription}</p>
    </div>

    <!-- Profile Information -->
    <div class="row">
      <!-- Personal Information -->
      <div class="col-md-6">
        <div class="profile-section">
          <h4 class="mb-4">
            <i class="fas fa-user-circle text-primary"></i> Personal Information
          </h4>
          
          <div class="info-row">
            <div class="row">
              <div class="col-4 info-label">First Name:</div>
              <div class="col-8">${seller.firstName}</div>
            </div>
          </div>
          
          <div class="info-row">
            <div class="row">
              <div class="col-4 info-label">Last Name:</div>
              <div class="col-8">${seller.lastName}</div>
            </div>
          </div>
          
          <div class="info-row">
            <div class="row">
              <div class="col-4 info-label">Email:</div>
              <div class="col-8">${seller.email}</div>
            </div>
          </div>
          
          <div class="info-row">
            <div class="row">
              <div class="col-4 info-label">Mobile:</div>
              <div class="col-8">${seller.mobile}</div>
            </div>
          </div>
          
          <div class="info-row">
            <div class="row">
              <div class="col-4 info-label">Username:</div>
              <div class="col-8">${seller.username}</div>
            </div>
          </div>
          
          <div class="info-row">
            <div class="row">
              <div class="col-4 info-label">Address:</div>
              <div class="col-8">${seller.address}</div>
            </div>
          </div>
        </div>
      </div>

      <!-- Business Information -->
      <div class="col-md-6">
        <div class="profile-section">
          <h4 class="mb-4">
            <i class="fas fa-building text-success"></i> Business Information
          </h4>
          
          <div class="info-row">
            <div class="row">
              <div class="col-4 info-label">Business Name:</div>
              <div class="col-8">${seller.businessName}</div>
            </div>
          </div>
          
          <div class="info-row">
            <div class="row">
              <div class="col-4 info-label">Description:</div>
              <div class="col-8">${seller.businessDescription}</div>
            </div>
          </div>
          
          <div class="info-row">
            <div class="row">
              <div class="col-4 info-label">Total Books:</div>
              <div class="col-8">${seller.books.size()}</div>
            </div>
          </div>
          
          <div class="info-row">
            <div class="row">
              <div class="col-4 info-label">Account Type:</div>
              <div class="col-8">
                <span class="badge badge-warning">Seller</span>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>

    <!-- Action Buttons -->
    <div class="row">
      <div class="col-12">
        <div class="profile-section text-center">
          <h4 class="mb-4">
            <i class="fas fa-cog text-primary"></i> Account Management
          </h4>
          
          <div class="row">
            <div class="col-md-3">
              <a href="${pageContext.request.contextPath}/seller/books" class="btn btn-primary btn-block btn-lg">
                <i class="fas fa-book"></i><br>
                <small>Manage Books</small>
              </a>
            </div>
            <div class="col-md-3">
              <a href="${pageContext.request.contextPath}/seller/books/add" class="btn btn-success btn-block btn-lg">
                <i class="fas fa-plus"></i><br>
                <small>Add New Book</small>
              </a>
            </div>
            <div class="col-md-3">
              <a href="${pageContext.request.contextPath}/seller/profile/edit" class="btn btn-warning btn-block btn-lg">
                <i class="fas fa-edit"></i><br>
                <small>Edit Profile</small>
              </a>
            </div>
            <div class="col-md-3">
              <a href="${pageContext.request.contextPath}/seller/password" class="btn btn-info btn-block btn-lg">
                <i class="fas fa-key"></i><br>
                <small>Change Password</small>
              </a>
            </div>
          </div>
        </div>
      </div>
    </div>

  </div>

  <!-- Bootstrap and jQuery -->
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>

</body>
</html>
