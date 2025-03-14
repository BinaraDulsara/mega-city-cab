package com.dao.impl;

import com.dao.userDbUtil;
import com.db.DBconnect;
import com.model.user;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;


public class userDbUtilImpl implements userDbUtil {
	private static boolean isSuccess;
	protected static Connection con = null;
	protected static Statement stmt = null;
	public static ResultSet rs = null;
    
	public  boolean validate(String username, String password) {
		
		try {
			con = DBconnect.getConnection();
			stmt = con.createStatement();
			String sql = "select * from user where gmail='"+username+"' and password='"+password+"'";
			rs = stmt.executeQuery(sql);
			
			if (rs.next()) {
				isSuccess = true;
			} else {
				isSuccess = false;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return isSuccess;
	}



public List<user> getUser(String userName) {
	
	ArrayList<user> user = new ArrayList<>();
	
	try {
		
		con = DBconnect.getConnection();
		stmt = con.createStatement();
		String sql = "select * from user where gmail='"+userName+"'";
		rs = stmt.executeQuery(sql);
		
		while (rs.next()) {
			int id = rs.getInt(1);
			String name = rs.getString(2);
			String password = rs.getString(3);
			String email = rs.getString(4);
			String phone = rs.getString(5);
			String role = rs.getString(6);
			
			
			user cus = new user(name,password,email,phone,role);
			cus.setId(id);
			user.add(cus);
		}
		
	} catch (Exception e) {
		e.printStackTrace();
	}
	
	return user;	
}
public String getUserRole(String userName) {
	String role = null;
	
	try {
		con=DBconnect.getConnection();
		stmt = con.createStatement();
		String sql = "select role from user where gmail='"+userName+"'";
		rs = stmt.executeQuery(sql);
		
		while(rs.next()) {
			role=rs.getString("role");
		}
	}catch(Exception e) {
			e.printStackTrace();
		}
		
	
	
	return role;
}



public List<user> getAllUsers() throws SQLException {
    List<user> users = new ArrayList<>();
    
    try {
    	con=DBconnect.getConnection();
		stmt = con.createStatement();
		String sql = "SELECT * FROM user where verification='verified'";
		rs = stmt.executeQuery(sql);
		 while (rs.next()) {
	            int id = rs.getInt("id");
	            String name = rs.getString("name");
	            String password = rs.getString("password");
	            String email = rs.getString("gmail");
	            String phoneNumber = rs.getString("phonNumber");
	            String role = rs.getString("role");
	            user user1 = new user( name, password, email, phoneNumber, role);
	            user1.setId(id);
	            users.add(user1);
	        }
    }catch(Exception e) {
		e.printStackTrace();
	}
 
 
    return users;
}

public user getUserFromId(String id) {
	try {
    	con=DBconnect.getConnection();
		stmt = con.createStatement();
		String sql = "SELECT * FROM user WHERE id="+id;
		rs = stmt.executeQuery(sql);
		 while (rs.next()) {
	            int id1 = rs.getInt("id");
	            String name = rs.getString("name");
	            String password = rs.getString("password");
	            String email = rs.getString("gmail");
	            String phoneNumber = rs.getString("phonNumber");
	            String role = rs.getString("role");
	            user user1 = new user( name, password, email, phoneNumber, role);
	            user1.setId(id1);
	            return user1;
	            
	        }
    }catch(Exception e) {
		e.printStackTrace();
	}
	return null;
}
public  boolean updatePW(String pw, String id) {
    try {
        con = DBconnect.getConnection();
        stmt = con.createStatement();

        // Construct the SQL query
        String sql = "UPDATE user SET password='" + pw + "' WHERE id=" + id;

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