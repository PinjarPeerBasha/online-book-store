<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
  <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <html lang="en">

    <head>
      <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
      <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
      <title>Admin Dashboard - Online Book Store</title>

      <!-- Custom fonts for this template -->
      <link href="${pageContext.request.contextPath}/vendor/fontawesome-free/css/all.min.css" rel="stylesheet"
        type="text/css">
      <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

      <!-- Custom styles for this template -->
      <link href="${pageContext.request.contextPath}/css/login-register.css" rel="stylesheet">

      <!-- DataTables CSS -->
      <link href="${pageContext.request.contextPath}/vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet"
        type="text/css">

      <!-- CSRF Token -->
      <meta name="_csrf" content="${_csrf.token}">
      <meta name="_csrf_header" content="${_csrf.headerName}">

      <style>
        .admin-card {
          border-left: 4px solid #1cc88a;
          background: linear-gradient(45deg, #f8f9fc, #ffffff);
        }

        .admin-card:hover {
          transform: translateY(-2px);
          box-shadow: 0 10px 20px rgba(0, 0, 0, 0.1);
          transition: all 0.3s ease;
        }

        .stats-card {
          border-radius: 15px;
          padding: 1.5rem;
        }
      </style>
    </head>

    <body id="page-top">

      <!-- Page Wrapper -->
      <div id="wrapper">

        <!-- Sidebar -->
        <ul class="navbar-nav bg-gradient-success sidebar sidebar-dark accordion" id="accordionSidebar">

          <!-- Sidebar - Brand -->
          <a class="sidebar-brand d-flex align-items-center justify-content-center"
            href="${pageContext.request.contextPath}/admin">
            <div class="sidebar-brand-icon rotate-n-15">
              <i class="fas fa-user-shield"></i>
            </div>
            <div class="sidebar-brand-text mx-3">Admin Panel</div>
          </a>

          <!-- Divider -->
          <hr class="sidebar-divider my-0">

          <!-- Nav Item - Dashboard -->
          <li class="nav-item active">
            <a class="nav-link" href="${pageContext.request.contextPath}/admin">
              <i class="fas fa-fw fa-tachometer-alt"></i>
              <span>Dashboard</span></a>
          </li>

          <!-- Divider -->
          <hr class="sidebar-divider">

          <!-- Heading -->
          <div class="sidebar-heading">
            System Management
          </div>

          <!-- Nav Item - View Books -->
          <li class="nav-item">
            <a class="nav-link" href="${pageContext.request.contextPath}/admin/books">
              <i class="fas fa-fw fa-book"></i>
              <span>View All Books</span></a>
          </li>

          <!-- Nav Item - View Customers -->
          <li class="nav-item">
            <a class="nav-link" href="${pageContext.request.contextPath}/admin/customers">
              <i class="fas fa-fw fa-users"></i>
              <span>View Customers</span></a>
          </li>

          <!-- Nav Item - View Sellers -->
          <li class="nav-item">
            <a class="nav-link" href="${pageContext.request.contextPath}/admin/sellers">
              <i class="fas fa-fw fa-store"></i>
              <span>View Sellers</span></a>
          </li>

          <!-- Divider -->
          <hr class="sidebar-divider">

          <!-- Heading -->
          <div class="sidebar-heading">
            System
          </div>

          <!-- Nav Item - Back to Customer View -->
          <li class="nav-item">
            <a class="nav-link" href="${pageContext.request.contextPath}/customers">
              <i class="fas fa-fw fa-users"></i>
              <span>Customer View</span></a>
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
            <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top">

              <!-- Sidebar Toggle (Topbar) -->
              <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
                <i class="fa fa-bars"></i>
              </button>

              <!-- Topbar Navbar -->
              <ul class="navbar-nav ml-auto">

                <div class="topbar-divider d-none d-sm-block"></div>

                <!-- Nav Item - User Information -->
                <li class="nav-item dropdown no-arrow">
                  <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button" data-toggle="dropdown"
                    aria-haspopup="true" aria-expanded="false">
                    <span class="mr-2 d-none d-lg-inline text-gray-600 small">Administrator</span>
                    <img class="img-profile rounded-circle"
                      src="https://img.freepik.com/free-vector/blue-circle-with-white-user_78370-4707.jpg?semt=ais_hybrid&w=740&q=80">
                  </a>
                  <!-- Dropdown - User Information -->
                  <div class="dropdown-menu dropdown-menu-right" aria-labelledby="userDropdown">
                    <a class="dropdown-item" href="${pageContext.request.contextPath}/customers">
                      <i class="fas fa-users fa-sm fa-fw mr-2 text-gray-400"></i>
                      Customer View
                    </a>
                    <div class="dropdown-divider"></div>
                    <a class="dropdown-item" href="${pageContext.request.contextPath}/logout">
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
              <h1 class="h3 mb-2 text-gray-800">System Overview</h1>
              <p class="mb-4">Monitor your online book store's performance and manage system resources.</p>

              <!-- System Statistics -->
              <div class="row">
                <!-- Total Books Card -->
                <div class="col-xl-3 col-md-6 mb-4">
                  <div class="card border-left-primary shadow h-100 py-2">
                    <div class="card-body">
                      <div class="row no-gutters align-items-center">
                        <div class="col mr-2">
                          <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">Total Books</div>
                          <div class="h5 mb-0 font-weight-bold text-gray-800">${totalBooks}</div>
                        </div>
                        <div class="col-auto">
                          <i class="fas fa-book fa-2x text-gray-300"></i>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>

                <!-- Total Customers Card -->
                <div class="col-xl-3 col-md-6 mb-4">
                  <div class="card border-left-success shadow h-100 py-2">
                    <div class="card-body">
                      <div class="row no-gutters align-items-center">
                        <div class="col mr-2">
                          <div class="text-xs font-weight-bold text-success text-uppercase mb-1">Total Customers</div>
                          <div class="h5 mb-0 font-weight-bold text-gray-800">${totalCustomers}</div>
                        </div>
                        <div class="col-auto">
                          <i class="fas fa-users fa-2x text-gray-300"></i>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>

                <!-- Total Sellers Card -->
                <div class="col-xl-3 col-md-6 mb-4">
                  <div class="card border-left-info shadow h-100 py-2">
                    <div class="card-body">
                      <div class="row no-gutters align-items-center">
                        <div class="col mr-2">
                          <div class="text-xs font-weight-bold text-info text-uppercase mb-1">Total Sellers</div>
                          <div class="h5 mb-0 font-weight-bold text-gray-800">${totalSellers}</div>
                        </div>
                        <div class="col-auto">
                          <i class="fas fa-store fa-2x text-gray-300"></i>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>

                <!-- System Status Card -->
                <div class="col-xl-3 col-md-6 mb-4">
                  <div class="card border-left-warning shadow h-100 py-2">
                    <div class="card-body">
                      <div class="row no-gutters align-items-center">
                        <div class="col mr-2">
                          <div class="text-xs font-weight-bold text-warning text-uppercase mb-1">System Status</div>
                          <div class="h5 mb-0 font-weight-bold text-gray-800">Online</div>
                        </div>
                        <div class="col-auto">
                          <i class="fas fa-check-circle fa-2x text-gray-300"></i>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>

              <!-- Quick Actions -->
              <div class="row">
                <div class="col-lg-6 mb-4">
                  <div class="card shadow">
                    <div class="card-header py-3">
                      <h6 class="m-0 font-weight-bold text-primary">Quick Actions</h6>
                    </div>
                    <div class="card-body">
                      <div class="list-group list-group-flush">
                        <a href="${pageContext.request.contextPath}/admin/books" class="list-group-item list-group-item-action">
                          <i class="fas fa-book text-primary"></i> View All Books
                        </a>
                        <a href="${pageContext.request.contextPath}/admin/customers" class="list-group-item list-group-item-action">
                          <i class="fas fa-users text-success"></i> Manage Customers
                        </a>
                        <a href="${pageContext.request.contextPath}/admin/sellers" class="list-group-item list-group-item-action">
                          <i class="fas fa-store text-info"></i> Manage Sellers
                        </a>
                      </div>
                    </div>
                  </div>
                </div>

                <div class="col-lg-6 mb-4">
                  <div class="card shadow">
                    <div class="card-header py-3">
                      <h6 class="m-0 font-weight-bold text-primary">System Information</h6>
                    </div>
                    <div class="card-body">
                      <div class="alert alert-info" role="alert">
                        <i class="fas fa-info-circle"></i>
                        <strong>Note:</strong> Books are now managed by individual sellers. 
                        Admins can view all books but cannot add/edit them directly.
                      </div>
                      <div class="alert alert-success" role="alert">
                        <i class="fas fa-shield-alt"></i>
                        <strong>Role-Based Access:</strong> The system now supports Customer and Seller roles 
                        with appropriate permissions.
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <!-- /.container-fluid -->
          </div>
          <!-- End of Main Content -->

        </div>
        <!-- End of Content Wrapper -->

      </div>
      <!-- End of Page Wrapper -->

      <!-- Scroll to Top Button-->
      <a class="scroll-to-top rounded" href="#page-top">
        <i class="fas fa-angle-up"></i>
      </a>

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

      <!-- Custom admin scripts -->
      <script>
        // Sidebar toggle functionality
        $(document).ready(function () {
          $('#sidebarToggle, #sidebarToggleTop').on('click', function (e) {
            $("body").toggleClass("sidebar-toggled");
            $(".sidebar").toggleClass("toggled");
          });
        });
      </script>

    </body>

    </html>