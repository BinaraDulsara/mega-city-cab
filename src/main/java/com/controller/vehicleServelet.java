
package com.controller;

import com.dao.VehicleUtil;
import com.model.vehicle;
import com.dao.impl.VehicleUtilImpl;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

/**
 * Servlet implementation class vehicleServelet
 */
@WebServlet("/vehicleServelet")
public class vehicleServelet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private VehicleUtil vehicleUtil = new VehicleUtilImpl();


    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String task = request.getParameter("task");

        if ("viewVehicleUser".equals(task)) {

            try {
                String id = request.getParameter("id");

                List<vehicle> vehicleList = vehicleUtil.getAllVehicleOfUser(id);

                if (!vehicleList.isEmpty()) {
                    response.getWriter().println("hi");
                    request.setAttribute("vehicles", vehicleList);
                    RequestDispatcher dispatcher = request.getRequestDispatcher("carOwnerseeVehicles.jsp?result=true");
                    dispatcher.forward(request, response);

                } else {
                    response.getWriter().println("No applications found for user with ID: ");
                    RequestDispatcher dispatcher = request.getRequestDispatcher("carOwnerseeVehicles.jsp?result=false");
                    dispatcher.forward(request, response);
                }

            } catch (Exception e) {


            }


        }

        if ("updateToUnavailable".equals(task)) {

            try {
                String id = request.getParameter("vehicleId");
                String Userid = request.getParameter("id");


                boolean result = vehicleUtil.makeUnavailable(id);
                List<vehicle> vehicleList = vehicleUtil.getAllVehicleOfUser(Userid);

                response.getWriter().println(result);
                if (result) {
                    request.setAttribute("vehicles", vehicleList);
                    RequestDispatcher dispatcher = request.getRequestDispatcher("carOwnerseeVehicles.jsp?result=true");
                    dispatcher.forward(request, response);
                }


            } catch (Exception e) {


            }
        }
        if ("updateToAvailable".equals(task)) {


            try {
                String id = request.getParameter("vehicleId");
                String Userid = request.getParameter("id");

                boolean result = vehicleUtil.makeAvailable(id);
                List<vehicle> vehicleList = vehicleUtil.getAllVehicleOfUser(Userid);

                response.getWriter().println(result);
                if (result) {
                    request.setAttribute("vehicles", vehicleList);
                    RequestDispatcher dispatcher = request.getRequestDispatcher("carOwnerseeVehicles.jsp?result=true");
                    dispatcher.forward(request, response);
                }


            } catch (Exception e) {


            }
        }

        if ("viewAvailableVehicle".equals(task)) {

            try {
                String id = request.getParameter("id");
                List<vehicle> vehicleList = vehicleUtil.getAvailableVehicles();
                if (!vehicleList.isEmpty()) {
                    response.getWriter().println("hi");
                    request.setAttribute("vehicles", vehicleList);
                    RequestDispatcher dispatcher = request.getRequestDispatcher("userSeesVehicle.jsp?result=true&id=" + id);
                    dispatcher.forward(request, response);

                } else {
                    response.getWriter().println("No applications found for user with ID: ");
                    RequestDispatcher dispatcher = request.getRequestDispatcher("userSeesVehicle.jsp?result=false&id=" + id);
                    dispatcher.forward(request, response);
                }

            } catch (Exception e) {


            }
        }


    }


}
