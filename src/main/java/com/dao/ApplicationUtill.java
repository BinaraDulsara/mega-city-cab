package com.dao;

import com.model.Application;
import com.model.vehicle;

import java.sql.SQLException;
import java.util.List;

public interface ApplicationUtill {
    boolean insertData(Application application1);
    List<Application> getAllRegistartionsOfUser(String idn) throws SQLException;
    List<Application> getAllRegistartions() throws SQLException;
    vehicle getRegistrationFromId(String idn) throws SQLException;
    boolean approveApplication(String id);
    boolean deleteApllication(String applicationId);
}
