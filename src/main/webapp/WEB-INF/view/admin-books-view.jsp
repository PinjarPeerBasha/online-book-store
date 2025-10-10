<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>All Books - Admin View</title>

  <!-- Bootstrap CSS -->
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
  
  <!-- Font Awesome -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">

  <!-- Custom styles -->
  <link type="text/css" href="${pageContext.request.contextPath}/css/login-register.css" rel="stylesheet">

  <style>
    .books-container {
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
          <h2><i class="fas fa-eye text-primary"></i> All Books (Admin View)</h2>
          <a href="${pageContext.request.contextPath}/admin" class="btn btn-secondary">
            <i class="fas fa-dashboard"></i> Admin Dashboard
          </a>
        </div>
      </div>
    </div>

    <!-- Alert Messages -->
    <c:if test="${message != null}">
      <div class="alert alert-${messageType == 'error' ? 'danger' : 'info'} alert-dismissible fade show" role="alert">
        <i class="fas fa-${messageType == 'error' ? 'exclamation-triangle' : 'info-circle'}"></i>
        ${message}
        <button type="button" class="close" data-dismiss="alert" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
    </c:if>

    <!-- Books List -->
    <div class="row">
      <div class="col-12">
        <div class="books-container">
          <c:choose>
            <c:when test="${not empty books}">
              <div class="table-responsive">
                <table class="table table-hover">
                  <thead class="thead-dark">
                    <tr>
                      <th>ID</th>
                      <th>Book Title</th>
                      <th>Author</th>
                      <th>Category</th>
                      <th>Price</th>
                      <th>Quantity</th>
                      <th>Seller</th>
                    </tr>
                  </thead>
                  <tbody>
                    <c:forEach items="${books}" var="book">
                      <tr>
                        <td>${book.id}</td>
                        <td>
                          <strong>${book.name}</strong>
                          <c:if test="${book.quantity == 0}">
                            <span class="badge badge-danger ml-2">Out of Stock</span>
                          </c:if>
                        </td>
                        <td>${book.bookDetail.author != null ? book.bookDetail.author : 'N/A'}</td>
                        <td>${book.bookDetail.category != null ? book.bookDetail.category : 'N/A'}</td>
                        <td><strong>INR <fmt:formatNumber value="${book.price}" pattern="#,##0.00" /></strong></td>
                        <td>
                          <span class="badge badge-${book.quantity > 0 ? 'success' : 'danger'}">
                            ${book.quantity}
                          </span>
                        </td>
                        <td>
                          <c:choose>
                            <c:when test="${book.seller != null}">
                              ${book.seller.businessName} (${book.seller.firstName} ${book.seller.lastName})
                            </c:when>
                            <c:otherwise>
                              <span class="text-muted">No Seller Assigned</span>
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
                <i class="fas fa-book fa-4x text-muted mb-3"></i>
                <h4 class="text-muted">No books found</h4>
                <p class="text-muted">There are currently no books in the system.</p>
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
