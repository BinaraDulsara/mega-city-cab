package com.dao.impl;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.dao.newUserUtil;
import com.db.DBconnect;
import com.model.newUser;
import com.model.user;

public class newUserUtilImpl extends userDbUtilImpl implements newUserUtil {



	public  boolean addUser(user newuser1) {
	    	
	    	
    	 try {       
    		 con = DBconnect.getConnection();
    		 stmt = con.createStatement();
		
		        // SQL query to insert a new booking
    		  String sql = "INSERT INTO user (name, password, gmail, phonNumber, role,verification) VALUES ('" + newuser1.getName() + "', '" + 
                      newuser1.getPassword() + "', '" + newuser1.getGmail() + "', '" + newuser1.getPhoneNumber() + "', '" + 
                      newuser1.getRole() + "','Unverified')";
		
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
	 
	 
	 public  List<newUser> getAllNewUsers() throws SQLException {
		    List<newUser> users = new ArrayList<>();
		    
		    try {
		    	con=DBconnect.getConnection();
				stmt = con.createStatement();
				String sql = "SELECT * FROM user where verification='Unverified'";
				rs = stmt.executeQuery(sql);
				 while (rs.next()) {
			            int id = rs.getInt("id");
			            String name = rs.getString("name");
			            String password = rs.getString("password");
			            String email = rs.getString("gmail");
			            String phoneNumber = rs.getString("phonNumber");
			            String role = rs.getString("role");
			            newUser user = new newUser(name, password, email, phoneNumber, role,"unverified");
			            user.setId(id);
			            users.add(user);
			        }
		    }catch(Exception e) {
				e.printStackTrace();
			}
		    
		    
		    
		 
		    return users;
		}
	 
	 public  boolean updateUser(String UserId,String action) {
		 
		 try {
		        con = DBconnect.getConnection();
		        stmt = con.createStatement();
		        String sql =" ";
		   	 		if("accept".equals(action)) {
				 
		   	 		 sql = "UPDATE user SET verification='verified' WHERE id=" + UserId;
				 
		   	 		}else if("delete".equals(action)) {
		   	 		 sql = "Delete from user where id=" + UserId;
		   	 		}

		        // Execute the update query
		        int rowsAffected = stmt.executeUpdate(sql);

		        // If the number of rows affected is greater than 0, update was successful
		        return rowsAffected > 0;
		    } catch (SQLException e) {
		        e.printStackTrace();
		        return false; // Return false if an exception occurs
		    } finally {
		        try {
		            if (stmt != null) {
		                stmt.close();
		            }
		            if (con != null) {
		                con.close();
		            }
		        } catch (SQLException e) {
		            e.printStackTrace();
		        }
		    }
	 }
    
}
