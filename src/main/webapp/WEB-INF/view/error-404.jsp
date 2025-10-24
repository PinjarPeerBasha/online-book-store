<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  
  <title>404 - Page Not Found | Online Book Store</title>

  <!-- Custom fonts -->
  <link href="${pageContext.request.contextPath}/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

  <!-- Custom styles -->
  <link href="${pageContext.request.contextPath}/css/login-register.css" rel="stylesheet">
</head>

<body class="bg-gradient-primary">

  <div class="container">

    <!-- 404 Error Text -->
    <div class="text-center" style="margin-top: 100px;">
      <div class="error mx-auto" data-text="404" style="font-size: 7rem; color: rgba(255,255,255,0.2); position: relative;">
        <p class="m-0" style="font-weight: 700; font-size: 7rem; color: white; text-shadow: 2px 2px 4px rgba(0,0,0,0.3);">404</p>
      </div>
      <p class="lead text-white mb-5" style="font-size: 2rem; font-weight: 600;">Page Not Found</p>
      <p class="text-white mb-5" style="font-size: 1.2rem;">
        <i class="fas fa-exclamation-triangle"></i> 
        Oops! The page you're looking for doesn't exist.
      </p>
      
      <div class="row justify-content-center">
        <div class="col-lg-6">
          <div class="card shadow-lg border-0">
            <div class="card-body p-5 text-center">
              <div class="mb-4">
                <i class="fas fa-book-reader fa-4x text-primary mb-3"></i>
                <h5 class="text-gray-900">What would you like to do?</h5>
              </div>
              
              <div class="d-grid gap-2">
                <a href="${pageContext.request.contextPath}/" class="btn btn-primary btn-lg mb-3">
                  <i class="fas fa-home"></i> Go to Homepage
                </a>
                <a href="${pageContext.request.contextPath}/books" class="btn btn-success btn-lg mb-3">
                  <i class="fas fa-book"></i> Browse Books
                </a>
                <a href="${pageContext.request.contextPath}/login" class="btn btn-info btn-lg mb-3">
                  <i class="fas fa-sign-in-alt"></i> Login
                </a>
                <button onclick="history.back()" class="btn btn-secondary btn-lg">
                  <i class="fas fa-arrow-left"></i> Go Back
                </button>
              </div>
              
              <div class="mt-4 pt-4 border-top">
                <p class="small text-muted mb-0">
                  <i class="fas fa-question-circle"></i> 
                  Need help? <a href="${pageContext.request.contextPath}/contact">Contact Support</a>
                </p>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>

  </div>

  <!-- Bootstrap core JavaScript-->
  <script src="${pageContext.request.contextPath}/vendor/jquery/jquery.min.js"></script>
  <script src="${pageContext.request.contextPath}/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  <script>
    // Add animation
    $(document).ready(function() {
      $('.card').hide().fadeIn(800);
    });
  </script>

</body>

</html>
