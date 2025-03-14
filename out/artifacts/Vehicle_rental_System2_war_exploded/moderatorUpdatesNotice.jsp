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
    .res{
    	color: green;
    }
  </style>
</head>
<body>

<%
String id = request.getParameter("id");
String msg = request.getParameter("msg");
%>

<div class="container">
  <div class="row">
    <div class="col-md-12">
      <div class="form-container">
      <div class="res">${message}</div>
        <h2>Update Notice</h2>
        <form action="noticeServlet">
          <div class="form-group">
            <label for="exampleFormControlTextarea1">Enter the notice:</label>
            <textarea name="notice" class="form-control" id="exampleFormControlTextarea1" rows="5" placeholder="<%= msg%>"></textarea>
          </div>
          <input type="hidden" name="task" value ="updateNotice">
          <input type="hidden" name="noticeid" value ="<%= id%>">
          
          <button type="submit" class="btn btn-primary">update Notice</button>
          <a href="moderator.jsp" class="btn btn-danger">back</a>
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