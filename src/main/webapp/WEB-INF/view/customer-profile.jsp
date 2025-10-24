<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Customer Profile - Online Book Store</title>

<!-- Bootstrap CSS -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" 
    integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">

<style>
    body {
        background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
        min-height: 100vh;
        padding-top: 20px;
    }
    
    .profile-container {
        background: rgba(255, 255, 255, 0.95);
        border-radius: 15px;
        box-shadow: 0 15px 35px rgba(0, 0, 0, 0.1);
        padding: 30px;
        margin: 20px auto;
        max-width: 800px;
    }
    
    .profile-header {
        text-align: center;
        margin-bottom: 30px;
        padding-bottom: 20px;
        border-bottom: 2px solid #f8f9fa;
    }
    
    .profile-photo {
        width: 120px;
        height: 120px;
        border-radius: 50%;
        object-fit: cover;
        border: 4px solid #667eea;
        margin-bottom: 20px;
    }
    
    .profile-photo-placeholder {
        width: 120px;
        height: 120px;
        border-radius: 50%;
        background: linear-gradient(135deg, #667eea, #764ba2);
        display: flex;
        align-items: center;
        justify-content: center;
        color: white;
        font-size: 48px;
        margin: 0 auto 20px;
        border: 4px solid #fff;
        box-shadow: 0 4px 12px rgba(0, 0, 0, 0.15);
    }
    
    .form-group label {
        font-weight: 600;
        color: #495057;
    }
    
    .form-control {
        border-radius: 8px;
        border: 1px solid #dee2e6;
        padding: 12px 15px;
    }
    
    .form-control:focus {
        border-color: #667eea;
        box-shadow: 0 0 0 0.2rem rgba(102, 126, 234, 0.25);
    }
    
    .btn-primary {
        background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
        border: none;
        border-radius: 8px;
        padding: 12px 30px;
        font-weight: 600;
        transition: all 0.3s ease;
    }
    
    .btn-primary:hover {
        transform: translateY(-2px);
        box-shadow: 0 5px 15px rgba(102, 126, 234, 0.4);
    }
    
    .btn-secondary {
        border-radius: 8px;
        padding: 12px 30px;
        font-weight: 600;
    }
    
    .alert {
        border-radius: 8px;
        border: none;
    }
    
    .custom-file-label::after {
        background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
        border: none;
        color: white;
    }
    
    .custom-file-input:focus ~ .custom-file-label {
        border-color: #667eea;
        box-shadow: 0 0 0 0.2rem rgba(102, 126, 234, 0.25);
    }
</style>
</head>

<body>
    <div class="container">
        <div class="profile-container">
            <div class="profile-header">
                <h2 class="text-primary">
                    <i class="fas fa-user-circle"></i> Customer Profile
                </h2>
                
                <!-- Display Profile Photo -->
                <div class="text-center">
                    <c:choose>
                        <c:when test="${not empty customer.profilePhotoPath}">
                            <img src="${pageContext.request.contextPath}/files/profile-photo/${customer.profilePhotoPath}" 
                                 alt="Profile Photo" class="profile-photo">
                        </c:when>
                        <c:otherwise>
                            <div class="profile-photo-placeholder">
                                <i class="fas fa-user"></i>
                            </div>
                        </c:otherwise>
                    </c:choose>
                </div>
                
                <h4 class="text-muted">${customer.firstName} ${customer.lastName}</h4>
                <p class="text-muted">@${customer.username}</p>
            </div>
            
            <!-- Success/Error Messages -->
            <c:if test="${not empty success}">
                <div class="alert alert-success alert-dismissible fade show" role="alert">
                    <i class="fas fa-check-circle"></i> ${success}
                    <button type="button" class="close" data-dismiss="alert">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
            </c:if>
            
            <c:if test="${not empty error}">
                <div class="alert alert-danger alert-dismissible fade show" role="alert">
                    <i class="fas fa-exclamation-circle"></i> ${error}
                    <button type="button" class="close" data-dismiss="alert">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
            </c:if>
            
            <!-- Profile Update Form -->
            <form action="${pageContext.request.contextPath}/profile/customer/update" 
                  method="post" enctype="multipart/form-data">
                
                <div class="row">
                    <div class="col-md-6">
                        <div class="form-group">
                            <label for="firstName">First Name *</label>
                            <input type="text" class="form-control" name="firstName" 
                                   value="${customer.firstName}" required maxlength="50">
                        </div>
                    </div>
                    
                    <div class="col-md-6">
                        <div class="form-group">
                            <label for="lastName">Last Name *</label>
                            <input type="text" class="form-control" name="lastName" 
                                   value="${customer.lastName}" required maxlength="50">
                        </div>
                    </div>
                </div>
                
                <div class="form-group">
                    <label for="newUsername">Username *</label>
                    <input type="text" class="form-control" name="newUsername" 
                           value="${customer.username}" required maxlength="30"
                           pattern="[a-zA-Z0-9_]+" 
                           title="Username can only contain letters, numbers, and underscores">
                    <small class="form-text text-muted">
                        <i class="fas fa-info-circle"></i> 
                        If you change your username, you'll need to log in again with the new username.
                    </small>
                </div>
                
                <div class="form-group">
                    <label for="email">Email *</label>
                    <input type="email" class="form-control" name="email" 
                           value="${customer.email}" required maxlength="100">
                </div>
                
                <div class="form-group">
                    <label for="mobile">Mobile *</label>
                    <input type="tel" class="form-control" name="mobile" 
                           value="${customer.mobile}" required
                           pattern="[0-9]{10,12}" title="Please enter a valid 10-12 digit mobile number">
                </div>
                
                <div class="form-group">
                    <label for="address">Address *</label>
                    <textarea class="form-control" name="address" rows="3" required maxlength="500">${customer.address}</textarea>
                </div>
                
                <div class="form-group">
                    <label for="profilePhoto">Profile Photo</label>
                    <div class="custom-file">
                        <input type="file" class="custom-file-input" name="profilePhoto" 
                               accept="image/jpeg,image/jpg,image/png,image/gif">
                        <label class="custom-file-label" for="profilePhoto">Choose photo...</label>
                    </div>
                    <small class="form-text text-muted">
                        <i class="fas fa-info-circle"></i> 
                        Supported formats: JPG, PNG, GIF. Max size: 5MB
                    </small>
                </div>
                
                <div class="form-group text-center">
                    <button type="submit" class="btn btn-primary">
                        <i class="fas fa-save"></i> Update Profile
                    </button>
                    <a href="${pageContext.request.contextPath}/customer/books" class="btn btn-secondary ml-3">
                        <i class="fas fa-arrow-left"></i> Back to Books
                    </a>
                </div>
            </form>
        </div>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"></script>
    <script src="https://kit.fontawesome.com/a076d05399.js"></script>
    
    <script>
        // Update file input label when file is selected
        $('.custom-file-input').on('change', function() {
            var fileName = $(this).val().split('\\').pop();
            $(this).siblings('.custom-file-label').addClass('selected').html(fileName);
        });
        
        // Auto-hide alerts after 5 seconds
        setTimeout(function() {
            $('.alert').fadeOut('slow');
        }, 5000);
    </script>
</body>
</html>
