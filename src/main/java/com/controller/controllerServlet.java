package com.controller;

import java.io.IOException;
import java.util.List;

import com.dao.impl.applicationUtilImpl;
import com.dao.impl.userDbUtilImpl;
import com.model.application;
import com.model.user;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class controllerServlet
 */
@WebServlet("/controllerServlet")
public class controllerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private applicationUtilImpl applicationUtilImpl = new applicationUtilImpl();
	private userDbUtilImpl userDbUtilImpl = new userDbUtilImpl();

  
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String task = request.getParameter("task");
		
		if("ViewUsers".equals(task)) {

        try {
            // Fetch all users from the database
            List<user> users = userDbUtilImpl.getAllUsers();
            
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
		
		else if("ViewApplications".equals(task)) {
			
			try {
				
				List<application> Applications = applicationUtilImpl.getAllRegistartions();
				   if (!Applications.isEmpty()) {
		                response.getWriter().println("hi");
		                request.setAttribute("Applications", Applications);
		                RequestDispatcher dispatcher = request.getRequestDispatcher("carOwnerSeeRegistrations.jsp?result=true");
		                dispatcher.forward(request, response);
		                
		            } else {
		                response.getWriter().println("No applications found for user with ID: ");
		                RequestDispatcher dispatcher = request.getRequestDispatcher("carOwnerSeeRegistrations.jsp?result=false");
		                dispatcher.forward(request, response);
		            }
				
			}catch(Exception e) {
	        	e.printStackTrace();
	            // Handle exception appropriately
	            response.getWriter().println("<h2>Error occurred while fetching users</h2>");
	            response.getWriter().println("<pre>");
	            e.printStackTrace(response.getWriter());
	            response.getWriter().println("</pre>");
	        }

			
			
			
		}
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
	}

}
