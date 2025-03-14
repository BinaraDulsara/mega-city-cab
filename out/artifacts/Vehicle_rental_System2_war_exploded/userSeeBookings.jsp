<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Bookings</title>
    <!-- Bootstrap CSS link -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f4f6f9;
            font-family: 'Open Sans', sans-serif;
        }

        .dashboard {
            padding-top: 10vh;
            padding-left: 5%;
            padding-bottom: 8vh;
            background-color: #262A2E; /* Dark background color */
            color: #ffffff; /* White text color */
            margin-bottom: 5%;
            text-align: center;
        }

        h1 {
            font-size: 2.5rem;
            font-weight: 600;
            color: #f0f0f0;
        }

        .btn-primary {
            background-color: #4070f4;
            border-color: #4070f4;
        }

        .btn-primary:hover {
            background-color: #335bc1;
            border-color: #335bc1;
        }

        .btn-danger {
            background-color: #e53935;
            border-color: #e53935;
        }

        .btn-danger:hover {
            background-color: #c62828;
            border-color: #c62828;
        }

        .container {
            padding: 3% 5%;
        }

        table {
            background-color: #ffffff;
            border-radius: 8px;
            box-shadow: 0px 4px 12px rgba(0, 0, 0, 0.1);
        }

        th, td {
            padding: 12px 15px;
            text-align: center;
        }

        th {
            background-color: #4070f4 !important;
            color: #fff !important;
            font-weight: bold;
        }

        td {
            color: #333;
        }

        .form-delete-btn {
            border: none;
            background: none;
            color: #e53935;
            cursor: pointer;
            font-weight: bold;
        }

        .row-spacing {
            margin-bottom: 20px;
        }
    </style>
</head>
<body>
<div class="dashboard">
    <div class="row">
        <div class="col-6"><h1>View Bookings</h1></div>
        <div class="col-3"></div>
        <div class="col-3"><a href="registeredUser.jsp" class="btn btn-primary">Back</a></div>
    </div>
</div>

<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-10">
            <table class="table table-striped table-hover">
                <thead>
                <tr>
                    <th>Booking ID</th>
                    <th>User ID</th>
                    <th>Vehicle ID</th>
                    <th>Date From</th>
                    <th>Price</th>
                    <th>No. of Days</th>
                    <th>Actions</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="book" items="${booking}">
                    <tr>
                        <td>${book.id}</td>
                        <td>${book.userId}</td>
                        <td>${book.vid}</td>
                        <td>${book.startingDate}</td>
                        <td>${book.total}</td>
                        <td>${book.duration}</td>
                        <td>
                            <form action="bookingServlet" method="post" class="d-inline">
                                <input type="hidden" value="${book.id}" name="bookId">
                                <input type="hidden" value="deletbooking" name="task">
                                <button type="submit" class="btn btn-danger btn-sm">Delete</button>
                            </form>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</div>
</body>
</html>
