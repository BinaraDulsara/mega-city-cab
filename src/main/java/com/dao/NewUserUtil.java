package com.dao;

import com.model.NewUser;
import com.model.User;

import java.sql.SQLException;
import java.util.List;

public interface NewUserUtil {

    boolean addUser(User newuser1);
    List<NewUser> getAllNewUsers() throws SQLException;
    boolean updateUser(String UserId,String action);
}
