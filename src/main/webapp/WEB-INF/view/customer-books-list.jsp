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
                  <h1 class="h3 mb-2 text-gray-800">Available Books</h1>

                  <!-- DataTales Example -->
                  <div class="card shadow mb-4">
                    <div class="card-header py-3">
                      <h6 class="m-0 font-weight-bold text-primary">Book List</h6>
                    </div>
                    <c:if test="${message != null}">
                      <div class="card-header py-3">
                        <h6 class="m-0 font-weight-bold text-primary">
                          <c:out value="${message}"></c:out>
                        </h6>
                      </div>
                    </c:if>
                    <div class="card-body">
                      <!-- Search and Filter Controls -->
                      <div class="row mb-4">
                        <div class="col-md-6">
                          <div class="input-group">
                            <input type="text" id="searchBooks" class="form-control" placeholder="Search books...">
                            <div class="input-group-append">
                              <button class="btn btn-outline-primary" type="button">
                                <i class="fas fa-search"></i>
                              </button>
                            </div>
                          </div>
                        </div>
                        <div class="col-md-3">
                          <select id="categoryFilter" class="form-control">
                            <option value="">All Categories</option>
                            <option value="Fiction">Fiction</option>
                            <option value="Non-Fiction">Non-Fiction</option>
                            <option value="Science">Science</option>
                            <option value="Technology">Technology</option>
                            <option value="History">History</option>
                            <option value="Biography">Biography</option>
                            <option value="Romance">Romance</option>
                            <option value="Mystery">Mystery</option>
                            <option value="Fantasy">Fantasy</option>
                            <option value="Education">Education</option>
                            <option value="Self-Help">Self-Help</option>
                            <option value="Other">Other</option>
                          </select>
                        </div>
                        <div class="col-md-3">
                          <select id="sortBy" class="form-control">
                            <option value="name">Sort by Name</option>
                            <option value="price-low">Price: Low to High</option>
                            <option value="price-high">Price: High to Low</option>
                            <option value="category">Category</option>
                          </select>
                        </div>
                      </div>

                      <!-- Books Grid -->
                      <div class="row" id="booksContainer">
                        <c:forEach var="book" items="${books}">
                          <!--URL for the add to cart option  -->
                          <c:url var="addToCartLink" value="/customers/cart/add">
                            <c:param name="bookId" value="${book.id}" />
                          </c:url>
                          <c:url var="removeFromCartLink" value="/customers/cart/remove">
                            <c:param name="bookId" value="${book.id}" />
                          </c:url>
                          
                          <div class="col-lg-3 col-md-4 col-sm-6 mb-4 book-item" 
                               data-name="${book.name}" 
                               data-book-id="${book.id}"
                               data-category="${book.bookDetail.category != null ? book.bookDetail.category : 'N/A'}"
                               data-price="${book.price}">
                            <div class="card book-card h-100 shadow-sm">
                              <!-- Book Image -->
                              <div class="book-image-container">
                                <c:choose>
                                  <c:when test="${not empty book.imageUrl}">
                                    <img src="${book.imageUrl}" class="card-img-top book-image" alt="${book.name}" onerror="this.src='https://via.placeholder.com/300x400/f8f9fa/6c757d?text=No+Image'">
                                  </c:when>
                                  <c:otherwise>
                                    <img src="https://via.placeholder.com/300x400/f8f9fa/6c757d?text=Book+Cover" class="card-img-top book-image" alt="Default book cover">
                                  </c:otherwise>
                                </c:choose>
                                <!-- Stock Badge -->
                                <c:if test="${book.quantity == 0}">
                                  <span class="badge badge-danger stock-badge">Out of Stock</span>
                                </c:if>
                                <c:if test="${book.quantity > 0 && book.quantity <= 5}">
                                  <span class="badge badge-warning stock-badge">Low Stock</span>
                                </c:if>
                              </div>
                              
                              <!-- Book Details -->
                              <div class="card-body d-flex flex-column">
                                <h6 class="card-title book-title">${book.name}</h6>
                                <p class="card-text text-muted small mb-2">
                                  <i class="fas fa-tag"></i> ${book.bookDetail.category != null ? book.bookDetail.category : 'N/A'}
                                </p>
                                <p class="card-text text-muted small mb-2">
                                  <i class="fas fa-user"></i> ${book.bookDetail.author != null ? book.bookDetail.author : 'Unknown'}
                                </p>
                                <c:if test="${not empty book.bookDetail.description}">
                                  <p class="card-text book-description small text-muted">
                                    ${book.bookDetail.description.length() > 80 ? 
                                      book.bookDetail.description.substring(0, 80).concat('...') : 
                                      book.bookDetail.description}
                                  </p>
                                </c:if>
                                
                                <!-- Price and Stock -->
                                <div class="mt-auto">
                                  <div class="d-flex justify-content-between align-items-center mb-3">
                                    <h5 class="text-success mb-0">
                                      <strong>INR ${book.price}</strong>
                                    </h5>
                                    <small class="text-muted">
                                      <i class="fas fa-boxes"></i> ${book.quantity} available
                                    </small>
                                  </div>
                                  
                                  <!-- Action Button -->
                                  <!--Check if the item is already added to cart or not!  -->
                                  <c:set var="contains" value="false" />
                                  <c:forEach var="item" items="${shoppingItems}">
                                    <c:if test="${item.book.id eq book.id}">
                                      <c:set var="contains" value="true" />
                                    </c:if>
                                  </c:forEach>
                                  
                                  <c:choose>
                                    <c:when test="${book.quantity == 0}">
                                      <button class="btn btn-secondary btn-block" disabled>
                                        <i class="fas fa-times"></i> Out of Stock
                                      </button>
                                    </c:when>
                                    <c:when test="${contains != true}">
                                      <a href="${addToCartLink}" class="btn btn-success btn-block add-to-cart-btn" data-book-name="${book.name}">
                                        <i class="fas fa-cart-plus"></i> Add to Cart
                                      </a>
                                    </c:when>
                                    <c:otherwise>
                                      <a href="${removeFromCartLink}" class="btn btn-danger btn-block remove-from-cart-btn" data-book-name="${book.name}">
                                        <i class="fas fa-trash"></i> Remove from Cart
                                      </a>
                                    </c:otherwise>
                                  </c:choose>
                                </div>
                              </div>
                            </div>
                          </div>
                        </c:forEach>
                      </div>
                      
                      <!-- No Books Message -->
                      <c:if test="${empty books}">
                        <div class="text-center py-5">
                          <i class="fas fa-book fa-4x text-muted mb-3"></i>
                          <h4 class="text-muted">No books available</h4>
                          <p class="text-muted">Check back later for new arrivals!</p>
                        </div>
                      </c:if>
                    </div>
                  </div>
                  
                  <!-- Proceed to Cart Message -->
                  <c:if test="${message != null}">
                    <div class="alert alert-success alert-dismissible fade show mt-3" role="alert">
                      <i class="fas fa-check-circle"></i> ${message}
                      <a href="${pageContext.request.contextPath}/customers/cart" class="btn btn-success btn-sm ml-3">
                        <i class="fas fa-shopping-cart"></i> View Cart
                      </a>
                      <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                      </button>
                    </div>
                  </c:if>
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

          <!-- Book Grid Custom Styles and Scripts -->
          <style>
            .book-card {
              transition: transform 0.3s ease, box-shadow 0.3s ease;
              cursor: pointer;
              border: none;
              overflow: hidden;
            }
            
            .book-card:hover {
              transform: translateY(-5px);
              box-shadow: 0 10px 25px rgba(0,0,0,0.15) !important;
            }
            
            .book-image-container {
              position: relative;
              height: 200px;
              overflow: hidden;
            }
            
            .book-image {
              height: 100%;
              object-fit: cover;
              transition: transform 0.3s ease;
            }
            
            .book-card:hover .book-image {
              transform: scale(1.05);
            }
            
            .stock-badge {
              position: absolute;
              top: 10px;
              right: 10px;
              z-index: 10;
            }
            
            .book-title {
              font-weight: 600;
              color: #2c3e50;
              height: 2.4em;
              overflow: hidden;
              display: -webkit-box;
              -webkit-line-clamp: 2;
              -webkit-box-orient: vertical;
            }
            
            .book-description {
              height: 3em;
              overflow: hidden;
              display: -webkit-box;
              -webkit-line-clamp: 2;
              -webkit-box-orient: vertical;
            }
            
            .search-highlight {
              background-color: #fff3cd;
              padding: 2px 4px;
              border-radius: 3px;
            }
            
            @media (max-width: 768px) {
              .book-image-container {
                height: 180px;
              }
            }
          </style>

          <script>
            $(document).ready(function() {
            // Show message from server as toast
            <c:if test="${message != null}">
              Toast.success('${message}');
            </c:if>
            
            // Handle add to cart with toast
            $('.add-to-cart-btn').on('click', function(e) {
              const bookName = $(this).data('book-name');
              setTimeout(function() {
                Toast.success('Book: "' + bookName + '" added to cart!');
              }, 100);
            });
            
            // Handle remove from cart with toast
            $('.remove-from-cart-btn').on('click', function(e) {
              const bookName = $(this).data('book-name');
              setTimeout(function() {
                Toast.warning('Book: "' + bookName + '" removed from cart!');
              }, 100);
            });
              // Search functionality
              $('#searchBooks').on('keyup', function() {
                var searchTerm = $(this).val().toLowerCase();
                filterBooks();
              });
              
              // Category filter
              $('#categoryFilter').on('change', function() {
                filterBooks();
              });
              
              // Sort functionality
              $('#sortBy').on('change', function() {
                sortBooks();
              });
              
              function filterBooks() {
                var searchTerm = $('#searchBooks').val().toLowerCase();
                var selectedCategory = $('#categoryFilter').val();
                
                $('.book-item').each(function() {
                  var bookName = $(this).data('name').toLowerCase();
                  var bookCategory = $(this).data('category');
                  
                  var matchesSearch = bookName.includes(searchTerm);
                  var matchesCategory = selectedCategory === '' || bookCategory === selectedCategory;
                  
                  if (matchesSearch && matchesCategory) {
                    $(this).show();
                    // Highlight search terms
                    if (searchTerm) {
                      var titleElement = $(this).find('.book-title');
                      var originalText = titleElement.text();
                      var highlightedText = originalText.replace(new RegExp(searchTerm, 'gi'), '<span class="search-highlight">$&</span>');
                      titleElement.html(highlightedText);
                    }
                  } else {
                    $(this).hide();
                  }
                });
                
                // Show no results message
                var visibleBooks = $('.book-item:visible').length;
                if (visibleBooks === 0) {
                  if ($('#noResultsMessage').length === 0) {
                    $('#booksContainer').append(
                      '<div id="noResultsMessage" class="col-12 text-center py-5">' +
                      '<i class="fas fa-search fa-4x text-muted mb-3"></i>' +
                      '<h4 class="text-muted">No books found</h4>' +
                      '<p class="text-muted">Try adjusting your search or filter criteria</p>' +
                      '</div>'
                    );
                  }
                } else {
                  $('#noResultsMessage').remove();
                }
              }
              
              function sortBooks() {
                var sortBy = $('#sortBy').val();
                var booksContainer = $('#booksContainer');
                var books = $('.book-item').detach();
                
                books.sort(function(a, b) {
                  switch(sortBy) {
                    case 'name':
                      return $(a).data('name').localeCompare($(b).data('name'));
                    case 'price-low':
                      return parseFloat($(a).data('price')) - parseFloat($(b).data('price'));
                    case 'price-high':
                      return parseFloat($(b).data('price')) - parseFloat($(a).data('price'));
                    case 'category':
                      return $(a).data('category').localeCompare($(b).data('category'));
                    default:
                      return 0;
                  }
                });
                
                booksContainer.append(books);
              }
              
              // Image error handling
              $('.book-image').on('error', function() {
                $(this).attr('src', 'https://via.placeholder.com/300x400/f8f9fa/6c757d?text=No+Image');
              });
              
              // Add click animation to buttons
              $('.btn').on('click', function() {
                $(this).addClass('animate__animated animate__pulse');
                setTimeout(() => {
                  $(this).removeClass('animate__animated animate__pulse');
                }, 1000);
              });
            });
          </script>

        </body>

        </html>