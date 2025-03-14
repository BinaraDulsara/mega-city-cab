<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>RentACar - Home</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    <style>
        body {
            background: linear-gradient(135deg, #141E30, #0974f6);
            font-family: 'Poppins', sans-serif;
            color: white;
        }
        .navbar {
            background: rgba(0, 0, 0, 0.7) !important;
        }
        .hero-section {
            height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            text-align: center;
            padding: 20px;
        }
        .hero-content {
            background: rgba(255, 255, 255, 0.1);
            backdrop-filter: blur(10px);
            padding: 40px;
            border-radius: 15px;
            max-width: 600px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.2);
        }
        .hero-content h1 {
            font-size: 2.5rem;
            font-weight: 600;
        }
        .btn-primary, .btn-outline-light {
            border-radius: 8px;
            padding: 12px 24px;
            margin-top: 15px;
        }
    </style>
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-dark">
    <div class="container">
        <a class="navbar-brand" href="#">RentACar</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav me-auto">
                <!-- Home and Vehicles links removed -->
            </ul>
            <a class="btn btn-outline-light me-2" href="login.jsp">Login</a>
            <a class="btn btn-primary" href="Register.jsp">Register</a>
        </div>
    </div>
</nav>

<section class="hero-section">
    <div class="hero-content">
        <h1>Find the Best Rental Cars for Your Journey</h1>
        <p>Rent a car with ease and explore your destination hassle-free.</p>
        <a href="vehicles.jsp" class="btn btn-primary">Browse Vehicles</a>
        <a href="Register.jsp" class="btn btn-outline-light">Get Started</a>
    </div>
</section>
</body>
</html>
