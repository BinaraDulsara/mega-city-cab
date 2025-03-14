<!DOCTYPE html>
<html lang="en">
<head>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Change Password</title>
    <style>
        body {
            background: linear-gradient(135deg, #141E30, #0974f6);
            height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            font-family: 'Poppins', sans-serif;
        }
        .login-container {
            background: rgba(255, 255, 255, 0.1);
            backdrop-filter: blur(10px);
            border-radius: 15px;
            padding: 40px;
            width: 100%;
            max-width: 380px;
            text-align: center;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.2);
            color: #fff;
        }
        .login-container h2 {
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
        .forgot-password {
            display: block;
            margin-top: 10px;
            font-size: 14px;
            color: #ccc;
            text-decoration: none;
            transition: 0.3s;
        }
        .forgot-password:hover {
            color: #fff;
        }
    </style>
</head>
<body>
<div class="login-container">
    <h2>Change Password</h2>
    <form action="change-password" method="post">
        <div class="form-group">
            <label for="current-password">Current Password</label>
            <input type="password" class="form-control" id="current-password" placeholder="Enter current password" name="current-password" required>
        </div>
        <div class="form-group">
            <label for="new-password">New Password</label>
            <input type="password" class="form-control" id="new-password" placeholder="Enter new password" name="new-password" required>
        </div>
        <div class="form-group">
            <label for="confirm-password">Confirm New Password</label>
            <input type="password" class="form-control" id="confirm-password" placeholder="Confirm new password" name="confirm-password" required>
        </div>
        <button type="submit" class="btn btn-primary">Change Password</button>
        <a href="registeredUser.jsp" class="btn btn-danger">Back</a>
    </form>
</div>

<!-- Bootstrap JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
