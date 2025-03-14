<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background: linear-gradient(135deg, #141E30, #0974f6);
            height: 100vh;
            font-family: 'Poppins', sans-serif;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .dashboard {
            background: rgba(255, 255, 255, 0.1);
            backdrop-filter: blur(10px);
            border-radius: 15px;
            padding: 40px;
            width: 100%;
            max-width: 900px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.2);
        }

        .dashboard h1 {
            margin-bottom: 25px;
            font-weight: 600;
            color: #fff;
        }

        .card {
            background: rgba(255, 255, 255, 0.1);
            border-radius: 10px;
            border: none;
            margin-bottom: 30px;
        }

        .card-header {
            background-color: #262A2E;
            color: #fff;
            border-radius: 10px 10px 0 0;
            font-size: 1.5rem;
        }

        .card-body {
            color: #fff;
            font-size: 1.1rem;
        }

        .table th, .table td {
            text-align: left;
            padding: 12px 15px;
        }

        .btn-custom {
            background-color: #262A2E;
            color: #fff;
            border-radius: 8px;
            padding: 12px;
            width: 100%;
            border: none;
            transition: 0.3s;
        }

        .btn-custom:hover {
            background-color: #4CAF50;
        }

        .btn-danger {
            background-color: #d9534f;
            border-radius: 8px;
            padding: 12px;
            width: 100%;
            margin-top: 10px;
        }

        .btn-danger:hover {
            background-color: #c9302c;
        }

        /* Mobile Responsive */
        @media (max-width: 767px) {
            .dashboard {
                padding: 20px;
            }

            .card {
                margin-bottom: 20px;
            }

            .btn-custom {
                font-size: 0.9rem;
            }
        }
    </style>
</head>
<body>

<div class="dashboard">
    <div class="row mb-3">
        <div class="col-6"><h1>Admin Dashboard</h1></div>
        <div class="col-6 text-end">
            <form action="UserServlet">
                <input type="hidden" value="logout" name="task">
                <button type="submit" class="btn btn-danger">Logout</button>
            </form>
        </div>
    </div>

    <div class="card">
        <div class="card-header">
            <h1>Admin Portal</h1>
        </div>
        <div class="card-body">
            <table class="table">
                <c:forEach var="user" items="${sessionScope.userDetails}">
                    <tr>
                        <td>Customer ID</td>
                        <td>${user.id}</td>
                    </tr>
                    <tr>
                        <td>Customer Name</td>
                        <td>${user.name}</td>
                    </tr>
                    <tr>
                        <td>Customer Email</td>
                        <td>${user.gmail}</td>
                    </tr>
                    <tr>
                        <td>Customer Phone</td>
                        <td>${user.phoneNumber}</td>
                    </tr>
                </c:forEach>
            </table>
            <div class="row">
                <div class="col-6">
                    <form action="UserServlet" method="get">
                        <input type="hidden" value="ViewUsers" name="task">
                        <button type="submit" class="btn btn-custom">View Users</button>
                    </form>
                </div>
                <div class="col-6">
                    <form action="applicationServlet" method="get">
                        <input type="hidden" value="ViewApplications" name="task">
                        <button type="submit" class="btn btn-custom">View Vehicle Applications</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
