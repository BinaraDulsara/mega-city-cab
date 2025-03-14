<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Car Owner</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <style>
        body {
            overflow-x: hidden; /* Hide horizontal scrollbar */
        }
        .dashboard {
            display: flex;
            justify-content: space-between; /* Moves Logout to the right */
            align-items: center;
            padding: 20px 5%;
            background-color: #262A2E;
            color: #ffffff;
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
        .container {
            margin-top: 20px; /* Added spacing */
        }
        .btn-group {
            display: flex;
            justify-content: center;
            margin-top: 20px;
            gap: 15px; /* Space between buttons */
        }
    </style>
</head>
<body>


<div class="dashboard d-flex justify-content-between align-items-center px-4">
    <h1>Vehicle Owner Dashboard</h1>
    <form action="UserServlet">
        <input type="hidden" value="logout" name="task">
        <button type="submit" class="btn btn-danger">Logout</button>
    </form>
</div>
<div class="container">
    <div class="row">
        <div class="col-md-8 offset-md-2">
            <div class="card">
                <div class="card-header">
                    <h1 class="text-center">Owner Options</h1>
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
                </div>
            </div>
        </div>
    </div>
</div>
<c:set var="userId" value="${sessionScope.userDetails[0].id}" />

<div class="container">
    <div class="btn-group">
        <div class="col-4">
            <a href="addVehicle.jsp?id=${userId}&result=a" class="btn btn-primary w-100">Add a new Vehicle</a>
        </div>
        <form action="viewRegistrations" method="get">
            <input type="hidden" value="${userId}" name="id">
            <input type="hidden" value="ViewRegistrations" name="task">
            <button type="submit" class="btn btn-primary">See Registrations</button>
        </form>
        <form action="vehicleServelet" method="get">
            <input type="hidden" value="${userId}" name="id">
            <input type="hidden" value="viewVehicleUser" name="task">
            <button type="submit" class="btn btn-primary">View Vehicles</button>
        </form>
    </div>
</div>

<footer class="footer">
    <div class="container">
        <span class="text-muted">© 2024 Your Company. All rights reserved.</span>
    </div>
</footer>

</body>
</html>
