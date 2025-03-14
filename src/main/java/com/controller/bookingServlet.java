package com.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.bookingUtil;
import com.model.booking;
import com.dao.impl.bookingUtilImpl;


@WebServlet("/bookingServlet")
public class bookingServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private bookingUtil bookingUtil = new bookingUtilImpl();
       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().println("hi");
		String task = request.getParameter("task");
		
		if ("booktheCar".equals(task)) {
			 	String userId = request.getParameter("userId");
		        String vehicleId = request.getParameter("vehicleId");
		        String startDateStr = request.getParameter("startDate");
		        String totPriceStr = request.getParameter("totalPrice");
		        String noOfDaysStr = request.getParameter("duration");
		        
		        
		        
		        int noOfDays = Integer.parseInt(noOfDaysStr);
		        int price =Integer.parseInt(totPriceStr);
		        
		        

		        // Create a new booking object with the provided parameters
		        booking book1 = new booking(userId, vehicleId, startDateStr, noOfDays, price);
		        
		        //response.getWriter().println(book1.getStartingDate());
		        
		       // boolean res= bookingUtil.addBooking(book1);
		       boolean res= bookingUtil.addBooking(book1);
		      
		        if (res) {
		        	response.getWriter().println("booked");
		        	RequestDispatcher dis = request.getRequestDispatcher("registeredUser.jsp?result=booked");
					dis.forward(request, response);
		        }
		        
		}
		
		if("ViewBookings".equals(task)) {
			String userId = request.getParameter("id");
			try {
			
			List<booking> bookings = bookingUtil.getAllBookingsOfUser(userId);
			//	String res = bookingUtil.getAllBookings(userId);
			
				//response.getWriter().println(res);
			if (!bookings.isEmpty()) {
                
                request.setAttribute("booking", bookings);
                for(booking b1:bookings) {
                	response.getWriter().println(b1.getId());
                }
                RequestDispatcher dispatcher = request.getRequestDispatcher("userSeeBookings.jsp?result=true");
                dispatcher.forward(request, response);
                
            } else {
                response.getWriter().println("No applications found for user with ID: ");
              //  RequestDispatcher dispatcher = request.getRequestDispatcher("userSeeBookings.jsp?result=false");
              //  dispatcher.forward(request, response);
            }
			
			}catch(Exception e) {
				
				
			}
		}
			
			if("deletbooking".equals(task)) {
				
				String bookId = request.getParameter("bookId");
				response.getWriter().println("Deleted ");
				boolean isDeleted = bookingUtil.deleteBookingById(bookId);
				
				if(isDeleted) {
					response.getWriter().println("Deleted ");
					
					
		                RequestDispatcher dispatcher = request.getRequestDispatcher("registeredUser.jsp?result=deleted");
		                dispatcher.forward(request, response);
		                
					
					
				}
				
			}
			
		}
}
	
	
	
	
	
	


