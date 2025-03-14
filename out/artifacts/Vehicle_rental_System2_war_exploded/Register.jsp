<!DOCTYPE html>
<html lang="en">
<head>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registration</title>
    <style>
        body {
            background: linear-gradient(135deg, #141E30, #0974f6);
            height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            font-family: 'Poppins', sans-serif;
        }
        .register-container {
            background: rgba(255, 255, 255, 0.1);
            backdrop-filter: blur(10px);
            border-radius: 15px;
            padding: 40px;
            width: 100%;
            max-width: 400px;
            text-align: center;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.2);
            color: #fff;
        }
        .register-container h2 {
            margin-bottom: 20px;
            font-weight: 600;
        }
        .form-group {
            text-align: left;
            margin-bottom: 15px;
        }
        .form-control {
            border-radius: 8px;
            padding: 12px;
            border: none;
            background: rgba(255, 255, 255, 0.2);
            color: #fff;
        }
        .form-control::placeholder {
            color: #ddd;
        }
        .btn-primary, .btn-danger {
            border-radius: 8px;
            padding: 12px;
            width: 100%;
            margin-top: 10px;
            border: none;
            transition: 0.3s;
        }
        .btn-primary {
            background: #4CAF50;
        }
        .btn-primary:hover {
            background: #45A049;
        }
        .btn-danger {
            background: #d9534f;
        }
        .btn-danger:hover {
            background: #c9302c;
        }
    </style>
</head>
<body>
<div class="register-container">
    <h2>Register</h2>
    <form action="UserServlet" method="post">
        <div class="form-group">
            <label for="name">Name</label>
            <input type="text" class="form-control" id="name" placeholder="Enter name" name="name" required>
        </div>
        <div class="form-group">
            <label for="password">Password</label>
            <input type="password" class="form-control" id="password" placeholder="Enter password" name="password" required>
        </div>
        <div class="form-group">
            <label for="gmail">Gmail</label>
            <input type="email" class="form-control" id="gmail" placeholder="Enter Gmail" name="gmail" required>
        </div>
        <div class="form-group">
            <label for="phoneNumber">Phone Number</label>
            <input type="text" class="form-control" id="phoneNumber" placeholder="Enter phone number" name="phoneNumber" required>
        </div>
        <div class="form-group">
            <label>Role</label><br>
            <input type="radio" id="userRole" name="role" value="user" checked>
            <label for="userRole">User</label><br>
            <input type="radio" id="carOwnerRole" name="role" value="carOwner">
            <label for="carOwnerRole">Car Owner</label>
        </div>
        <button type="submit" class="btn btn-primary">Register</button>
        <a href="index.jsp" class="btn btn-danger">Back</a>
    </form>
</div>

<!-- Bootstrap JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
