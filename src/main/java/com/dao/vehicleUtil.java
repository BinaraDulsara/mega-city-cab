package com.dao;

import com.model.vehicle;

import java.sql.SQLException;
import java.util.List;

public interface vehicleUtil {
     boolean addVehicle(vehicle v1);
    List<vehicle> getAllVehicleOfUser(String id) throws SQLException;
    boolean makeUnavailable(String id);
    boolean makeAvailable(String id);
    List<vehicle> getAvailableVehicles() throws SQLException;

}
