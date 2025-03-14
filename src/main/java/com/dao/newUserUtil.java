package com.dao;

import com.model.newUser;
import com.model.user;

import java.sql.SQLException;
import java.util.List;

public interface newUserUtil {

    boolean addUser(user newuser1);
    List<newUser> getAllNewUsers() throws SQLException;
    boolean updateUser(String UserId,String action);
}
