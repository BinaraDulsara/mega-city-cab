<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<style>
    /* Custom CSS for styling */
    .form-container {
        max-width: 500px;
        margin: 0 auto;
        padding: 20px;
        border: 1px solid #ccc;
        border-radius: 5px;
        margin-top: 50px;
    }

    .form-container textarea {
        resize: vertical;
    }

    .form-container button {
        margin-top: 10px;
    }

    .res {
        color: green;
    }

    .error-message {
        color: red;
    }
</style>
<script>
    function validateForm() {
        var notice = document.getElementById("exampleFormControlTextarea1").value.trim();
        var errorMessage = document.getElementById("errorMessage");

        if (notice === "") {
            errorMessage.innerText = "Please enter a notice.";
            return false;
        }

        return true;
    }
</script>
</head>
<body>

<div class="container">
    <div class="row">
        <div class="col-md-12">
            <div class="form-container">
                <div class="res">${message}</div>
                <h2>Add a Notice</h2>
                <form action="noticeServlet" onsubmit="return validateForm()">
                    <div class="form-group">
                        <label for="exampleFormControlTextarea1">Enter the notice:</label>
                        <textarea name="notice" class="form-control" id="exampleFormControlTextarea1" rows="5" required placeholder="Enter your text here"></textarea>
                    </div>
                    <input type="hidden" name="task" value="addNotice">

                    <button type="submit" class="btn btn-primary">Add Notice</button>
                    <a href="moderator.jsp" class="btn btn-danger">Back</a>
                    <div class="error-message" id="errorMessage"></div>
                </form>
            </div>
        </div>
    </div>
</div>

<!-- Bootstrap JS (Optional) -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
