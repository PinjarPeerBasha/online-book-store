<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
  <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
  <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
        <link href="${pageContext.request.contextPath}/vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet"
          type="text/css">

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
                  <a class="collapse-item" href="${pageContext.request.contextPath}/customers/profile">View Profile</a>
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
                    <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button" data-toggle="dropdown"
                      aria-haspopup="true" aria-expanded="false">
                      <span class="mr-2 d-none d-lg-inline text-gray-600 small">
                        <c:out value="${customerData.firstName} ${customerData.lastName}"></c:out>
                      </span>
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
                <h1 class="h3 mb-2 text-gray-800">Payment</h1>

                <!-- DataTales Example -->
                <div class="card shadow mb-4">
                  <div class="card-header py-3">
                    <h6 class="m-0 font-weight-bold text-primary">Note: This payment page is only for project purpose,
                      please do not enter correct details!</h6>
                  </div>
                  <div class="card-body">
                    <form:form action="${pageContext.request.contextPath}/customers/payment/success" method="post">
                      
                      <!-- Alert Messages -->
                      <c:if test="${message != null}">
                        <div class="alert alert-danger alert-dismissible fade show" role="alert">
                          <i class="fas fa-exclamation-triangle"></i> ${message}
                          <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                          </button>
                        </div>
                      </c:if>

                      <!-- Payment Method Selection -->
                      <div class="row">
                        <div class="col-12">
                          <h5 class="mb-3"><i class="fas fa-credit-card"></i> Choose Payment Method</h5>
                          
                          <!-- Payment Options -->
                          <div class="row mb-4">
                            <!-- Cash on Delivery -->
                            <div class="col-md-4 mb-3">
                              <div class="card payment-option" onclick="selectPaymentMethod('cod')">
                                <div class="card-body text-center">
                                  <i class="fas fa-truck fa-3x text-success mb-3"></i>
                                  <h6 class="card-title">Cash on Delivery</h6>
                                  <p class="card-text small text-muted">Pay when your order arrives</p>
                                  <input type="radio" name="paymentMethod" value="cod" id="codRadio" class="payment-radio">
                                </div>
                              </div>
                            </div>

                            <!-- Online Payment (UPI) -->
                            <div class="col-md-4 mb-3">
                              <div class="card payment-option" onclick="selectPaymentMethod('upi')">
                                <div class="card-body text-center">
                                  <i class="fas fa-mobile-alt fa-3x text-primary mb-3"></i>
                                  <h6 class="card-title">UPI Payment</h6>
                                  <p class="card-text small text-muted">Pay instantly with UPI</p>
                                  <input type="radio" name="paymentMethod" value="upi" id="upiRadio" class="payment-radio">
                                </div>
                              </div>
                            </div>

                            <!-- Stripe Payment -->
                            <div class="col-md-4 mb-3">
                              <div class="card payment-option" onclick="selectPaymentMethod('stripe')">
                                <div class="card-body text-center">
                                  <i class="fas fa-credit-card fa-3x text-info mb-3"></i>
                                  <h6 class="card-title">Card Payment</h6>
                                  <p class="card-text small text-muted">Pay with Credit/Debit Card</p>
                                  <input type="radio" name="paymentMethod" value="stripe" id="stripeRadio" class="payment-radio" disabled>
                                  <small class="text-warning d-block">Coming Soon</small>
                                </div>
                              </div>
                            </div>
                          </div>

                          <!-- COD Details -->
                          <div id="codDetails" class="payment-details" style="display: none;">
                            <div class="card bg-light">
                              <div class="card-body">
                                <h6><i class="fas fa-info-circle text-success"></i> Cash on Delivery Selected</h6>
                                <p class="mb-1"><i class="fas fa-check text-success"></i> Pay cash when your order is delivered</p>
                                <p class="mb-1"><i class="fas fa-check text-success"></i> No additional charges</p>
                                <p class="mb-0"><i class="fas fa-check text-success"></i> Make sure to have exact change ready</p>
                              </div>
                            </div>
                          </div>

                          <!-- UPI Details -->
                          <div id="upiDetails" class="payment-details" style="display: none;">
                            <div class="card bg-light">
                              <div class="card-body">
                                <h6><i class="fas fa-mobile-alt text-primary"></i> UPI Payment Details</h6>
                                <div class="row">
                                  <div class="col-md-6">
                                    <div class="form-group">
                                      <label for="upi"><strong>UPI ID *</strong></label>
                                      <input type="text" id="upi" name="upi" class="form-control" placeholder="example@upi" />
                                    </div>
                                  </div>
                                  <div class="col-md-6">
                                    <div class="form-group">
                                      <label for="otp"><strong>OTP *</strong></label>
                                      <input type="number" id="otp" name="otp" class="form-control" placeholder="Enter 6-digit OTP" />
                                    </div>
                                  </div>
                                </div>
                              </div>
                            </div>
                          </div>

                          <!-- Stripe Details (Disabled) -->
                          <div id="stripeDetails" class="payment-details" style="display: none;">
                            <div class="card bg-light">
                              <div class="card-body">
                                <h6><i class="fas fa-credit-card text-info"></i> Card Payment (Coming Soon)</h6>
                                <p class="text-muted mb-0">Credit/Debit card payments will be available soon. Please use COD or UPI for now.</p>
                              </div>
                            </div>
                          </div>

                        </div>
                      </div>

                      <!-- Action Buttons -->
                      <div class="row mt-4">
                        <div class="col-12 text-center">
                          <button type="submit" id="payButton" class="btn btn-success btn-lg" disabled>
                            <i class="fas fa-lock"></i> PROCEED TO PAY
                          </button>
                          <a href="${pageContext.request.contextPath}/customers/cart" class="btn btn-secondary btn-lg ml-3">
                            <i class="fas fa-arrow-left"></i> Back to Cart
                          </a>
                        </div>
                      </div>

                    </form:form>
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

        <!-- Payment Page Custom Styles and Scripts -->
        <style>
          .payment-option {
            cursor: pointer;
            transition: all 0.3s ease;
            border: 2px solid #e3e6f0;
          }
          
          .payment-option:hover {
            border-color: #4e73df;
            transform: translateY(-2px);
            box-shadow: 0 4px 15px rgba(0,0,0,0.1);
          }
          
          .payment-option.selected {
            border-color: #1cc88a;
            background-color: #f8fff9;
          }
          
          .payment-radio {
            display: none;
          }
          
          .payment-details {
            animation: slideDown 0.3s ease;
          }
          
          @keyframes slideDown {
            from { opacity: 0; transform: translateY(-10px); }
            to { opacity: 1; transform: translateY(0); }
          }
        </style>

        <script>
          $(document).ready(function() {
            // Payment method selection
            window.selectPaymentMethod = function(method) {
              // Remove all selections
              $('.payment-option').removeClass('selected');
              $('.payment-details').hide();
              $('.payment-radio').prop('checked', false);
              
              // Select current method
              $('#' + method + 'Radio').prop('checked', true);
              $('#' + method + 'Radio').closest('.payment-option').addClass('selected');
              $('#' + method + 'Details').show();
              
              // Enable/disable pay button based on method
              if (method === 'cod') {
                $('#payButton').prop('disabled', false);
                $('#payButton').html('<i class="fas fa-truck"></i> CONFIRM ORDER (COD)');
              } else if (method === 'upi') {
                $('#payButton').prop('disabled', false);
                $('#payButton').html('<i class="fas fa-mobile-alt"></i> PROCEED TO PAY (UPI)');
              } else if (method === 'stripe') {
                $('#payButton').prop('disabled', true);
                $('#payButton').html('<i class="fas fa-credit-card"></i> COMING SOON');
              }
            };
            
            // Form validation
            $('form').on('submit', function(e) {
              var paymentMethod = $('input[name="paymentMethod"]:checked').val();
              
              if (!paymentMethod) {
                e.preventDefault();
                alert('Please select a payment method');
                return false;
              }
              
              if (paymentMethod === 'upi') {
                var upi = $('#upi').val().trim();
                var otp = $('#otp').val().trim();
                
                if (!upi || !otp) {
                  e.preventDefault();
                  alert('Please fill in all UPI payment details');
                  return false;
                }
                
                if (otp.length !== 6) {
                  e.preventDefault();
                  alert('Please enter a valid 6-digit OTP');
                  return false;
                }
              }
              
              if (paymentMethod === 'stripe') {
                e.preventDefault();
                alert('Stripe payment is coming soon. Please use COD or UPI.');
                return false;
              }
            });
          });
        </script>

      </body>

      </html>