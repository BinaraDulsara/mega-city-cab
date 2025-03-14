<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Vehicle Set</title>
    <style>
        /* Global Styles */
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f4f7fa;
            margin: 0;
            padding: 0;
            color: #333;
        }

        .dashboard {
            background-color: #262A2E;
            color: #ffffff;
            padding: 20px;
            text-align: center;
        }

        h1 {
            text-align: center;
            color: #ffffff; /* Same color as registration list page */
            margin-top: 40px;
            font-size: 2rem;
            font-weight: 600;
        }

        /* Container for content */
        .container {
            width: 90%;
            margin: 0 auto;
            padding: 20px;
        }

        /* Table Styles */
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
            background-color: #fff;
            box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.1);
        }

        th, td {
            padding: 12px;
            text-align: left;
            border-bottom: 1px solid #007bff;
        }

        th {
            background-color: #007bff;
            color: white;
        }

        tr:hover {
            background-color: #f9f9f9;
        }

        /* Button Styles */
        button, a {
            padding: 8px 16px;
            text-decoration: none;
            display: inline-block;
            border-radius: 4px;
            text-align: center;
            cursor: pointer;
            border: none;
            transition: background-color 0.3s;
            margin-top: 10px;
        }

        .back-button {
            color: #fff;
            text-decoration: none;
            font-size: 16px;
            padding: 10px 15px;
            border-radius: 5px;
            background-color: #28a745;
            width: 120px;
            height: 20px;
            display: inline-flex;
            align-items: center;
            justify-content: center;
        }
        .back-button:hover {
            background-color: #218838;
        }

        .make-available {
            background-color: #28a745;
            color: white;
        }

        .make-available:hover {
            background-color: #218838;
        }

        .make-unavailable {
            background-color: #dc3545;
            color: white;
        }

        .make-unavailable:hover {
            background-color: #c82333;
        }

        /* Form styles */
        form {
            display: inline;
        }

        /* Centering the content */
        .center {
            text-align: center;
        }

        /* Responsive design */
        @media (max-width: 768px) {
            table {
                font-size: 14px;
            }

            h1 {
                font-size: 1.5rem;
            }

            .container {
                padding: 10px;
            }
        }
    </style>
</head>
<body>
<div class="dashboard">
    <div class="row">
        <div class="col-12">
            <h1>Vehicle Set</h1>
            <a href="carOwner.jsp" class="back-button">Back</a>
        </div>
    </div>
</div>
<div class="container">
    <!-- JavaScript alert if result is "false" -->
    <c:if test="${param.result == 'false'}">
        <script type="text/javascript">
            alert('No Registrations Done yet');
        </script>
    </c:if>

    <!-- Table Section -->
    <div class="center">
        <table>
            <tr>
                <th>Id</th>
                <th>Type</th>
                <th>Model Name</th>
                <th>Brand</th>
                <th>No. of Seats</th>
                <th>Price</th>
                <th>Status</th>
                <th>Action</th>
            </tr>
            <c:forEach var="vehicle" items="${vehicles}">
                <tr>
                    <td>${vehicle.id}</td>
                    <td>${vehicle.vType}</td>
                    <td>${vehicle.vModelName}</td>
                    <td>${vehicle.vBrand}</td>
                    <td>${vehicle.noOfSeats}</td>
                    <td>${vehicle.price}</td>
                    <td>${vehicle.status}</td>
                    <td>
                        <form action="vehicleServelet">
                            <input type="hidden" value="${vehicle.id}" name="vehicleId">
                            <input type="hidden" value="${vehicle.ownerId}" name="id">
                            <input type="hidden" value="${vehicle.status eq 'Unavailable' ? 'updateToAvailable' : 'updateToUnavailable'}" name="task">
                            <button type="submit" class="${vehicle.status == 'Unavailable' ? 'make-available' : 'make-unavailable'}">
                                <c:choose>
                                    <c:when test="${vehicle.status == 'Unavailable'}">Make Available</c:when>
                                    <c:otherwise>Make Unavailable</c:otherwise>
                                </c:choose>
                            </button>
                        </form>
                    </td>
                </tr>
            </c:forEach>
        </table>
    </div>
</div>

</body>
</html>
