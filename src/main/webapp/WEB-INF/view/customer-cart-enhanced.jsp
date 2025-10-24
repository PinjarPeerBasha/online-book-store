<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<!DOCTYPE html>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.*, com.shashirajraja.onlinebookstore.entity.ShoppingCart" %>
<html lang="en">

<head>
  <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

  <title>Shopping Cart - Online Book Store</title>

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
      <li class="nav-item">
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
      <li class="nav-item active">
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
      <li class="nav-item">
        <a class="nav-link" href="${pageContext.request.contextPath}/logout" onclick="return confirm('Do you really want to logout?')">
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
          <form class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search" method="get" action="${pageContext.request.contextPath}/customers/books/search">
            <div class="input-group">
              <input type="text" name="name" class="form-control bg-light border-0 small" placeholder="Search for..." aria-label="Search" aria-describedby="basic-addon2">
              <div class="input-group-append">
                <button type="submit" class="btn btn-primary">
                  <i class="fas fa-search fa-sm"></i>
                </button>
              </div>
            </div>
          </form>

          <!-- Topbar Navbar -->
          <ul class="navbar-nav ml-auto">

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
                <span class="mr-2 d-none d-lg-inline text-gray-600 small">Welcome!</span>
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
            <h1 class="h3 mb-0 text-gray-800">
              <i class="fas fa-shopping-cart text-primary"></i> Shopping Cart
            </h1>
            <a href="${pageContext.request.contextPath}/books" class="btn btn-sm btn-primary shadow-sm">
              <i class="fas fa-plus fa-sm text-white-50"></i> Continue Shopping
            </a>
          </div>

          <!-- Cart Content -->
          <div class="row">
            
            <!-- Cart Items -->
            <div class="col-lg-8">
              <div class="card shadow mb-4">
                <div class="card-header py-3">
                  <h6 class="m-0 font-weight-bold text-primary">
                    <i class="fas fa-list"></i> Cart Items (<span id="cart-item-count">${shoppingItems.size()}</span>)
                  </h6>
                </div>
                <div class="card-body" id="cart-items-container">
                  
                  <c:choose>
                    <c:when test="${not empty shoppingItems}">
                      <c:forEach var="item" items="${shoppingItems}" varStatus="status">
                        <c:url var="removeFromCartLink" value="/customers/cart/remove">
                          <c:param name="bookId" value="${item.book.id}" />
                        </c:url>
                        
                        <div class="cart-item mb-3 p-3 border rounded" data-book-id="${item.book.id}" data-price="${item.book.price}">
                          <div class="row align-items-center">
                            
                            <!-- Book Image -->
                            <div class="col-md-2 col-sm-3 text-center mb-3 mb-md-0">
                              <c:choose>
                                <c:when test="${not empty item.book.imageUrl}">
                                  <img src="${item.book.imageUrl}" class="img-fluid rounded shadow-sm" alt="${item.book.name}" 
                                       onerror="this.src='https://via.placeholder.com/100x140/f8f9fa/6c757d?text=No+Image'" 
                                       style="max-width: 100px; max-height: 140px; object-fit: cover;">
                                </c:when>
                                <c:otherwise>
                                  <img src="https://via.placeholder.com/100x140/f8f9fa/6c757d?text=Book" class="img-fluid rounded shadow-sm" alt="Book">
                                </c:otherwise>
                              </c:choose>
                            </div>
                            
                            <!-- Book Details -->
                            <div class="col-md-4 col-sm-5 mb-3 mb-md-0">
                              <h6 class="font-weight-bold mb-1">${item.book.name}</h6>
                              <p class="text-muted small mb-1">
                                <i class="fas fa-user"></i> ${item.book.bookDetail.author != null ? item.book.bookDetail.author : 'Unknown'}
                              </p>
                              <p class="text-muted small mb-0">
                                <i class="fas fa-tag"></i> ${item.book.bookDetail.category != null ? item.book.bookDetail.category : 'N/A'}
                              </p>
                            </div>
                            
                            <!-- Quantity Selector -->
                            <div class="col-md-3 col-sm-4 text-center mb-3 mb-md-0">
                              <label class="small text-muted d-block mb-2">Quantity</label>
                              <div class="input-group input-group-sm" style="max-width: 130px; margin: 0 auto;">
                                <div class="input-group-prepend">
                                  <button class="btn btn-outline-secondary qty-decrease" type="button" onclick="updateQuantity(${item.book.id}, -1)">
                                    <i class="fas fa-minus"></i>
                                  </button>
                                </div>
                                <input type="number" class="form-control text-center quantity-input" 
                                       value="${item.quantity}" min="1" max="${item.book.quantity}" 
                                       data-book-id="${item.book.id}" readonly>
                                <div class="input-group-append">
                                  <button class="btn btn-outline-secondary qty-increase" type="button" onclick="updateQuantity(${item.book.id}, 1)">
                                    <i class="fas fa-plus"></i>
                                  </button>
                                </div>
                              </div>
                              <small class="text-muted d-block mt-1">${item.book.quantity} available</small>
                            </div>
                            
                            <!-- Price and Actions -->
                            <div class="col-md-3 col-sm-12 text-center text-md-right">
                              <p class="mb-1 small text-muted">Price/Item</p>
                              <h6 class="text-primary font-weight-bold mb-2">INR ${item.book.price}</h6>
                              <p class="mb-2 small text-muted">Subtotal</p>
                              <h5 class="text-success font-weight-bold item-subtotal mb-3">
                                INR <span class="subtotal-value">${item.quantity * item.book.price}</span>
                              </h5>
                              <a href="${removeFromCartLink}" class="btn btn-sm btn-outline-danger" 
                                 onclick="return confirm('Remove this book from cart?')">
                                <i class="fas fa-trash"></i> Remove
                              </a>
                            </div>
                            
                          </div>
                        </div>
                        
                        <c:if test="${!status.last}">
                          <hr>
                        </c:if>
                      </c:forEach>
                    </c:when>
                    <c:otherwise>
                      <div class="text-center py-5">
                        <i class="fas fa-shopping-cart fa-4x text-muted mb-3"></i>
                        <h4 class="text-muted">Your cart is empty</h4>
                        <p class="text-muted">Add some books to get started!</p>
                        <a href="${pageContext.request.contextPath}/books" class="btn btn-primary btn-lg mt-3">
                          <i class="fas fa-book"></i> Browse Books
                        </a>
                      </div>
                    </c:otherwise>
                  </c:choose>
                  
                </div>
              </div>
            </div>
            
            <!-- Cart Summary -->
            <div class="col-lg-4">
              <div class="card shadow mb-4 sticky-top" style="top: 20px;">
                <div class="card-header py-3 bg-primary">
                  <h6 class="m-0 font-weight-bold text-white">
                    <i class="fas fa-calculator"></i> Order Summary
                  </h6>
                </div>
                <div class="card-body">
                  
                  <c:set var="totalPrice" value="0" scope="page" />
                  <c:set var="totalQuantity" value="0" scope="page" />
                  <c:forEach var="item" items="${shoppingItems}">
                    <c:set var="totalPrice" value="${totalPrice + (item.quantity * item.book.price)}" scope="page" />
                    <c:set var="totalQuantity" value="${totalQuantity + item.quantity}" scope="page" />
                  </c:forEach>
                  
                  <div class="summary-row d-flex justify-content-between mb-3">
                    <span class="text-muted">Items (<span id="total-items">${totalQuantity}</span>):</span>
                    <span class="font-weight-bold">INR <span id="items-total">${totalPrice}</span></span>
                  </div>
                  
                  <div class="summary-row d-flex justify-content-between mb-3">
                    <span class="text-muted">Shipping:</span>
                    <span class="text-success font-weight-bold">FREE</span>
                  </div>
                  
                  <div class="summary-row d-flex justify-content-between mb-3">
                    <span class="text-muted">Tax (0%):</span>
                    <span class="font-weight-bold">INR 0.00</span>
                  </div>
                  
                  <hr>
                  
                  <div class="summary-row d-flex justify-content-between mb-4">
                    <h5 class="mb-0">Total:</h5>
                    <h4 class="mb-0 text-success font-weight-bold">
                      INR <span id="grand-total">${totalPrice}</span>
                    </h4>
                  </div>
                  
                  <c:choose>
                    <c:when test="${totalQuantity > 0}">
                      <a href="${pageContext.request.contextPath}/customers/cart/pay" class="btn btn-success btn-lg btn-block mb-3">
                        <i class="fas fa-credit-card"></i> Proceed to Checkout
                      </a>
                      <a href="${pageContext.request.contextPath}/books" class="btn btn-outline-primary btn-block">
                        <i class="fas fa-plus"></i> Add More Books
                      </a>
                    </c:when>
                    <c:otherwise>
                      <a href="${pageContext.request.contextPath}/books" class="btn btn-primary btn-lg btn-block">
                        <i class="fas fa-book"></i> Start Shopping
                      </a>
                    </c:otherwise>
                  </c:choose>
                  
                  <!-- Trust Badges -->
                  <div class="trust-badges mt-4 pt-3 border-top">
                    <p class="small text-muted mb-2"><i class="fas fa-shield-alt text-success"></i> Secure Checkout</p>
                    <p class="small text-muted mb-2"><i class="fas fa-truck text-primary"></i> Free Shipping</p>
                    <p class="small text-muted mb-0"><i class="fas fa-undo text-info"></i> Easy Returns</p>
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

  <!-- Toast Notifications -->
  <script src="${pageContext.request.contextPath}/js/toast-notifications.js"></script>

  <!-- Cart Page Custom Styles -->
  <style>
    .cart-item {
      transition: all 0.3s ease;
      background: #f8f9fc;
    }
    
    .cart-item:hover {
      background: white;
      box-shadow: 0 2px 8px rgba(0,0,0,0.1);
    }
    
    .quantity-input {
      font-weight: 600;
      color: #4e73df;
    }
    
    .qty-decrease, .qty-increase {
      transition: all 0.2s ease;
    }
    
    .qty-decrease:hover, .qty-increase:hover {
      background-color: #4e73df !important;
      color: white !important;
      border-color: #4e73df !important;
    }
    
    .sticky-top {
      position: sticky;
    }
    
    @media (max-width: 768px) {
      .sticky-top {
        position: relative;
      }
    }
  </style>

  <!-- Cart Quantity Update Script -->
  <script>
    function updateQuantity(bookId, change) {
      const cartItem = document.querySelector(`.cart-item[data-book-id="${bookId}"]`);
      const quantityInput = cartItem.querySelector('.quantity-input');
      const currentQty = parseInt(quantityInput.value);
      const maxQty = parseInt(quantityInput.max);
      const price = parseFloat(cartItem.dataset.price);
      
      let newQty = currentQty + change;
      
      // Validate quantity
      if (newQty < 1) {
        Toast.warning('Quantity cannot be less than 1. Use Remove button to delete item.');
        return;
      }
      
      if (newQty > maxQty) {
        Toast.warning(`Only ${maxQty} items available in stock.`);
        return;
      }
      
      // Update UI immediately for better UX
      quantityInput.value = newQty;
      const subtotalEl = cartItem.querySelector('.subtotal-value');
      const newSubtotal = (newQty * price).toFixed(2);
      subtotalEl.textContent = newSubtotal;
      
      // Recalculate totals
      recalculateTotals();
      
      // Show success message
      Toast.success(`Quantity updated to ${newQty}`, 2000);
      
      // TODO: Send AJAX request to update server-side cart
      // For now, this is client-side only
      // In production, you would call an API endpoint here
    }
    
    function recalculateTotals() {
      let totalItems = 0;
      let totalPrice = 0;
      
      document.querySelectorAll('.cart-item').forEach(item => {
        const qty = parseInt(item.querySelector('.quantity-input').value);
        const price = parseFloat(item.dataset.price);
        totalItems += qty;
        totalPrice += (qty * price);
      });
      
      document.getElementById('total-items').textContent = totalItems;
      document.getElementById('items-total').textContent = totalPrice.toFixed(2);
      document.getElementById('grand-total').textContent = totalPrice.toFixed(2);
      document.getElementById('cart-item-count').textContent = document.querySelectorAll('.cart-item').length;
    }
    
    // Initialize on page load
    $(document).ready(function() {
      // Sidebar toggle
      $('#sidebarToggle, #sidebarToggleTop').on('click', function(e) {
        $("body").toggleClass("sidebar-toggled");
        $(".sidebar").toggleClass("toggled");
      });
      
      // Show welcome message if cart has items
      const itemCount = ${shoppingItems.size()};
      if (itemCount > 0) {
        Toast.info(`You have ${itemCount} item(s) in your cart`, 3000);
      }
    });
  </script>

</body>

</html>
