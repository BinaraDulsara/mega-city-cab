package com.controller;

import com.model.user;
import com.dao.impl.userDbUtilImpl;

import java.io.IOException;
import java.io.PrintWriter;
//import java.util.List;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/loginServlet")
public class loginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private userDbUtilImpl userDbUtilImpl = new userDbUtilImpl();

   
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		response.setContentType("text/html");
		
		String userName = request.getParameter("username");
		String password = request.getParameter("password");
		boolean isTrue;
		
		isTrue = userDbUtilImpl.validate(userName, password);
		
		if (isTrue == true) {
			out.println("alert('Your username or password is correct');");
			List<user>userDetails = userDbUtilImpl.getUser(userName);
			request.setAttribute("userDetails", userDetails);
			
            HttpSession session = request.getSession(); // Retrieve the session or create a new one if it doesn't exist
            session.setAttribute("userDetails", userDetails);
			
			String role = userDbUtilImpl.getUserRole(userName);
			
			if("admin".equals(role)) {
				out.print("u are an admin");
				RequestDispatcher dis = request.getRequestDispatcher("admin.jsp");
				dis.forward(request, response);
			}else if("user".equals(role)) {
				out.print("u are an user");
				RequestDispatcher dis = request.getRequestDispatcher("registeredUser.jsp");
				dis.forward(request, response);
			}else if ("carOwner".equals(role)){
				out.print("u are car owner");
				RequestDispatcher dis = request.getRequestDispatcher("carOwner.jsp");
				dis.forward(request, response);
			}else if ("moderator".equals(role)){
				out.print("u are a moderator");
				RequestDispatcher dis = request.getRequestDispatcher("moderator.jsp");
				dis.forward(request, response);
			}
			
			
		} else {
			out.println("<script type='text/javascript'>");
			out.println("alert('Your username or password is incorrect');");
			out.println("location='login.jsp'");
			out.println("</script>");
		}
	}

}
