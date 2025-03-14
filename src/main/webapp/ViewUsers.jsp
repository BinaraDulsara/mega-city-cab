<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Admin Dashboard</title>
    <style>
        body {
            font-family: 'Open Sans', sans-serif;
            background-color: #f8f9fa;
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
        .container {
            display: flex;
            justify-content: space-around;
            flex-wrap: wrap;
            margin-top: 30px;
        }
        .card {
            width: 48%;
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0px 4px 15px rgba(0, 0, 0, 0.1);
            margin-bottom: 30px;
        }
        .card-header {
            background-color: #262A2E;
            color: #fff;
            padding: 15px;
            font-size: 20px;
            text-align: center;
            border-top-left-radius: 10px;
            border-top-right-radius: 10px;
        }
        .card-body {
            padding: 20px;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 10px;
        }
        th, td {
            border: 1px solid #ccc;
            padding: 12px;
            text-align: center;
        }
        th {
            background-color: #262A2E;
            color: #fff;
        }
        tr:nth-child(even) {
            background-color: #f2f2f2;
        }
        .btn {
            padding: 8px 12px;
            border: none;
            cursor: pointer;
            border-radius: 5px;
            font-size: 14px;
        }
        .btn-delete {
            background-color: #dc3545;
            color: #fff;
        }
        .btn-delete:hover {
            background-color: #c82333;
        }
        .btn-verify {
            background-color: #28a745;
            color: #fff;
        }
        .btn-verify:hover {
            background-color: #218838;
        }
    </style>
</head>
<body>
<div class="dashboard">
    <h1>Admin Dashboard</h1>
    <a href="admin.jsp" class="btn back-button">Back</a>
</div>
<div class="container">
    <div class="card">
        <div class="card-header">User List</div>
        <div class="card-body">
            <table>
                <tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Email</th>
                    <th>Phone Number</th>
                    <th>Role</th>
                    <th>Action</th>
                </tr>
                <c:forEach var="user" items="${users}">
                    <tr>
                        <td>${user.id}</td>
                        <td>${user.name}</td>
                        <td>${user.gmail}</td>
                        <td>${user.phoneNumber}</td>
                        <td>${user.role}</td>
                        <td>
                            <form action="UserServlet">
                                <input type="hidden" value="${user.id}" name="userId">
                                <input type="hidden" value="deleteUser" name="task">
                                <button type="submit" class="btn btn-delete">Delete</button>
                            </form>
                        </td>
                    </tr>
                </c:forEach>
            </table>
        </div>
    </div>
    <div class="card">
        <div class="card-header">New Registrations List</div>
        <div class="card-body">
            <table>
                <tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Email</th>
                    <th>Phone Number</th>
                    <th>Role</th>
                    <th>Action</th>
                </tr>
                <c:forEach var="user1" items="${newUsers}">
                    <tr>
                        <td>${user1.id}</td>
                        <td>${user1.name}</td>
                        <td>${user1.gmail}</td>
                        <td>${user1.phoneNumber}</td>
                        <td>${user1.role}</td>
                        <td>
                            <form action="UserServlet">
                                <input type="hidden" value="${user1.id}" name="userId">
                                <input type="hidden" value="acceptUser" name="task">
                                <button type="submit" class="btn btn-verify">Verify</button>
                            </form>
                        </td>
                    </tr>
                </c:forEach>
            </table>
        </div>
    </div>
</div>
</body>
</html>
