package com.dao;

import com.model.application;
import com.model.vehicle;

import java.sql.SQLException;
import java.util.List;

public interface ApplicationUtill {
    boolean insertData(application application1);
    List<application> getAllRegistartionsOfUser(String idn) throws SQLException;
    List<application> getAllRegistartions() throws SQLException;
    vehicle getRegistrationFromId(String idn) throws SQLException;
    boolean approveApplication(String id);
    boolean deleteApllication(String applicationId);
}
