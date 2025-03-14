<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>Registration List</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <style>
        table {
            width: 80%;
            border-collapse: collapse;
            margin-top: 30px;
        }

        th, td {
            padding: 12px;
            text-align: left;
            border: 1px solid #ddd;
        }

        th {
            background-color: #007bff;
            color: white;
        }

        tr:nth-child(even) {
            background-color: #f9f9f9;
        }

        tr:hover {
            background-color: #f1f1f1;
        }

        button,
        a {
            background-color: #007bff;
            color: white;
            border: none;
            padding: 8px 16px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            margin: 4px 2px;
            cursor: pointer;
            border-radius: 4px;
        }

        button:hover,
        a:hover {
            background-color: #0056b3;
        }

        .dashboard {
            background-color: #262A2E;
            color: #ffffff;
            padding: 20px;
            text-align: center;
        }

        .dashboard h1 {
            font-size: 2rem;
            text-align: center; /* Center the header text */
            margin-bottom: 30px;
        }

        .container {
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 20px;
        }
        .back-button {
            color: #fff;
            text-decoration: none;
            font-size: 16px;
            padding: 10px 15px;
            border-radius: 5px;
            background-color: #28a745;
            width: 120px;
            height: 35px;
            display: inline-flex;
            align-items: center;
            justify-content: center;
        }
        .back-button:hover {
            background-color: #218838;
        }

    </style>
</head>

<body>

<div class="dashboard">
        <div>
            <h1>Registration List</h1>
            <a href="carOwner.jsp" class="back-button">Back</a>
        </div>
</div>

<center>
    <%-- JavaScript alert if result is "false" --%>
    <c:if test="${param.result == 'false'}">
        <script type="text/javascript">
            alert('No Registrations Done yet');
        </script>
    </c:if>

    <div class="container">
        <table>
            <thead>
            <tr>
                <th>Id</th>
                <th>Type</th>
                <th>Model Name</th>
                <th>Brand</th>
                <th>No. of Seats</th>
                <th>Price</th>
                <th>Status</th>
                <th>Actions</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="application" items="${Applications}">
                <tr>
                    <td>${application.id}</td>
                    <td>${application.vType}</td>
                    <td>${application.vModelName}</td>
                    <td>${application.vBrand}</td>
                    <td>${application.noOfSeats}</td>
                    <td>${application.price}</td>
                    <td>${application.status}</td>
                    <td>
                        <form action="applicationServlet" method="POST">
                            <input type="hidden" value="${application.id}" name="applicationId">
                            <input type="hidden" value="${application.ownerId}" name="id">
                            <input type="hidden" value="deleteApllication" name="task">
                            <button type="submit" class="btn btn-danger">Delete</button>
                        </form>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</center>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>

</html>
