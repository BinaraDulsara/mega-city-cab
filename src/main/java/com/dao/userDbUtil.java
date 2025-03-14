package com.dao;

import com.model.user;

import java.sql.SQLException;
import java.util.List;

public interface userDbUtil {
    boolean validate(String username, String password);
    List<user> getUser(String userName);
    String getUserRole(String userName);
    List<user> getAllUsers() throws SQLException;
    user getUserFromId(String id);
    boolean updatePW(String pw, String id);

}
