<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <link href="https://fonts.googleapis.com/css2?family=Open+Sans&display=swap" rel="stylesheet">

    <style>
        .dashboard {
            background-color: #262A2E;
            color: #ffffff;
            padding: 20px;
            text-align: center;
        }

        .card {
            margin-top: 20px; /* Add space between header and table */
        }

        .btn-group {
            display: flex;
            justify-content: center;
            margin-top: 20px;
            align-items: center; /* Center items vertically */
        }
        .btn-group .btn {
            margin: 0 10px; /* Add some spacing between buttons */
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

        body {
            overflow-x: hidden; /* Disable horizontal scrolling for the entire website */
        }

        .container .card {
            width: 100%;
        }
    </style>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta charset="ISO-8859-1">
    <title>Registered User</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
</head>
<body>

<c:if test="${param.result == 'booked'}">
    <script type="text/javascript">
        alert('You booked the car!');
    </script>
</c:if>

<div class="dashboard">
    <div class="row">
        <div class="col-6"><h1>Moderator Dashboard</h1></div>
        <div class="col-3"></div>
        <div class="col-3">
            <form action="UserServlet">
                <input type="hidden" value="logout" name="task">
                <button type="submit" class="btn btn-danger">Log Out</button>
            </form>
        </div>
    </div>
</div>

<div class="container">
    <div class="row">
        <div class="col-md-8 offset-md-2">
            <div class="card">
                <div class="card-header">
                    <h1 class="text-center">User Details</h1>
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

<div class="container mt-4">
    <div class="row">
        <div class="col-md-8 offset-md-2">
            <div class="btn-group">
                <c:set var="userId" value="${sessionScope.userDetails[0].id}" />
                <c:set var="pass" value="${sessionScope.userDetails[0].password}" />
                <a href="moderatorAddsNotice.jsp" class="btn btn-primary">Add New Notice</a>
                <form action="noticeServlet" method="get">
                    <input type="hidden" value="viewNotice" name="task">
                    <button type="submit" class="btn btn-primary">View Notices</button>
                </form>
            </div>
        </div>
    </div>
</div>

<footer class="footer">
    <div class="container">
        <span class="text-muted">© 2024 Your Company. All rights reserved.</span>
    </div>
</footer>
</body>
</html>
