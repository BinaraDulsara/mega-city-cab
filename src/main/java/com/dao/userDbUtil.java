package com.dao;

import com.model.User;

import java.sql.SQLException;
import java.util.List;

public interface userDbUtil {
    boolean validate(String username, String password);
    List<User> getUser(String userName);
    String getUserRole(String userName);
    List<User> getAllUsers() throws SQLException;
    User getUserFromId(String id);
    boolean updatePW(String pw, String id);

}
