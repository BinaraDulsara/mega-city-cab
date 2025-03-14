package com.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.model.NewUser;
import com.dao.impl.NewUserUtilImpl;
import com.model.User;
import com.dao.impl.UserDbUtilImpl;

/**
 * Servlet implementation class UserServlet
 */
@WebServlet("/UserServlet")
public class UserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private NewUserUtilImpl newUserUtilImpl = new NewUserUtilImpl();
	private UserDbUtilImpl userDbUtilImpl = new UserDbUtilImpl();

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String task = request.getParameter("task");
		
		if("changePW".equals(task)) {
			String id = request.getParameter("userId");
			User u1 = userDbUtilImpl.getUserFromId(id);
			String currentPassword = request.getParameter("currentPassword");
			String newPw = request.getParameter("newPassword");	
			String confirmPW = request.getParameter("confirmPassword");
			
			
			response.getWriter().println(currentPassword);
			
			if(u1.getPassword().equals(currentPassword)) {
				if(newPw.equals(confirmPW)) {
					response.getWriter().println(confirmPW);
					boolean result = userDbUtilImpl.updatePW(newPw,id);
					//response.getWriter().println(result);
					if(result) {
						response.getWriter().println("updated");
						request.setAttribute("resDone", "Password changed successfully");
						RequestDispatcher dis = request.getRequestDispatcher("userChangePw.jsp?id="+id);
						dis.forward(request, response);
					}else {
						request.setAttribute("res", "Something went wrong");
						RequestDispatcher dis = request.getRequestDispatcher("userChangePw.jsp?id="+id);
						dis.forward(request, response);
					}
					
					
				}else {
					request.setAttribute("res", "new passward did not confirmed correctly");
					RequestDispatcher dis = request.getRequestDispatcher("userChangePw.jsp?id="+id);
					dis.forward(request, response);
				}
			}else {
				request.setAttribute("res", "Password wrong");
				RequestDispatcher dis = request.getRequestDispatcher("userChangePw.jsp?res=password is wrong&id="+id);
				dis.forward(request, response);
			}
			
		}
		
		if("ViewUsers".equals(task)) {

	        try {
	            // Fetch all users from the database
	            List<User> users = userDbUtilImpl.getAllUsers();
	            
	            // Set users as a request attribute
	            request.setAttribute("users", users);
	            
	            List<NewUser> newuser = newUserUtilImpl.getAllNewUsers();
	            request.setAttribute("newUsers", newuser);
	            
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
		
		
		if("logout".equals(task)) {
			  // Get the session associated with this request
            HttpSession session = request.getSession(false);
            
            if (session != null) {
                // Invalidate the session
                session.invalidate();
                
                // Redirect the user to a logout page or any other appropriate page
                response.sendRedirect("login.jsp");
            } else {
                response.getWriter().println("No active session to log out from.");
            }
			
		}
		//admin's
		if("acceptUser".equals(task)) {
			 String UserId = request.getParameter("userId");
			 
			 boolean result = newUserUtilImpl.updateUser(UserId,"accept");
			 if(result) {
				try { 
				 List<User> users = userDbUtilImpl.getAllUsers();
				 List<NewUser> newuser = newUserUtilImpl.getAllNewUsers();
		            // Set users as a request attribute
		          request.setAttribute("users", users);
		          request.setAttribute("newUsers", newuser);
				 RequestDispatcher dispatcher = request.getRequestDispatcher("ViewUsers.jsp?result=true");
		         dispatcher.forward(request, response);
				}catch(Exception e) {
					e.printStackTrace();
				}
			 }
         
          
			
		}
		
		if("deleteUser".equals(task)) {
			 String UserId = request.getParameter("userId");
			 
			 boolean result = newUserUtilImpl.updateUser(UserId,"delete");
			 if(result) {
				try { 
				 List<User> users = userDbUtilImpl.getAllUsers();
				 List<NewUser> newuser = newUserUtilImpl.getAllNewUsers();
		            // Set users as a request attribute
		          request.setAttribute("users", users);
		          request.setAttribute("newUsers", newuser);
		          RequestDispatcher dispatcher = request.getRequestDispatcher("ViewUsers.jsp?result=true");
		          dispatcher.forward(request, response);
				}catch(Exception e) {
					e.printStackTrace();
				}
			 }
		}		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	     // Retrieve form data
        
        String name = request.getParameter("name");
        String password = request.getParameter("password");
        String gmail = request.getParameter("gmail");
        String phoneNumber = request.getParameter("phoneNumber");
        String role = request.getParameter("role");
        
        // Create a new user object
        NewUser newUser1 = new NewUser(name, password, gmail, phoneNumber, role, "unverified");
		boolean verification = newUser1.isVerified();
		if (!verification) {
			response.getWriter().println("a new guys");
			boolean res = newUserUtilImpl.addUser(newUser1);
			if(res) {
				response.getWriter().println("a new guy added");
				request.setAttribute("regresult", "Registration is sent to the administration to validate");
				RequestDispatcher dis = request.getRequestDispatcher("index.jsp");
				dis.forward(request, response);
			}
		}

	}
}
