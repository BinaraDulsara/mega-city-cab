<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Result</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            text-align: center;
            margin: 50px;
        }
        .container {
            border: 1px solid #ccc;
            padding: 20px;
            max-width: 400px;
            margin: auto;
        }
        .button {
            padding: 10px 20px;
            font-size: 16px;
            background-color: #007bff;
            color: #fff;
            border: none;
            cursor: pointer;
            border-radius: 4px;
            transition: background-color 0.3s;
        }
        .button:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Result</h2>
        <p><strong>${param.result}</strong></p>
        <form action="your_previous_servlet_url_here" method="get">
            <button type="submit" class="button">OK</button>
        </form>
    </div>
</body>
</html>
