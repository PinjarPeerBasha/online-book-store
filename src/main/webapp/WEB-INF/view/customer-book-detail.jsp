<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="en">

<head>
  <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  
  <title>Book Details - Online Book Store</title>

  <!-- Custom fonts for this template -->
  <link href="${pageContext.request.contextPath}/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

  <!-- Custom styles for this template -->
  <link href="${pageContext.request.contextPath}/css/login-register.css" rel="stylesheet">
  <link href="${pageContext.request.contextPath}/vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet" type="text/css">
</head>

<body id="page-top">

  <!-- Page Wrapper -->
  <div id="wrapper">

    <!-- Sidebar -->
    <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

      <!-- Sidebar - Brand -->
      <a class="sidebar-brand d-flex align-items-center justify-content-center" href="${pageContext.request.contextPath}/customers">
        <div class="sidebar-brand-icon rotate-n-15">
          <i class="fas fa-laugh-wink"></i>
        </div>
        <div class="sidebar-brand-text mx-3">Book Store</div>
      </a>

      <!-- Divider -->
      <hr class="sidebar-divider my-0">

      <!-- Nav Item - HOME -->
      <li class="nav-item">
        <a class="nav-link" href="${pageContext.request.contextPath}/customers">
          <i class="fas fa-fw fa-tachometer-alt"></i>
          <span>Home</span></a>
      </li>

      <!-- Divider -->
      <hr class="sidebar-divider">

      <!-- Heading -->
      <div class="sidebar-heading">Interface</div>

      <!-- Nav Item - Pages Collapse Menu -->
      <li class="nav-item">
        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseTwo" aria-expanded="true" aria-controls="collapseTwo">
          <i class="fas fa-fw fa-user"></i>
          <span>Profile</span>
        </a>
        <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
          <div class="bg-white py-2 collapse-inner rounded">
            <h6 class="collapse-header">Profile:</h6>
            <a class="collapse-item" href="${pageContext.request.contextPath}/customers/profile">View Profile</a>
            <a class="collapse-item" href="${pageContext.request.contextPath}/customers/profile/update">Update Profile</a>
          </div>
        </div>
      </li>

      <!-- Nav Item - Books List -->
      <li class="nav-item active">
        <a class="nav-link" href="${pageContext.request.contextPath}/books">
          <i class="fas fa-fw fa-book"></i>
          <span> Books Available</span></a>
      </li>

      <li class="nav-item">
        <a class="nav-link" href="${pageContext.request.contextPath}/customers/books">
          <i class="fas fa-fw fa-book"></i>
          <span> Books Purchased</span></a>
      </li>

      <!-- Nav Item - Cart -->
      <li class="nav-item">
        <a class="nav-link" href="${pageContext.request.contextPath}/customers/cart">
          <i class="fas fa-fw fa-shopping-cart"></i>
          <span>Shopping Cart</span></a>
      </li>

      <!-- View Transactions History -->
      <li class="nav-item">
        <a class="nav-link" href="${pageContext.request.contextPath}/customers/transactions">
          <i class="fas fa-fw fa-shopping-cart"></i>
          <span>Transactions</span></a>
      </li>

      <!-- Divider -->
      <hr class="sidebar-divider">

      <!-- Heading -->
      <div class="sidebar-heading">Security</div>

      <!-- Nav Password change -->
      <li class="nav-item">
        <a class="nav-link" href="${pageContext.request.contextPath}/customers/password">
          <i class="fas fa-fw fa-key"></i>
          <span>Change Password</span></a>
      </li>

      <!-- Nav Logout button -->
      <li class="nav-item" onClick="return confirm('Do you really want to logout?')">
        <a class="nav-link" href="${pageContext.request.contextPath}/logout">
          <i class="fas fa-fw fa-sign-out-alt"></i>
          <span>Logout</span></a>
      </li>

      <!-- Divider -->
      <hr class="sidebar-divider d-none d-md-block">

      <!-- Sidebar Toggler (Sidebar) -->
      <div class="text-center d-none d-md-inline">
        <button class="rounded-circle border-0" id="sidebarToggle"></button>
      </div>

    </ul>
    <!-- End of Sidebar -->

    <!-- Content Wrapper -->
    <div id="content-wrapper" class="d-flex flex-column">

      <!-- Main Content -->
      <div id="content">

        <!-- Topbar -->
        <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

          <!-- Sidebar Toggle (Topbar) -->
          <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
            <i class="fa fa-bars"></i>
          </button>

          <!-- Topbar Search -->
          <form class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search"
            method="get" action="${pageContext.request.contextPath}/customers/books/search">
            <div class="input-group">
              <input type="text" name="name" class="form-control bg-light border-0 small"
                placeholder="Search for..." aria-label="Search" aria-describedby="basic-addon2">
              <div class="input-group-append">
                <button type="submit" class="btn btn-primary">
                  <i class="fas fa-search fa-sm"></i>
                </button>
              </div>
            </div>
          </form>

          <!-- Topbar Navbar -->
          <ul class="navbar-nav ml-auto">

            <!-- Nav Item - Search Dropdown (Visible Only XS) -->
            <li class="nav-item dropdown no-arrow d-sm-none">
              <a class="nav-link dropdown-toggle" href="#" id="searchDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                <i class="fas fa-search fa-fw"></i>
              </a>
              <!-- Dropdown - Messages -->
              <div class="dropdown-menu dropdown-menu-right p-3 shadow animated--grow-in" aria-labelledby="searchDropdown">
                <form class="form-inline mr-auto w-100 navbar-search">
                  <div class="input-group">
                    <input type="text" class="form-control bg-light border-0 small" placeholder="Search for..." aria-label="Search" aria-describedby="basic-addon2">
                    <div class="input-group-append">
                      <button class="btn btn-primary" type="button">
                        <i class="fas fa-search fa-sm"></i>
                      </button>
                    </div>
                  </div>
                </form>
              </div>
            </li>

            <!-- Nav Item - Alerts -->
            <li class="nav-item dropdown no-arrow mx-1">
              <a class="nav-link dropdown-toggle" href="#" id="alertsDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                <i class="fas fa-bell fa-fw"></i>
                <!-- Counter - Alerts -->
                <span class="badge badge-danger badge-counter" style="display: none;">0</span>
              </a>
              <!-- Dropdown - Alerts -->
              <div class="dropdown-list dropdown-menu dropdown-menu-right shadow animated--grow-in" aria-labelledby="alertsDropdown">
                <h6 class="dropdown-header">Alerts Center</h6>
                <a class="dropdown-item d-flex align-items-center" href="#">
                  <div class="mr-3">
                    <div class="icon-circle bg-primary">
                      <i class="fas fa-file-alt text-white"></i>
                    </div>
                  </div>
                  <div>
                    <div class="small text-gray-500">Recent</div>
                    <span class="font-weight-bold">No new notifications</span>
                  </div>
                </a>
                <a class="dropdown-item text-center small text-gray-500" href="#">Show All Alerts</a>
              </div>
            </li>

            <!-- Nav Item - Cart -->
            <li class="nav-item dropdown no-arrow mx-1">
              <a class="nav-link" href="${pageContext.request.contextPath}/customers/cart">
                <i class="fas fa-shopping-cart fa-fw"></i>
                <!-- Counter cart -->
                <c:set var="cartCount" value="${shoppingItems.size()}" />
                <c:if test="${cartCount > 0}">
                  <span class="badge badge-danger badge-counter">${cartCount}</span>
                </c:if>
              </a>
            </li>

            <div class="topbar-divider d-none d-sm-block"></div>

            <!-- Nav Item - User Information -->
            <li class="nav-item dropdown no-arrow">
              <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                <span class="mr-2 d-none d-lg-inline text-gray-600 small">
                  <c:out value="${customerData.firstName} ${customerData.lastName}"></c:out>
                </span>
                <img class="img-profile rounded-circle" src="https://img.freepik.com/free-vector/blue-circle-with-white-user_78370-4707.jpg?semt=ais_hybrid&w=740&q=80">
              </a>
              <!-- Dropdown - User Information -->
              <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in" aria-labelledby="userDropdown">
                <a class="dropdown-item" href="${pageContext.request.contextPath}/customers/profile">
                  <i class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i>
                  Profile
                </a>
                <div class="dropdown-divider"></div>
                <a class="dropdown-item" href="${pageContext.request.contextPath}/logout" data-toggle="modal" data-target="#logoutModal">
                  <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
                  Logout
                </a>
              </div>
            </li>

          </ul>

        </nav>
        <!-- End of Topbar -->

        <!-- Begin Page Content -->
        <div class="container-fluid">

          <!-- Page Heading -->
          <div class="d-sm-flex align-items-center justify-content-between mb-4">
            <h1 class="h3 mb-0 text-gray-800">Book Details</h1>
            <a href="${pageContext.request.contextPath}/books" class="btn btn-sm btn-primary shadow-sm">
              <i class="fas fa-arrow-left fa-sm text-white-50"></i> Back to Books
            </a>
          </div>

          <!-- Book Details -->
          <div class="row">
            
            <!-- Book Image and Actions -->
            <div class="col-lg-4">
              <div class="card shadow mb-4">
                <div class="card-body text-center">
                  <div class="book-detail-image mb-4">
                    <c:choose>
                      <c:when test="${not empty book.imageUrl}">
                        <img src="${book.imageUrl}" class="img-fluid rounded shadow" alt="${book.name}" 
                             onerror="this.src='https://via.placeholder.com/300x400/f8f9fa/6c757d?text=No+Image'" 
                             style="max-width: 300px; max-height: 400px; object-fit: cover;">
                      </c:when>
                      <c:otherwise>
                        <img src="https://via.placeholder.com/300x400/f8f9fa/6c757d?text=Book+Cover" 
                             class="img-fluid rounded shadow" alt="Default book cover">
                      </c:otherwise>
                    </c:choose>
                  </div>
                  
                  <!-- Stock Status -->
                  <div class="stock-status mb-3">
                    <c:choose>
                      <c:when test="${book.quantity == 0}">
                        <span class="badge badge-danger badge-lg">
                          <i class="fas fa-times-circle"></i> Out of Stock
                        </span>
                      </c:when>
                      <c:when test="${book.quantity <= 5}">
                        <span class="badge badge-warning badge-lg">
                          <i class="fas fa-exclamation-triangle"></i> Low Stock (${book.quantity} left)
                        </span>
                      </c:when>
                      <c:otherwise>
                        <span class="badge badge-success badge-lg">
                          <i class="fas fa-check-circle"></i> In Stock (${book.quantity} available)
                        </span>
                      </c:otherwise>
                    </c:choose>
                  </div>
                  
                  <!-- Price -->
                  <h3 class="text-success font-weight-bold mb-3">INR ${book.price}</h3>
                  
                  <!-- Add to Cart Button -->
                  <c:url var="addToCartLink" value="/customers/cart/add">
                    <c:param name="bookId" value="${book.id}" />
                  </c:url>
                  <c:url var="removeFromCartLink" value="/customers/cart/remove">
                    <c:param name="bookId" value="${book.id}" />
                  </c:url>
                  
                  <!-- Check if already in cart -->
                  <c:set var="inCart" value="false" />
                  <c:forEach var="item" items="${shoppingItems}">
                    <c:if test="${item.book.id eq book.id}">
                      <c:set var="inCart" value="true" />
                    </c:if>
                  </c:forEach>
                  
                  <div class="cart-actions">
                    <c:choose>
                      <c:when test="${book.quantity == 0}">
                        <button class="btn btn-secondary btn-lg btn-block" disabled>
                          <i class="fas fa-times"></i> Out of Stock
                        </button>
                      </c:when>
                      <c:when test="${inCart == false}">
                        <a href="${addToCartLink}" class="btn btn-success btn-lg btn-block">
                          <i class="fas fa-cart-plus"></i> Add to Cart
                        </a>
                      </c:when>
                      <c:otherwise>
                        <a href="${removeFromCartLink}" class="btn btn-danger btn-lg btn-block">
                          <i class="fas fa-trash"></i> Remove from Cart
                        </a>
                        <small class="text-success d-block mt-2">
                          <i class="fas fa-check"></i> Already in your cart
                        </small>
                      </c:otherwise>
                    </c:choose>
                  </div>
                </div>
              </div>
            </div>
            
            <!-- Book Information -->
            <div class="col-lg-8">
              <div class="card shadow mb-4">
                <div class="card-header py-3">
                  <h6 class="m-0 font-weight-bold text-primary">
                    <i class="fas fa-info-circle"></i> Book Information
                  </h6>
                </div>
                <div class="card-body">
                  
                  <!-- Book Title -->
                  <h2 class="font-weight-bold text-primary mb-3">${book.name}</h2>
                  
                  <!-- Basic Information Grid -->
                  <div class="row mb-4">
                    <div class="col-md-6">
                      <div class="info-item mb-3">
                        <strong class="text-muted">
                          <i class="fas fa-user text-primary"></i> Author:
                        </strong>
                        <p class="mb-0">${book.bookDetail.author != null ? book.bookDetail.author : 'Not specified'}</p>
                      </div>
                      
                      <div class="info-item mb-3">
                        <strong class="text-muted">
                          <i class="fas fa-tag text-primary"></i> Category:
                        </strong>
                        <p class="mb-0">
                          <span class="badge badge-info">${book.bookDetail.category != null ? book.bookDetail.category : 'Not specified'}</span>
                        </p>
                      </div>
                      
                      <div class="info-item mb-3">
                        <strong class="text-muted">
                          <i class="fas fa-building text-primary"></i> Publisher:
                        </strong>
                        <p class="mb-0">${book.bookDetail.publisher != null ? book.bookDetail.publisher : 'Not specified'}</p>
                      </div>
                    </div>
                    
                    <div class="col-md-6">
                      <div class="info-item mb-3">
                        <strong class="text-muted">
                          <i class="fas fa-barcode text-primary"></i> ISBN:
                        </strong>
                        <p class="mb-0">${book.bookDetail.isbn != null ? book.bookDetail.isbn : 'Not specified'}</p>
                      </div>
                      
                      <div class="info-item mb-3">
                        <strong class="text-muted">
                          <i class="fas fa-ruler text-primary"></i> Dimensions:
                        </strong>
                        <p class="mb-0">${book.bookDetail.dimensions != null ? book.bookDetail.dimensions : 'Not specified'}</p>
                      </div>
                      
                      <div class="info-item mb-3">
                        <strong class="text-muted">
                          <i class="fas fa-store text-primary"></i> Sold By:
                        </strong>
                        <p class="mb-0">
                          <c:choose>
                            <c:when test="${book.seller != null}">
                              ${book.seller.businessName} 
                              <small class="text-muted">(${book.seller.user.firstName} ${book.seller.user.lastName})</small>
                            </c:when>
                            <c:otherwise>
                              Book Store
                            </c:otherwise>
                          </c:choose>
                        </p>
                      </div>
                    </div>
                  </div>
                  
                  <!-- Description -->
                  <c:if test="${not empty book.bookDetail.description}">
                    <div class="description-section">
                      <h6 class="font-weight-bold text-muted mb-3">
                        <i class="fas fa-align-left text-primary"></i> Description
                      </h6>
                      <div class="description-text">
                        <p class="text-justify">${book.bookDetail.description}</p>
                      </div>
                    </div>
                  </c:if>
                  
                  <!-- Additional Actions -->
                  <hr>
                  <div class="additional-actions">
                    <h6 class="font-weight-bold text-muted mb-3">
                      <i class="fas fa-share text-primary"></i> Actions
                    </h6>
                    <div class="btn-group" role="group">
                      <button type="button" class="btn btn-outline-info" onclick="shareBook()">
                        <i class="fas fa-share-alt"></i> Share
                      </button>
                      <button type="button" class="btn btn-outline-secondary" onclick="printPage()">
                        <i class="fas fa-print"></i> Print
                      </button>
                      <a href="${pageContext.request.contextPath}/books" class="btn btn-outline-primary">
                        <i class="fas fa-list"></i> Browse More Books
                      </a>
                    </div>
                  </div>
                  
                </div>
              </div>
            </div>
          </div>

        </div>
        <!-- /.container-fluid -->

      </div>
      <!-- End of Main Content -->

      <!-- Footer -->
      <footer class="sticky-footer bg-white">
        <div class="container my-auto">
          <div class="copyright text-center my-auto">
            <span>Copyright &copy; Online Book Store 2024</span>
          </div>
        </div>
      </footer>
      <!-- End of Footer -->

    </div>
    <!-- End of Content Wrapper -->

  </div>
  <!-- End of Page Wrapper -->

  <!-- Scroll to Top Button-->
  <a class="scroll-to-top rounded" href="#page-top">
    <i class="fas fa-angle-up"></i>
  </a>

  <!-- Logout Modal-->
  <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
          <button class="close" type="button" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
          </button>
        </div>
        <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
        <div class="modal-footer">
          <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
          <a class="btn btn-primary" href="${pageContext.request.contextPath}/logout">Logout</a>
        </div>
      </div>
    </div>
  </div>

  <!-- Bootstrap core JavaScript-->
  <script src="${pageContext.request.contextPath}/vendor/jquery/jquery.min.js"></script>
  <script src="${pageContext.request.contextPath}/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  <!-- Core plugin JavaScript-->
  <script src="${pageContext.request.contextPath}/vendor/jquery-easing/jquery.easing.min.js"></script>

  <!-- Custom scripts for all pages-->
  <script src="${pageContext.request.contextPath}/js/sb-admin-2.min.js"></script>

  <!-- Custom JavaScript for Book Detail Page -->
  <style>
    .book-detail-image img {
      transition: transform 0.3s ease;
      border: 3px solid #e3e6f0;
    }
    
    .book-detail-image:hover img {
      transform: scale(1.05);
    }
    
    .info-item {
      border-left: 3px solid #4e73df;
      padding-left: 15px;
    }
    
    .description-text {
      background-color: #f8f9fc;
      padding: 20px;
      border-radius: 10px;
      border-left: 4px solid #4e73df;
    }
    
    .badge-lg {
      font-size: 1em;
      padding: 8px 16px;
    }
    
    .cart-actions .btn {
      font-size: 1.1em;
      padding: 12px 24px;
    }
    
    @media (max-width: 768px) {
      .book-detail-image img {
        max-width: 250px;
        max-height: 350px;
      }
    }
  </style>

  <script>
    function shareBook() {
      if (navigator.share) {
        navigator.share({
          title: '${book.name}',
          text: 'Check out this book: ${book.name} by ${book.bookDetail.author != null ? book.bookDetail.author : "Unknown Author"}',
          url: window.location.href
        });
      } else {
        // Fallback for browsers that don't support Web Share API
        var url = window.location.href;
        navigator.clipboard.writeText(url).then(function() {
          alert('Book URL copied to clipboard!');
        });
      }
    }
    
    function printPage() {
      window.print();
    }
    
    // Add smooth scroll effect
    $(document).ready(function() {
      $('a[href^="#"]').on('click', function(event) {
        var target = $(this.getAttribute('href'));
        if( target.length ) {
          event.preventDefault();
          $('html, body').stop().animate({
            scrollTop: target.offset().top
          }, 1000);
        }
      });
    });
  </script>

</body>

</html>
