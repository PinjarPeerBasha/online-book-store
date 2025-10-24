<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  
  <title>500 - Internal Server Error | Online Book Store</title>

  <!-- Custom fonts -->
  <link href="${pageContext.request.contextPath}/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

  <!-- Custom styles -->
  <link href="${pageContext.request.contextPath}/css/login-register.css" rel="stylesheet">
</head>

<body class="bg-gradient-danger">

  <div class="container">

    <!-- 500 Error Text -->
    <div class="text-center" style="margin-top: 100px;">
      <div class="error mx-auto" data-text="500" style="font-size: 7rem; color: rgba(255,255,255,0.2); position: relative;">
        <p class="m-0" style="font-weight: 700; font-size: 7rem; color: white; text-shadow: 2px 2px 4px rgba(0,0,0,0.3);">500</p>
      </div>
      <p class="lead text-white mb-5" style="font-size: 2rem; font-weight: 600;">Internal Server Error</p>
      <p class="text-white mb-5" style="font-size: 1.2rem;">
        <i class="fas fa-exclamation-circle"></i> 
        Something went wrong on our end. We're working to fix it!
      </p>
      
      <div class="row justify-content-center">
        <div class="col-lg-6">
          <div class="card shadow-lg border-0">
            <div class="card-body p-5 text-center">
              <div class="mb-4">
                <i class="fas fa-tools fa-4x text-danger mb-3"></i>
                <h5 class="text-gray-900">We're sorry for the inconvenience</h5>
                <p class="text-muted">Our team has been notified and is working on a fix.</p>
              </div>
              
              <div class="d-grid gap-2">
                <a href="${pageContext.request.contextPath}/" class="btn btn-primary btn-lg mb-3">
                  <i class="fas fa-home"></i> Go to Homepage
                </a>
                <a href="${pageContext.request.contextPath}/books" class="btn btn-success btn-lg mb-3">
                  <i class="fas fa-book"></i> Browse Books
                </a>
                <button onclick="location.reload()" class="btn btn-warning btn-lg mb-3">
                  <i class="fas fa-redo"></i> Try Again
                </button>
                <button onclick="history.back()" class="btn btn-secondary btn-lg">
                  <i class="fas fa-arrow-left"></i> Go Back
                </button>
              </div>
              
              <div class="mt-4 pt-4 border-top">
                <p class="small text-muted mb-2">
                  <strong>Error Code:</strong> 500
                </p>
                <p class="small text-muted mb-0">
                  <i class="fas fa-envelope"></i> 
                  If this persists, please <a href="${pageContext.request.contextPath}/contact">contact support</a>
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
