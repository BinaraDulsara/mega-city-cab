<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Notices</title>
    <!-- Bootstrap CSS link -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
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
	body {
      overflow-x: hidden; /* Disable horizontal scrolling for the entire website */
    }
    </style>
</head>
<body>

<c:if test="${param.result == 'Deleted'}">
    <script type="text/javascript">
        alert('record deleted!'');
    </script>
</c:if>

<div class="dashboard">
<div class="row">
<div class="col-6"><h1 >View Notices</h1></div>
<div class="col-3"></div>
<div class="col-3"><a href="moderator.jsp" class="btn btn-primary">back</a></div>

</div>

 </div>
    <div class="container">
        <h1 class="text-center">Notice List</h1>
        <div class="row justify-content-center">
            <div class="col-md-6">
                <table class="table">
                    <thead>
                        <tr>
                            <th>Notice ID</th>
                            <th>Message</th>
                            <th>Status</th>
                   			<th></th>
                            <th></th>
                            
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="notice" items="${notices}">
                            <tr>
                                <td>${notice.id}</td>
                                <td>${notice.message}</td>
                                <td>${notice.visibility}</td>

                                <td>
                                    <form action="noticeServlet">
                                        <input type="hidden" value="${notice.id}" name="noticeId">
                                        <input type="hidden" value="deleteNotice" name="task">
                                        <button type="submit" class="btn btn-danger">Delete</button>
                                    </form>
                                </td>
                                <td>
                                	<a href="moderatorUpdatesNotice.jsp?id=${notice.id}&msg=${notice.message}" class="btn btn-warning">Update</a>
                                 
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
