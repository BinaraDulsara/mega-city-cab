package com.dao.impl;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.dao.bookingUtil;
import com.db.DBconnect;
import com.model.booking;


public class bookingUtilImpl implements bookingUtil {

	
	
	private static Connection con = null;
	private static ResultSet rs = null;
	private static Statement stmt = null;


    public  boolean addBooking(booking book) {
    	
    	
    	 try {       
    		 con = DBconnect.getConnection();
    		 stmt = con.createStatement();
		
		        // SQL query to insert a new booking
		        String sql = "INSERT INTO bookings (userid, vid, datefrom, noOfdays, price) VALUES ('" 
		            + book.getUserId() + "', '" 
		            + book.getVid() + "', '" 
		            + book.getStartingDate() + "', " 
		            + book.getDuration() + ", " 
		            + book.getTotal() + ")";
		
		        int rowsAffected = stmt.executeUpdate(sql);
		        
		        // Check if insertion was successful
		        if (rowsAffected > 0) {
		            return true;
		        } else {
		            return false;
		        }
		        
    		}catch(Exception e) {
				e.printStackTrace();
				return false;
			}
		       
		        

		        
		      
		    }
    
    
    public  List<booking> getAllBookingsOfUser(String userId) throws SQLException {
        List<booking> bookings = new ArrayList<>();
        
        try {
        	con=DBconnect.getConnection();
    		stmt = con.createStatement();
    		String sql = "SELECT * FROM bookings WHERE userid="+userId;
    		rs = stmt.executeQuery(sql);
    		 while (rs.next()) {
    			 	int idint = rs.getInt("id");
    			 	//String userId = rs.getString("userid");
    	            String vid = rs.getString("vid");
    	            String dateFrom = rs.getString("datefrom");
    	            int noOfDays = rs.getInt("noOfdays");
    	            int price = rs.getInt("price");
    	            
    	            String id = String.valueOf(idint);
    	            // Create a Booking object using retrieved data
    	            booking booking = new booking( userId, vid, dateFrom, price, noOfDays);
    	            booking.setId(idint);
    	            bookings.add(booking);
    	        }
        }catch(Exception e) {
    		e.printStackTrace();
    	}
        
        
        
     
        return bookings;
    }
    

    
    public  boolean deleteBookingById(String bookId) {
    	  
        try {
        	con=DBconnect.getConnection();
    		stmt = con.createStatement();
    		String sql = "DELETE FROM bookings WHERE id ="+bookId;
    		
    		
    		 int rowsAffected = stmt.executeUpdate(sql);
		        
		        // Check if insertion was successful
		        if (rowsAffected > 0) {
		            return true;
		        } else {
		            return false;
		        }
            }catch(Exception e) {
    		e.printStackTrace();
    	}
    	return false;
    }
    
}
