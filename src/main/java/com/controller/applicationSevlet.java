package com.controller;

import java.io.IOException;
import java.util.List;

import com.dao.impl.VehicleUtilImpl;
import com.model.vehicle;
import com.model.Application;
import com.dao.impl.ApplicationUtilImpl;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class applicationSevlet
 */
@WebServlet("/applicationServlet")
public class applicationSevlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private ApplicationUtilImpl applicationUtilImpl = new ApplicationUtilImpl();
	private VehicleUtilImpl vehicleUtilImpl = new VehicleUtilImpl();

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String task = request.getParameter("task");
		String id = request.getParameter("id");

		if("accept".equals(task)){

			try {
			boolean res= applicationUtilImpl.approveApplication(id);

			if (res) {

				//get vehicle details from application
				vehicle newvehicle = applicationUtilImpl.getRegistrationFromId(id);

				//add vehicleobject to database
				boolean result = vehicleUtilImpl.addVehicle(newvehicle);

				//boolean isDone= vehicleServelet.addVehicle(id)

				RequestDispatcher dispatcher = request.getRequestDispatcher("adminRegApplications.jsp?result=accepted");
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

		else if("ViewApplications".equals(task)) {

			try {

				List<Application> Applications = applicationUtilImpl.getAllRegistartions();
				   if (!Applications.isEmpty()) {
		                response.getWriter().println("hi");
		                request.setAttribute("Applications", Applications);
		                RequestDispatcher dispatcher = request.getRequestDispatcher("adminRegApplications.jsp?result=true");
		                dispatcher.forward(request, response);

		            } else {
		                response.getWriter().println("No applications found for user with ID: ");
		                RequestDispatcher dispatcher = request.getRequestDispatcher("adminRegApplications.jsp?result=false");
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

		else if("deleteApllication".equals(task)) {

		try {
			String userId = request.getParameter("id");
			String applicationId = request.getParameter("applicationId");
			response.getWriter().println(userId);
			boolean res= applicationUtilImpl.deleteApllication(applicationId);


			if(res) {
				response.getWriter().println("deleted");
				List<Application> Applications = applicationUtilImpl.getAllRegistartionsOfUser(userId);

				request.setAttribute("Applications", Applications);
                RequestDispatcher dispatcher = request.getRequestDispatcher("carOwnerSeeRegistrations.jsp?result=true");
                dispatcher.forward(request, response);

			}

			response.getWriter().println("hello");
			}

		catch(Exception e) {


		}


	}


}}
