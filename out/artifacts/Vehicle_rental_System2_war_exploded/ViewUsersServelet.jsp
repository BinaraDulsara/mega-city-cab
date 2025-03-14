package com.user;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ViewServlet")
public class ViewServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            // Fetch all users from the database
            List<user> users = userDbUtil.getAllUsers();
            
            // Set users as a request attribute
            request.setAttribute("users", users);
            
            if (users.isEmpty()) {
            	 response.getWriter().println("<h2>not fetched</h2>");
            } else {
            	 response.getWriter().println("<h2> fetched</h2>");}
            // Forward the request to the JSP page for rendering
            RequestDispatcher dispatcher = request.getRequestDispatcher("ViewUsers.jsp");
           dispatcher.forward(request, response);
            
        } catch (Exception e) {
        	e.printStackTrace();
            // Handle exception appropriately
            response.getWriter().println("<h2>Error occurred while fetching users</h2>");
            response.getWriter().println("<pre>");
            e.printStackTrace(response.getWriter());
            response.getWriter().println("</pre>");
        }
    }
}
