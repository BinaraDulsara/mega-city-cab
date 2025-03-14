<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <meta charset="ISO-8859-1">
    <title>Insert title here</title>
    <style>
        .dashboard{
            padding-top:10vh;
            padding-left:5%;
            padding-bottom:8vh;
            background-color:#262A2E; /* Pale background color */
            font-family: 'Open Sans', sans-serif; /* Use Open Sans font */
            color: #ffffff; /* White text color */
            margin-bottom:5%;


        }
    </style>
</head>
<body>
<div class="dashboard">
    <div class="row">
        <div class="col-6"><h1 >Add a vehicle</h1></div>
        <div class="col-3"></div>
        <div class="col-3"><a href="carOwner.jsp" class="btn btn-primary">back</a></div>
    </div>
</div>


<%
    String id = request.getParameter("id");
    String result= request.getParameter("result");



    if ("true".equals(result)) {
        // Print JavaScript to display an alert box
        System.out.println("<script type=\"text/javascript\">");
        System.out.println("alert('Successfully added!');");
        System.out.println("</script>");
    }

%>
<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-3">
            <!-- Left column placeholder -->
        </div>
        <div class="col-md-6">
            <!-- Form -->
            <h1 class="text-center mt-5 mb-4">Vehicle Registration Form</h1>
            <form action="sR" method="post">
                <div class="mb-3">
                    <label for="vType" class="form-label">Vehicle Type</label>
                    <input type="text" class="form-control" id="vType" name="vType" required>
                </div>
                <div class="mb-3">
                    <label for="vModelName" class="form-label">Vehicle Model Name</label>
                    <input type="text" class="form-control" id="vModelName" name="vModelName" required>
                </div>
                <div class="mb-3">
                    <label for="vBrand" class="form-label">Vehicle Brand</label>
                    <input type="text" class="form-control" id="vBrand" name="vBrand" required>
                </div>
                <div class="mb-3">
                    <label for="noOfSeats" class="form-label">Number of Seats</label>
                    <input type="number" class="form-control" id="noOfSeats" name="noOfSeats" required>
                </div>
                <div class="mb-3">
                    <label for="price" class="form-label">Price</label>
                    <input type="number" class="form-control" id="price" name="price" required>
                </div>
                <input type="hidden" class="form-control" id="vOwner" name="vOwner" value="<%= id %>">
                <button type="submit" class="btn btn-primary">Submit</button>
            </form>
            <!-- End Form -->

        </div>
        <div class="col-md-3">
            <!-- Right column placeholder -->
        </div>
    </div>
</div>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>