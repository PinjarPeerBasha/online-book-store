<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
  <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
  <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
      <%@ page import="java.util.*, com.shashirajraja.onlinebookstore.entity.ShoppingCart" %>
        <html lang="en">

        <head>

          <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
          <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

          <title>Online Book Store</title>

          <!-- Custom fonts for this template -->
          <link href="${pageContext.request.contextPath}/vendor/fontawesome-free/css/all.min.css" rel="stylesheet"
            type="text/css">
          <link
            href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
            rel="stylesheet">

          <!-- Custom styles for this template -->
          <link href="${pageContext.request.contextPath}/css/login-register.css" rel="stylesheet">

          <!-- Custom styles for this page -->
          <link href="${pageContext.request.contextPath}/vendor/datatables/dataTables.bootstrap4.min.css"
            rel="stylesheet" type="text/css">

        </head>

        <body id="page-top">

          <!-- Page Wrapper -->
          <div id="wrapper">

            <!-- Sidebar -->
            <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

              <!-- Sidebar - Brand -->
              <a class="sidebar-brand d-flex align-items-center justify-content-center"
                href="${pageContext.request.contextPath}/customers">
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
              <div class="sidebar-heading">
                Interface
              </div>

              <!-- Nav Item - Pages Collapse Menu -->
              <li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseTwo"
                  aria-expanded="true" aria-controls="collapseTwo">
                  <i class="fas fa-fw fa-user"></i>
                  <span>Profile</span>
                </a>
                <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
                  <div class="bg-white py-2 collapse-inner rounded">
                    <h6 class="collapse-header">Profile:</h6>
                    <a class="collapse-item" href="${pageContext.request.contextPath}/customers/profile">View
                      Profile</a>
                    <a class="collapse-item" href="${pageContext.request.contextPath}/customers/profile/update">Update
                      Profile</a>
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
              <div class="sidebar-heading">
                security
              </div>

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
                      <a class="nav-link dropdown-toggle" href="#" id="searchDropdown" role="button"
                        data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        <i class="fas fa-search fa-fw"></i>
                      </a>
                      <!-- Dropdown - Messages -->
                      <div class="dropdown-menu dropdown-menu-right p-3 shadow animated--grow-in"
                        aria-labelledby="searchDropdown">
                        <form class="form-inline mr-auto w-100 navbar-search">
                          <div class="input-group">
                            <input type="text" class="form-control bg-light border-0 small" placeholder="Search for..."
                              aria-label="Search" aria-describedby="basic-addon2">
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
                      <a class="nav-link dropdown-toggle" href="#" id="alertsDropdown" role="button"
                        data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        <i class="fas fa-bell fa-fw"></i>
                        <!-- Counter - Alerts -->
                        <span class="badge badge-danger badge-counter" style="display: none;">0</span>
                      </a>
                      <!-- Dropdown - Alerts -->
                      <div class="dropdown-list dropdown-menu dropdown-menu-right shadow animated--grow-in"
                        aria-labelledby="alertsDropdown">
                        <h6 class="dropdown-header">
                          Alerts Center
                        </h6>
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
                      <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button"
                        data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        <span class="mr-2 d-none d-lg-inline text-gray-600 small">Welcome Folks!</span>
                        <img class="img-profile rounded-circle"
                          src="https://img.freepik.com/free-vector/blue-circle-with-white-user_78370-4707.jpg?semt=ais_hybrid&w=740&q=80">
                      </a>
                      <!-- Dropdown - User Information -->
                      <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in"
                        aria-labelledby="userDropdown">
                        <a class="dropdown-item" href="${pageContext.request.contextPath}/customers/profile">
                          <i class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i>
                          Profile
                        </a>
                        <div class="dropdown-divider"></div>
                        <a class="dropdown-item" href="${pageContext.request.contextPath}/logout" data-toggle="modal"
                          data-target="#logoutModal">
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
                  <h1 class="h3 mb-2 text-gray-800">Shopping Cart</h1>

                  <!-- DataTales Example -->
                  <div class="card shadow mb-4">
                    <div class="card-header py-3">
                      <h6 class="m-0 font-weight-bold text-primary">Shopping Items List</h6>
                    </div>
                    <c:if test="${message != null}">
                      <div class="card-header py-3">
                        <h6 class="m-0 font-weight-bold text-primary">
                          <c:out value="${message}"></c:out>
                        </h6>
                      </div>
                    </c:if>
                    <div class="card-body">
                      <!-- Modern Cart Layout -->
                      <div class="cart-container">
                        <c:set var="totalPrice" value="0" scope="page" />
                        <c:set var="totalQuantity" value="0" scope="page" />
                        <c:forEach var="shoppingCart" items="${shoppingItems}">
                          <c:url var="removeFromCartLink" value="/customers/cart/remove">
                            <c:param name="bookId" value="${shoppingCart.book.id}" />
                          </c:url>
                          
                          <div class="cart-item card shadow-sm mb-3">
                            <div class="card-body">
                              <div class="row align-items-center">
                                <!-- Book Image -->
                                <div class="col-md-2 col-sm-3 text-center">
                                  <div class="cart-book-image">
                                    <c:choose>
                                      <c:when test="${not empty shoppingCart.book.imageUrl}">
                                        <img src="${shoppingCart.book.imageUrl}" class="img-fluid rounded" alt="${shoppingCart.book.name}" 
                                             onerror="this.src='https://via.placeholder.com/120x160/f8f9fa/6c757d?text=No+Image'" style="max-width: 120px; max-height: 160px; object-fit: cover;">
                                      </c:when>
                                      <c:otherwise>
                                        <img src="https://via.placeholder.com/120x160/f8f9fa/6c757d?text=Book+Cover" class="img-fluid rounded" alt="Default book cover">
                                      </c:otherwise>
                                    </c:choose>
                                  </div>
                                </div>
                                
                                <!-- Book Details -->
                                <div class="col-md-4 col-sm-5">
                                  <h6 class="font-weight-bold mb-1">${shoppingCart.book.name}</h6>
                                  <p class="text-muted small mb-1">
                                    <i class="fas fa-user"></i> ${shoppingCart.book.bookDetail.author != null ? shoppingCart.book.bookDetail.author : 'Unknown Author'}
                                  </p>
                                  <p class="text-muted small mb-1">
                                    <i class="fas fa-tag"></i> ${shoppingCart.book.bookDetail.category != null ? shoppingCart.book.bookDetail.category : 'N/A'}
                                  </p>
                                  <c:if test="${not empty shoppingCart.book.bookDetail.description}">
                                    <p class="text-muted small">
                                      <i class="fas fa-info-circle"></i> 
                                      ${shoppingCart.book.bookDetail.description.length() > 60 ? 
                                        shoppingCart.book.bookDetail.description.substring(0, 60).concat('...') : 
                                        shoppingCart.book.bookDetail.description}
                                    </p>
                                  </c:if>
                                </div>
                                
                                <!-- Price Per Item -->
                                <div class="col-md-2 col-sm-2 text-center">
                                  <p class="mb-1 small text-muted">Price/Item</p>
                                  <h6 class="text-primary font-weight-bold">INR ${shoppingCart.book.price}</h6>
                                </div>
                                
                                <!-- Quantity -->
                                <div class="col-md-2 col-sm-2 text-center">
                                  <p class="mb-1 small text-muted">Quantity</p>
                                  <span class="badge badge-info badge-lg">×${shoppingCart.quantity}</span>
                                </div>
                                
                                <!-- Subtotal -->
                                <div class="col-md-2 col-sm-2 text-center">
                                  <p class="mb-1 small text-muted">Subtotal</p>
                                  <h6 class="text-success font-weight-bold">INR ${shoppingCart.quantity * shoppingCart.book.price}</h6>
                                  <a href="${removeFromCartLink}" class="btn btn-sm btn-outline-danger mt-2 remove-cart-item" 
                                     data-book-name="${shoppingCart.book.name}"
                                     onclick="return confirm('Remove this book from cart?')">
                                    <i class="fas fa-trash"></i> Remove
                                  </a>
                                </div>
                              </div>
                            </div>
                          
                          <c:set var="totalPrice"
                            value="${totalPrice + (shoppingCart.quantity * shoppingCart.book.price) }"
                            scope="page" />
                          <c:set var="totalQuantity" value="${totalQuantity + shoppingCart.quantity }"
                            scope="page" />
                        </c:forEach>
                        
                        <!-- Cart Summary -->
                        <div class="cart-summary">
                          <div class="card bg-light">
                            <div class="card-body">
                              <div class="row">
                                <div class="col-md-8">
                                  <h5 class="mb-3"><i class="fas fa-shopping-cart"></i> Cart Summary</h5>
                                  <div class="row">
                                    <div class="col-sm-6">
                                      <p class="mb-2"><strong>Total Items:</strong> <span class="badge badge-primary">${totalQuantity}</span></p>
                                    </div>
                                    <div class="col-sm-6">
                                      <p class="mb-2"><strong>Total Amount:</strong> <span class="text-success font-weight-bold">INR ${totalPrice}</span></p>
                                    </div>
                                  </div>
                                </div>
                                <div class="col-md-4 text-right">
                                  <c:choose>
                                    <c:when test="${totalQuantity > 0}">
                                      <a class="btn btn-success btn-lg" href="${pageContext.request.contextPath}/customers/cart/pay">
                                        <i class="fas fa-credit-card"></i> Proceed to Payment
                                      </a>
                                      <p class="small text-muted mt-2">Secure checkout with multiple payment options</p>
                                    </c:when>
                                    <c:otherwise>
                                      <a class="btn btn-primary btn-lg" href="${pageContext.request.contextPath}/books">
                                        <i class="fas fa-book"></i> Browse Books
                                      </a>
                                      <p class="small text-muted mt-2">Your cart is empty</p>
                                    </c:otherwise>
                                  </c:choose>
                                </div>
                              </div>
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
          <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
            aria-hidden="true">
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

          <!-- Page level plugins -->
          <script src="${pageContext.request.contextPath}/vendor/datatables/jquery.dataTables.min.js"></script>
          <script src="${pageContext.request.contextPath}/vendor/datatables/dataTables.bootstrap4.min.js"></script>

          <!-- Page level custom scripts -->
          <script src="${pageContext.request.contextPath}/js/demo/datatables-demo.js"></script>
          
          <!-- Toast Notifications -->
          <script src="${pageContext.request.contextPath}/js/toast-notifications.js"></script>

          <!-- Cart Page Custom Styles -->
          <style>
            .cart-item {
              transition: transform 0.2s ease, box-shadow 0.2s ease;
            }
            
            .cart-item:hover {
              transform: translateY(-2px);
              box-shadow: 0 5px 15px rgba(0,0,0,0.1) !important;
            }
            
            .cart-book-image img {
              border: 2px solid #e3e6f0;
              transition: transform 0.2s ease;
            }
            
            .cart-item:hover .cart-book-image img {
              transform: scale(1.05);
            }
            
            .badge-lg {
              font-size: 0.9em;
              padding: 6px 12px;
            }
            
            .cart-summary {
              margin-top: 2rem;
              border-top: 3px solid #4e73df;
            }
            
            @media (max-width: 768px) {
              .cart-item .row > div {
                margin-bottom: 1rem;
              }
              
              .cart-book-image {
                margin-bottom: 1rem;
              }
            }
          </style>
        
        <script>
          $(document).ready(function() {
            // Show message from server as toast
            <c:if test="${message != null}">
              Toast.success('${message}');
            </c:if>
            
            // Handle remove from cart
            $('.remove-cart-item').on('click', function(e) {
              const bookName = $(this).data('book-name');
              setTimeout(function() {
                Toast.warning('Book: "' + bookName + '" removed from cart!');
              }, 100);
            });
            
            // Show cart loaded message
            const itemCount = ${shoppingItems.size()};
            if (itemCount > 0) {
              Toast.info('You have ' + itemCount + ' item(s) in your cart');
            }
          });
        </script>

      </body>

        </html>