<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Registrations</title>
    <style>
        body {
            font-family: 'Open Sans', sans-serif;
            background-color: #f4f4f4;
            color: #333;
            margin: 0;
            padding: 0;
        }

        .dashboard {
            background-color: #262A2E;
            color: #ffffff;
            padding: 20px;
            text-align: center;
        }

        .container {
            width: 90%;
            margin: 20px auto;
            background: #fff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
        }

        h1 {
            text-align: center;
            margin-bottom: 20px;
        }

        .back-button {
            display: inline-block;
            padding: 10px 15px;
            background-color: #007BFF;
            color: #fff;
            text-decoration: none;
            border-radius: 5px;
            transition: 0.3s;
        }

        .back-button:hover {
            background-color: #0056b3;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        th, td {
            border: 1px solid #ddd;
            padding: 12px;
            text-align: center;
        }

        th {
            background-color: #262A2E;
            color: #fff;
        }

        tr:nth-child(even) {
            background-color: #f9f9f9;
        }

        .btn {
            padding: 8px 12px;
            background-color: #28a745;
            color: #fff;
            border: none;
            cursor: pointer;
            border-radius: 5px;
            transition: 0.3s;
        }

        .btn:hover {
            background-color: #218838;
        }
    </style>
</head>
<body>
<div class="dashboard">
    <h1>Vehicle Approve List</h1>
    <a href="admin.jsp" class="btn back-button">Back</a>
</div>

<div class="container">
    <c:if test="${param.result == 'false'}">
        <script>alert('No Registrations Done yet');</script>
    </c:if>

    <c:if test="${param.result == 'accepted'}">
        <script>alert('Successfully Added!');</script>
        <script>window.location.href="http://localhost:8080/Vehicle_rental_System2_war_exploded/applicationServlet?task=ViewApplications"</script>
    </c:if>

    <table>
        <tr>
            <th>Id</th>
            <th>Type</th>
            <th>Model Name</th>
            <th>Brand</th>
            <th>No. of Seats</th>
            <th>Price</th>
            <th>Option</th>
        </tr>
        <c:forEach var="application" items="${Applications}">
            <tr>
                <td>${application.id}</td>
                <td>${application.vType}</td>
                <td>${application.vModelName}</td>
                <td>${application.vBrand}</td>
                <td>${application.noOfSeats}</td>
                <td>${application.price}</td>
                <td>
                    <form action="applicationServlet" method="get">
                        <input type="hidden" value="accept" name="task">
                        <input type="hidden" value="${application.id}" name="id">
                        <button type="submit" class="btn">Approve</button>
                    </form>
                </td>
            </tr>
        </c:forEach>
    </table>
</div>
</body>
</html>
