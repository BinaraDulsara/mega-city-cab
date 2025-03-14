package com.controller;

import com.dao.impl.ApplicationUtilImpl;
import com.model.Application;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class seeApplicationsServlet
 */
@WebServlet("/seeApplicationsServlet")
public class seeApplicationsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private ApplicationUtilImpl applicationUtilImpl = new ApplicationUtilImpl();

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id= request.getParameter("id");
		String task = request.getParameter("task");
		
		if("ViewRegistrations".equals(task)) {
		
		try {
			
			List<Application> Applications = applicationUtilImpl.getAllRegistartionsOfUser(id);
			
			   if (!Applications.isEmpty()) {
	                response.getWriter().println("hi");
	                request.setAttribute("Applications", Applications);
	                RequestDispatcher dispatcher = request.getRequestDispatcher("carOwnerSeeRegistrations.jsp?result=true&id="+id);
	                dispatcher.forward(request, response);
	                
	            } else {
	                response.getWriter().println("No applications found for user with ID: " + id);
	                RequestDispatcher dispatcher = request.getRequestDispatcher("carOwnerSeeRegistrations.jsp?result=false&id="+id);
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
		
			
			response.getWriter().println("hi");
			
		
	}

}
