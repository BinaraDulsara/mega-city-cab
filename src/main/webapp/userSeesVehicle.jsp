<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View Vehicles</title>
</head>
<body>

<style>
    /* Dashboard Styles */
    .dashboard {
        padding-top: 10vh;
        padding-left: 5%;
        padding-bottom: 8vh;
        background-color: #262A2E;
        font-family: 'Open Sans', sans-serif;
        color: #ffffff;
        text-align: center;
        border-bottom: 3px solid #ecf0f1;
    }

    body {
        overflow-x: hidden;
        background-color: #ecf0f1; /* Light background for the body */
    }

    /* Card Layout */
    .card-container {
        display: flex;
        flex-wrap: wrap;
        justify-content: space-evenly;
        gap: 20px;
        padding: 3%;
    }

    .card {
        width: 23%;
        border: none;
        border-radius: 8px;
        background-color: #ffffff;
        box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
        transition: transform 0.3s ease, box-shadow 0.3s ease;
    }

    .card:hover {
        transform: translateY(-5px);
        box-shadow: 0 10px 20px rgba(0, 0, 0, 0.2);
    }

    .card-img-top {
        border-radius: 8px 8px 0 0;
        object-fit: cover;
        height: 200px;
    }

    .card-body {
        padding: 15px;
    }

    .card h5 {
        font-size: 1.25rem;
        font-weight: bold;
    }

    .card p {
        font-size: 1rem;
        color: #7f8c8d;
    }

    .card .btn-primary {
        width: 100%;
        background-color: #007bff;
        border: none;
        padding: 12px;
        border-radius: 4px;
        font-size: 1rem;
        transition: background-color 0.3s ease;
    }

    .card .btn-primary:hover {
        background-color: #0056b3;
    }

    .btn-spacing {
        margin-top: 10px;
    }

    /* Media Queries for Responsiveness */
    @media (max-width: 768px) {
        .card {
            width: 48%;
        }
    }

    @media (max-width: 576px) {
        .card {
            width: 100%;
        }

        .dashboard {
            padding-top: 5vh;
        }
    }
</style>

<%
    String id = request.getParameter("id");
%>

<%-- JavaScript alert if result is "false" --%>
<c:if test="${param.result == 'false'}">
    <script type="text/javascript">
        alert('No any vehicle Available!');
    </script>
</c:if>

<div class="dashboard">
    <h1>Vehicle List</h1>
</div>

<div class="card-container">
    <c:forEach var="vehicle" items="${vehicles}">
        <div class="card">
            <img src="images/placeholder.jpeg" class="card-img-top" alt="Vehicle Image">
            <div class="card-body">
                <h5 class="card-title">${vehicle.vModelName}</h5>
                <p><strong>Type:</strong> ${vehicle.vType}</p>
                <p><strong>Brand:</strong> ${vehicle.vBrand}</p>
                <p><strong>No. of Seats:</strong> ${vehicle.noOfSeats}</p>
                <p><strong>Price:</strong> ${vehicle.price}</p>
                <p><strong>Status:</strong> ${vehicle.status}</p>
                <a href="userBookCar.jsp?id=<%= id %>&vid=${vehicle.id}&price=${vehicle.price}&vtype=${vehicle.vType}" class="btn btn-primary btn-spacing">Book this ${vehicle.vType}</a>
            </div>
        </div>
    </c:forEach>
</div>

</body>
</html>
