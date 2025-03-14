//package com.dao.impl;
//
//import java.sql.Connection;
//import java.sql.ResultSet;
//import java.sql.Statement;
//
//import com.dao.noticeUtil;
//import com.db.DBconnect;
//import com.model.notice;
//
//import java.sql.SQLException;
//import java.util.ArrayList;
//import java.util.List;
//
//
//public class noticeUtilImpl implements noticeUtil {
//	private static Connection con = null;
//	private static ResultSet rs = null;
//	private static Statement stmt = null;
//
//	public  boolean addNotice(notice n1) {
//		 try {
//    		 con = DBconnect.getConnection();
//    		 stmt = con.createStatement();
//
//		        // SQL query to insert a new booking
//    		  String sql = "INSERT INTO notice (message,visibility) VALUES ('" + n1.getMessage() + "', '" +
//                      n1.getVisibility() + "')";
//
//		        int rowsAffected = stmt.executeUpdate(sql);
//
//		        // Check if insertion was successful
//		        if (rowsAffected > 0) {
//		            return true;
//		        } else {
//		            return false;
//		        }
//
//    		}catch(Exception e) {
//				e.printStackTrace();
//				return false;
//			}
//
//	}
//
//	public  List<notice> getAllNotices(){
//		List<notice> noticeList = new ArrayList<>();
//
//        try {
//        	con=DBconnect.getConnection();
//    		stmt = con.createStatement();
//    		String sql = "SELECT * FROM notice";
//    		rs = stmt.executeQuery(sql);
//    		 while (rs.next()) {
//    			 	int idint = rs.getInt("id");
//    			 	//String userId = rs.getString("userid");
//    	            String msg = rs.getString("message");
//    	            String visibility = rs.getString("visibility");
//    	  ;
//
//    	            String id = String.valueOf(idint);
//    	            // Create  notice object
//    	            notice n1=new notice(msg);
//    	            n1.setId(idint);
//    	            n1.setVisibility(visibility);
//
//
//    	            noticeList.add(n1);
//    	        }
//        }catch(Exception e) {
//    		e.printStackTrace();
//    	}
//        return noticeList;
//
//	}
//
//	public  boolean deleteNoticeById(String id) {
//
//		 try {
//		        con = DBconnect.getConnection();
//		        stmt = con.createStatement();
//		        String sql = "Delete from notice where id=" + id;
//
//
//		        // Execute the update query
//		        int rowsAffected = stmt.executeUpdate(sql);
//
//		        // If the number of rows affected is greater than 0, update was successful
//		        return rowsAffected > 0;
//		    } catch (SQLException e) {
//		        e.printStackTrace();
//		        return false; // Return false if an exception occurs
//		    } finally {
//		        try {
//		            if (stmt != null) {
//		                stmt.close();
//		            }
//		            if (con != null) {
//		                con.close();
//		            }
//		        } catch (SQLException e) {
//		            e.printStackTrace();
//		        }
//		    }
//	}
//
//	public  boolean updateNotice(notice n1, String id) {
//
//		 try {
//		        con = DBconnect.getConnection();
//		        stmt = con.createStatement();
//		        String sql = "update notice set message='"+n1.getMessage() +"' where id="+ id;
//
//
//		        // Execute the update query
//		        int rowsAffected = stmt.executeUpdate(sql);
//
//		        // If the number of rows affected is greater than 0, update was successful
//		        return rowsAffected > 0;
//		    } catch (SQLException e) {
//		        e.printStackTrace();
//		        return false; // Return false if an exception occurs
//		    } finally {
//		        try {
//		            if (stmt != null) {
//		                stmt.close();
//		            }
//		            if (con != null) {
//		                con.close();
//		            }
//		        } catch (SQLException e) {
//		            e.printStackTrace();
//		        }
//		    }
//	}
//
//
//
//}
