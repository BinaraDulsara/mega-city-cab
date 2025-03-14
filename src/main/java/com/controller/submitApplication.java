package com.controller;

//import com.db.DBconnect;
import java.io.IOException;

import com.dao.impl.applicationUtilImpl;
import com.model.application;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/submitApplication")
public class submitApplication extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private applicationUtilImpl applicationUtilImpl = new applicationUtilImpl();
     

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
         
       
		
		String vType = request.getParameter("vType");
        String vModelName = request.getParameter("vModelName");
        String vBrand = request.getParameter("vBrand");
        int noOfSeats = Integer.parseInt(request.getParameter("noOfSeats"));
        double price = Double.parseDouble(request.getParameter("price"));
        String ownerId = request.getParameter("vOwner"); 
       // response.getWriter().println(ownerId);
        

        // Create a VehicleApplication object
       application vehicleApp = new application(vType, vModelName, vBrand, noOfSeats, price, ownerId);

        System.out.println(vehicleApp);

        boolean res = applicationUtilImpl.insertData(vehicleApp);
        response.getWriter().println(res);
        
        if(res) {
        	response.getWriter().println("successfully added");
			RequestDispatcher dis = request.getRequestDispatcher("addVehicle.jsp?result=true&id="+ownerId);
			dis.forward(request, response);
        }else {
        	response.getWriter().println("failed");
        	RequestDispatcher dis = request.getRequestDispatcher("addVehicle.jsp?result=false&id="+ownerId);
			dis.forward(request, response);
			
        }
        
       // response.getWriter().println("successfully added");
       // Print vehicle application details (optional);
        
        
        
       // Redirect to a success page (for demonstration purposes)
      
		
	}

}
