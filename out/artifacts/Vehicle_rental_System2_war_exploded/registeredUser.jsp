<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="ISO-8859-1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registered User</title>

    <link href="https://fonts.googleapis.com/css2?family=Open+Sans&display=swap" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">

    <style>
        body {
            overflow-x: hidden;
            font-family: 'Open Sans', sans-serif;
            background: linear-gradient(135deg, #141E30, #0974f6);
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .dashboard {
            background: rgba(255, 255, 255, 0.1);
            backdrop-filter: blur(10px);
            padding: 40px;
            border-radius: 15px;
            width: 100%;
            max-width: 900px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.2);
        }

        .dashboard h1 {
            margin-bottom: 25px;
            font-weight: 600;
            color: #fff;
        }

        .btn-group {
            display: flex;
            justify-content: space-between;
            margin-top: 20px;
            align-items: center;
        }

        .btn-group .btn {
            margin: 0 15px;
        }

        .footer {
            background-color: #262A2E;
            color: #ffffff;
            padding: 10px 0;
            text-align: center;
            position: fixed;
            bottom: 0;
            width: 100%;
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
            vertical-align: middle;
            padding: 12px 15px;
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
        <div class="col-6"><h1>User Dashboard</h1></div>
        <div class="col-6 text-end">
            <form action="UserServlet">
                <input type="hidden" value="logout" name="task">
                <button type="submit" class="btn btn-danger">Logout</button>
            </form>
        </div>
    </div>

    <div class="card">
        <div class="card-header">
            <h1 class="text-center">User Details</h1>
        </div>
        <div class="card-body">
            <table class="table">
                <c:forEach var="user" items="${sessionScope.userDetails}">
<%--                    <tr>--%>
<%--                        <td>Customer ID</td>--%>
<%--                        <td>${user.id}</td>--%>
<%--                    </tr>--%>
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
        </div>
    </div>

    <div class="btn-group">
        <c:set var="userId" value="${sessionScope.userDetails[0].id}" />
        <c:set var="pass" value="${sessionScope.userDetails[0].password}" />


        <!-- View available vehicles button -->
        <form action="vehicleServelet" method="get">
            <input type="hidden" value="${userId}" name="id">
            <input type="hidden" value="viewAvailableVehicle" name="task">
            <button type="submit" class="btn btn-primary">View Vehicles</button>
        </form>

        <!-- See bookings button -->
        <form action="bookingServlet" method="get">
            <input type="hidden" value="${userId}" name="id">
            <input type="hidden" value="ViewBookings" name="task">
            <button type="submit" class="btn btn-primary">See Bookings</button>
        </form>

        <!-- Change password button -->
        <a href="userChangePw.jsp?id=${userId}&result=a&pw=${pass}" class="btn btn-primary">Change Password</a>

    </div>
</div>

<footer class="footer">
    <span class="text-muted">© 2024 Your Company. All rights reserved.</span>
</footer>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
