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

  <title>My Books - Seller Dashboard</title>

  <!-- Custom fonts for this template -->
  <link href="${pageContext.request.contextPath}/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

  <!-- Custom styles for this template -->
  <link href="${pageContext.request.contextPath}/css/login-register.css" rel="stylesheet">

  <!-- DataTables CSS -->
  <link href="${pageContext.request.contextPath}/vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet" type="text/css">
</head>

<body id="page-top">

  <!-- Page Wrapper -->
  <div id="wrapper">

    <!-- Sidebar -->
    <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

      <!-- Sidebar - Brand -->
      <a class="sidebar-brand d-flex align-items-center justify-content-center" href="${pageContext.request.contextPath}/seller">
        <div class="sidebar-brand-icon rotate-n-15">
          <i class="fas fa-store"></i>
        </div>
        <div class="sidebar-brand-text mx-3">Seller Panel</div>
      </a>

      <!-- Divider -->
      <hr class="sidebar-divider my-0">

      <!-- Nav Item - Dashboard -->
      <li class="nav-item">
        <a class="nav-link" href="${pageContext.request.contextPath}/seller">
          <i class="fas fa-fw fa-tachometer-alt"></i>
          <span>Dashboard</span></a>
      </li>

      <!-- Divider -->
      <hr class="sidebar-divider">

      <!-- Heading -->
      <div class="sidebar-heading">
        Book Management
      </div>

      <!-- Nav Item - View Books -->
      <li class="nav-item active">
        <a class="nav-link" href="${pageContext.request.contextPath}/seller/books">
          <i class="fas fa-fw fa-book"></i>
          <span>My Books</span></a>
      </li>

      <!-- Nav Item - Add New Book -->
      <li class="nav-item">
        <a class="nav-link" href="${pageContext.request.contextPath}/seller/books/add">
          <i class="fas fa-fw fa-plus-circle"></i>
          <span>Add New Book</span></a>
      </li>

      <!-- Divider -->
      <hr class="sidebar-divider">

      <!-- Heading -->
      <div class="sidebar-heading">
        Orders & Sales
      </div>

      <!-- Nav Item - Orders -->
      <li class="nav-item">
        <a class="nav-link" href="${pageContext.request.contextPath}/seller/orders">
          <i class="fas fa-fw fa-shopping-cart"></i>
          <span>Orders</span></a>
      </li>

      <!-- Nav Item - Customers -->
      <li class="nav-item">
        <a class="nav-link" href="${pageContext.request.contextPath}/seller/customers">
          <i class="fas fa-fw fa-users"></i>
          <span>Customers</span></a>
      </li>

      <!-- Divider -->
      <hr class="sidebar-divider">

      <!-- Heading -->
      <div class="sidebar-heading">
        Account
      </div>

      <!-- Nav Item - Profile -->
      <li class="nav-item">
        <a class="nav-link" href="${pageContext.request.contextPath}/seller/profile">
          <i class="fas fa-fw fa-user"></i>
          <span>Profile</span></a>
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

          <!-- Topbar Navbar -->
          <ul class="navbar-nav ml-auto">

            <div class="topbar-divider d-none d-sm-block"></div>

            <!-- Nav Item - User Information -->
            <li class="nav-item dropdown no-arrow">
              <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button" data-toggle="dropdown"
                aria-haspopup="true" aria-expanded="false">
                <span class="mr-2 d-none d-lg-inline text-gray-600 small">${seller.businessName}</span>
                <img class="img-profile rounded-circle"
                  src="https://img.freepik.com/free-vector/blue-circle-with-white-user_78370-4707.jpg?semt=ais_hybrid&w=740&q=80">
              </a>
              <!-- Dropdown - User Information -->
              <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in"
                aria-labelledby="userDropdown">
                <a class="dropdown-item" href="${pageContext.request.contextPath}/seller/profile">
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
          <h1 class="h3 mb-2 text-gray-800">My Books</h1>
          <p class="mb-4">Manage your book inventory, update prices, and track stock levels.</p>

          <!-- Books Management Table -->
          <div class="card shadow mb-4">
            <div class="card-header py-3">
              <div class="d-flex justify-content-between align-items-center">
                <h6 class="m-0 font-weight-bold text-primary">
                  <i class="fas fa-book-open"></i> My Books (${books.size()} total)
                </h6>
                <a href="${pageContext.request.contextPath}/seller/books/add" class="btn btn-success">
                  <i class="fas fa-plus"></i> Add New Book
                </a>
              </div>
            </div>
            <div class="card-body">
              <c:choose>
                <c:when test="${not empty books}">
                  <div class="table-responsive">
                    <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                      <thead>
                        <tr>
                          <th width="5%">Id</th>
                          <th width="25%">Book Name</th>
                          <th width="15%">Author</th>
                          <th width="10%">Category</th>
                          <th width="10%">Quantity</th>
                          <th width="15%">Price</th>
                          <th width="20%">Actions</th>
                        </tr>
                      </thead>
                      <tbody>
                        <c:forEach var="book" items="${books}" varStatus="status">
                          <tr>
                            <td>${status.index + 1}</td>
                            <td>
                              <div class="d-flex align-items-center">
                                <div class="book-thumbnail mr-3">
                                  <c:choose>
                                    <c:when test="${not empty book.imageUrl}">
                                      <img src="${book.imageUrl}" class="rounded" width="50" height="70" alt="${book.name}" 
                                           onerror="this.src='https://via.placeholder.com/50x70/f8f9fa/6c757d?text=No+Image'" style="object-fit: cover;">
                                    </c:when>
                                    <c:otherwise>
                                      <img src="https://via.placeholder.com/50x70/f8f9fa/6c757d?text=Book" class="rounded" width="50" height="70" alt="Default book cover">
                                    </c:otherwise>
                                  </c:choose>
                                </div>
                                <div>
                                  <strong>${book.name}</strong>
                                  <c:if test="${not empty book.bookDetail.description}">
                                    <br><small class="text-muted">
                                      ${book.bookDetail.description.length() > 50 ? 
                                        book.bookDetail.description.substring(0, 50).concat('...') : 
                                        book.bookDetail.description}
                                    </small>
                                  </c:if>
                                </div>
                              </div>
                            </td>
                            <td>${book.bookDetail.author != null ? book.bookDetail.author : 'N/A'}</td>
                            <td><span class="badge badge-info">${book.bookDetail.category != null ? book.bookDetail.category : 'N/A'}</span></td>
                            <td>
                              <span class="badge ${book.quantity > 10 ? 'badge-success' : book.quantity > 0 ? 'badge-warning' : 'badge-danger'}">
                                ${book.quantity} in stock
                              </span>
                            </td>
                            <td><strong>INR <fmt:formatNumber value="${book.price}" pattern="#,##0.00" /></strong></td>
                            <td style="white-space: nowrap; color:green;">
                              <a href="${pageContext.request.contextPath}/seller/books/edit?bookId=${book.id}"
                                class="btn btn-sm btn-primary" title="Edit Book">
                                <i class="fas fa-edit"></i>
                              </a>
                              <button class="btn btn-sm btn-success" onclick="increaseQuantity('${book.id}')" title="Add Stock">
                                <i class="fas fa-plus"></i>
                              </button>
                              <a href="${pageContext.request.contextPath}/seller/books/delete?bookId=${book.id}"
                                class="btn btn-sm btn-danger" title="Delete Book"
                                onclick="return confirm('Are you sure you want to delete this book?')">
                                <i class="fas fa-trash"></i>
                              </a>
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
                    <h4 class="text-muted">No books added yet</h4>
                    <p class="text-muted">Start by adding your first book to your store!</p>
                    <a href="${pageContext.request.contextPath}/seller/books/add" class="btn btn-success btn-lg">
                      <i class="fas fa-plus"></i> Add Your First Book
                    </a>
                  </div>
                </c:otherwise>
              </c:choose>
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

  <script>
    // Sidebar toggle functionality
    $(document).ready(function () {
      $('#sidebarToggle, #sidebarToggleTop').on('click', function (e) {
        $("body").toggleClass("sidebar-toggled");
        $(".sidebar").toggleClass("toggled");
      });

      // Initialize DataTable
      if ($.fn.dataTable.isDataTable('#dataTable')) {
        $('#dataTable').DataTable().destroy();
      }
      $('#dataTable').DataTable({
        "pageLength": 25,
        "stateSave": true,
        "order": [[0, "asc"]],
        "columnDefs": [
          { "orderable": false, "targets": 6 } // Disable sorting on Actions column
        ]
      });
    });

    function increaseQuantity(bookId) {
      var quantity = prompt("How many books would you like to add to inventory?", "1");
      if (quantity != null && quantity > 0) {
        $.post("${pageContext.request.contextPath}/seller/books/increase-quantity", {
          bookId: bookId,
          quantity: quantity
        })
        .done(function(data) {
          alert(data);
          location.reload();
        })
        .fail(function() {
          alert("Error updating quantity. Please try again.");
        });
      }
    }
  </script>

</body>
</html>
