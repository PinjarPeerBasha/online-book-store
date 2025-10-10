<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>Add New Book - Seller Dashboard</title>

  <!-- Custom fonts for this template -->
  <link href="${pageContext.request.contextPath}/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

  <!-- Custom styles for this template -->
  <link href="${pageContext.request.contextPath}/css/login-register.css" rel="stylesheet">
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
      <li class="nav-item">
        <a class="nav-link" href="${pageContext.request.contextPath}/seller/books">
          <i class="fas fa-fw fa-book"></i>
          <span>My Books</span></a>
      </li>

      <!-- Nav Item - Add New Book -->
      <li class="nav-item active">
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
                <span class="mr-2 d-none d-lg-inline text-gray-600 small">Seller Panel</span>
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
          <h1 class="h3 mb-2 text-gray-800">Add New Book</h1>
          <p class="mb-4">Add a new book to your inventory. Fill in all the details to create a complete book listing.</p>

          <!-- Add Book Form -->
          <div class="card shadow mb-4">
            <div class="card-header py-3">
              <h6 class="m-0 font-weight-bold text-primary">
                <i class="fas fa-plus-circle"></i> Add New Book
              </h6>
            </div>
            <div class="card-body">
              <form:form action="${pageContext.request.contextPath}/seller/books/add" method="POST" modelAttribute="book">
            
            <!-- Basic Book Info -->
            <div class="row">
              <div class="col-md-6">
                <div class="form-group">
                  <label for="name"><strong>Book Title *</strong></label>
                  <form:input type="text" class="form-control" path="name" placeholder="Enter book title" required="true" />
                </div>
              </div>
              <div class="col-md-6">
                <div class="form-group">
                  <label for="price"><strong>Price *</strong></label>
                  <div class="input-group">
                    <div class="input-group-prepend">
                      <span class="input-group-text">INR</span>
                    </div>
                    <form:input type="number" step="0.01" class="form-control" path="price" placeholder="0.00" required="true" />
                  </div>
                </div>
              </div>
            </div>

            <div class="row">
              <div class="col-md-6">
                <div class="form-group">
                  <label for="quantity"><strong>Initial Quantity *</strong></label>
                  <form:input type="number" class="form-control" path="quantity" placeholder="Number of books in stock" required="true" />
                </div>
              </div>
              <div class="col-md-6">
                <div class="form-group">
                  <label for="bookDetail.category"><strong>Category *</strong></label>
                  <form:select class="form-control" path="bookDetail.category" required="true">
                    <form:option value="">Select Category</form:option>
                    <form:option value="Fiction">Fiction</form:option>
                    <form:option value="Non-Fiction">Non-Fiction</form:option>
                    <form:option value="Science">Science</form:option>
                    <form:option value="Technology">Technology</form:option>
                    <form:option value="History">History</form:option>
                    <form:option value="Biography">Biography</form:option>
                    <form:option value="Romance">Romance</form:option>
                    <form:option value="Mystery">Mystery</form:option>
                    <form:option value="Fantasy">Fantasy</form:option>
                    <form:option value="Education">Education</form:option>
                    <form:option value="Self-Help">Self-Help</form:option>
                    <form:option value="Other">Other</form:option>
                  </form:select>
                </div>
              </div>
            </div>

            <!-- Book Details -->
            <h5 class="mt-4 mb-3">
              <i class="fas fa-info-circle"></i> Additional Details
            </h5>

            <div class="row">
              <div class="col-md-6">
                <div class="form-group">
                  <label for="bookDetail.author"><strong>Author *</strong></label>
                  <form:input type="text" class="form-control" path="bookDetail.author" placeholder="Author name" maxlength="255" required="true" />
                </div>
              </div>
              <div class="col-md-6">
                <div class="form-group">
                  <label for="bookDetail.publisher"><strong>Publisher</strong></label>
                  <form:input type="text" class="form-control" path="bookDetail.publisher" placeholder="Publisher name" maxlength="255" />
                </div>
              </div>
            </div>

            <div class="row">
              <div class="col-md-6">
                <div class="form-group">
                  <label for="bookDetail.isbn"><strong>ISBN</strong></label>
                  <form:input type="text" class="form-control" path="bookDetail.isbn" placeholder="ISBN number" maxlength="50" />
                </div>
              </div>
              <div class="col-md-6">
                <div class="form-group">
                  <label for="bookDetail.pages"><strong>Number of Pages</strong></label>
                  <form:input type="number" class="form-control" path="bookDetail.pages" placeholder="Total pages" />
                </div>
              </div>
            </div>

            <div class="form-group">
              <label for="bookDetail.description"><strong>Book Description</strong> <small class="text-muted">(Max 1000 characters)</small></label>
              <form:textarea class="form-control" path="bookDetail.description" rows="4" maxlength="1000"
                           placeholder="Brief description of the book, its content, and target audience"></form:textarea>
              <small class="form-text text-muted">
                <span id="descriptionCount">0</span>/1000 characters
              </small>
            </div>

            <div class="form-group">
              <label for="bookDetail.dimensions"><strong>Dimensions</strong></label>
              <form:input type="text" class="form-control" path="bookDetail.dimensions" maxlength="100"
                        placeholder="e.g., 6 x 9 inches" />
            </div>

            <!-- Action Buttons -->
            <div class="row mt-4">
              <div class="col-12">
                <button type="submit" class="btn btn-success btn-lg">
                  <i class="fas fa-save"></i> Add Book to Store
                </button>
                <a href="${pageContext.request.contextPath}/seller" class="btn btn-secondary btn-lg ml-3">
                  <i class="fas fa-times"></i> Cancel
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
            <span aria-hidden="true">×</span>
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

  <script>
    // Sidebar toggle functionality
    $(document).ready(function () {
      $('#sidebarToggle, #sidebarToggleTop').on('click', function (e) {
        $("body").toggleClass("sidebar-toggled");
        $(".sidebar").toggleClass("toggled");
      });

      // Character counter for description
      $('textarea[name="bookDetail.description"]').on('input', function() {
        var length = $(this).val().length;
        $('#descriptionCount').text(length);
        
        if (length > 900) {
          $('#descriptionCount').parent().removeClass('text-muted').addClass('text-warning');
        } else if (length > 950) {
          $('#descriptionCount').parent().removeClass('text-warning').addClass('text-danger');
        } else {
          $('#descriptionCount').parent().removeClass('text-warning text-danger').addClass('text-muted');
        }
      });
    });

    // Form validation
    $('form').on('submit', function(e) {
      var price = parseFloat($('input[name="price"]').val());
      var quantity = parseInt($('input[name="quantity"]').val());
      
      if (price <= 0) {
        e.preventDefault();
        alert('Please enter a valid price greater than 0');
        return false;
      }
      
      if (quantity < 0) {
        e.preventDefault();
        alert('Please enter a valid quantity (0 or more)');
        return false;
      }
      
      // Validate book title
      if ($('input[name="name"]').val().trim().length < 3) {
        e.preventDefault();
        alert('Book title must be at least 3 characters long');
        return false;
      }
    });
  </script>

</body>
</html>
