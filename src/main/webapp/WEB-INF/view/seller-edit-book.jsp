<!DOCTYPE html>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>Edit Book - Seller Dashboard</title>

  <!-- Bootstrap CSS -->
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
  
  <!-- Font Awesome -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">

  <!-- Custom styles -->
  <link type="text/css" href="${pageContext.request.contextPath}/css/login-register.css" rel="stylesheet">

  <style>
    .form-section {
      background: white;
      padding: 30px;
      border-radius: 15px;
      box-shadow: 0 0 20px rgba(0,0,0,0.1);
      margin-bottom: 30px;
    }
    
    .section-title {
      color: #5a5c69;
      border-bottom: 2px solid #e3e6f0;
      padding-bottom: 10px;
      margin-bottom: 20px;
    }
  </style>
</head>

<body class="bg-light">

  <div class="container mt-5">
    
    <!-- Header -->
    <div class="row mb-4">
      <div class="col-12">
        <div class="d-flex justify-content-between align-items-center">
          <h2><i class="fas fa-edit text-primary"></i> Edit Book</h2>
          <div>
            <a href="${pageContext.request.contextPath}/seller/books" class="btn btn-secondary">
              <i class="fas fa-list"></i> Back to Books
            </a>
            <a href="${pageContext.request.contextPath}/seller" class="btn btn-secondary ml-2">
              <i class="fas fa-dashboard"></i> Dashboard
            </a>
          </div>
        </div>
      </div>
    </div>

    <!-- Edit Book Form -->
    <div class="row">
      <div class="col-12">
        <div class="form-section">
          <h4 class="section-title">
            <i class="fas fa-book"></i> Book Information
          </h4>
          
          <form:form action="${pageContext.request.contextPath}/seller/books/edit" method="POST" modelAttribute="book">
            
            <!-- Hidden field for book ID -->
            <form:hidden path="id" />
            
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
                  <label for="quantity"><strong>Quantity *</strong></label>
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

            <!-- Hidden field for book detail ID -->
            <form:hidden path="bookDetail.id" />

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
                  <form:input type="text" class="form-control" path="bookDetail.publisher" placeholder="Publisher name" />
                </div>
              </div>
            </div>

            <div class="row">
              <div class="col-md-6">
                <div class="form-group">
                  <label for="bookDetail.isbn"><strong>ISBN</strong></label>
                  <form:input type="text" class="form-control" path="bookDetail.isbn" placeholder="ISBN number" />
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
              <label for="bookDetail.description"><strong>Book Description</strong></label>
              <form:textarea class="form-control" path="bookDetail.description" rows="4" 
                           placeholder="Brief description of the book, its content, and target audience"></form:textarea>
            </div>

            <div class="form-group">
              <label for="bookDetail.dimensions"><strong>Dimensions</strong></label>
              <form:input type="text" class="form-control" path="bookDetail.dimensions" 
                        placeholder="e.g., 6 x 9 inches" />
            </div>

            <!-- Action Buttons -->
            <div class="row mt-4">
              <div class="col-12">
                <button type="submit" class="btn btn-primary btn-lg">
                  <i class="fas fa-save"></i> Update Book
                </button>
                <a href="${pageContext.request.contextPath}/seller/books" class="btn btn-secondary btn-lg ml-3">
                  <i class="fas fa-times"></i> Cancel
                </a>
                <a href="${pageContext.request.contextPath}/seller/books/delete?bookId=${book.id}" 
                   class="btn btn-danger btn-lg ml-3"
                   onclick="return confirm('Are you sure you want to delete this book? This action cannot be undone.')">
                  <i class="fas fa-trash"></i> Delete Book
                </a>
              </div>
            </div>

          </form:form>
        </div>
      </div>
    </div>

  </div>

  <!-- Bootstrap and jQuery -->
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>

  <script>
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
        alert('Quantity cannot be negative');
        return false;
      }
      
      if ($('input[name="name"]').val().trim().length < 3) {
        e.preventDefault();
        alert('Book title must be at least 3 characters long');
        return false;
      }
    });
  </script>

</body>
</html>
