<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>All Customers - Admin View</title>

  <!-- Bootstrap CSS -->
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
  
  <!-- Font Awesome -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">

  <!-- Custom styles -->
  <link type="text/css" href="${pageContext.request.contextPath}/css/login-register.css" rel="stylesheet">

  <style>
    .customers-container {
      background: white;
      padding: 30px;
      border-radius: 15px;
      box-shadow: 0 0 20px rgba(0,0,0,0.1);
    }
  </style>
</head>

<body class="bg-light">

  <div class="container mt-5">
    
    <!-- Header -->
    <div class="row mb-4">
      <div class="col-12">
        <div class="d-flex justify-content-between align-items-center">
          <h2><i class="fas fa-users text-primary"></i> All Customers</h2>
          <a href="${pageContext.request.contextPath}/admin" class="btn btn-secondary">
            <i class="fas fa-dashboard"></i> Admin Dashboard
          </a>
        </div>
      </div>
    </div>

    <!-- Customers List -->
    <div class="row">
      <div class="col-12">
        <div class="customers-container">
          <c:choose>
            <c:when test="${not empty customers}">
              <div class="table-responsive">
                <table class="table table-hover">
                  <thead class="thead-dark">
                    <tr>
                      <th>Username</th>
                      <th>Name</th>
                      <th>Email</th>
                      <th>Mobile</th>
                      <th>Address</th>
                      <th>Status</th>
                    </tr>
                  </thead>
                  <tbody>
                    <c:forEach items="${customers}" var="customer">
                      <tr>
                        <td><strong>${customer.username}</strong></td>
                        <td>${customer.firstName} ${customer.lastName}</td>
                        <td>${customer.email}</td>
                        <td>${customer.mobile}</td>
                        <td>${customer.address}</td>
                        <td>
                          <c:choose>
                            <c:when test="${customer.user.enabled}">
                              <span class="badge badge-success">Active</span>
                            </c:when>
                            <c:otherwise>
                              <span class="badge badge-danger">Inactive</span>
                            </c:otherwise>
                          </c:choose>
                        </td>
                      </tr>
                    </c:forEach>
                  </tbody>
                </table>
              </div>
            </c:when>
            <c:otherwise>
              <div class="text-center py-5">
                <i class="fas fa-users fa-4x text-muted mb-3"></i>
                <h4 class="text-muted">No customers found</h4>
                <p class="text-muted">There are currently no registered customers.</p>
              </div>
            </c:otherwise>
          </c:choose>
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
