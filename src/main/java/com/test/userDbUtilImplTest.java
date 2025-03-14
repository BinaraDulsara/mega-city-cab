package com.test;

import static org.junit.Assert.*;
import java.sql.SQLException;
import java.util.List;

import com.dao.impl.userDbUtilImpl;
import com.model.user;
import org.junit.After;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.rules.TestWatcher;
import org.junit.runner.Description;

public class userDbUtilImplTest {

    private userDbUtilImpl userDbUtil;

    @Rule
    public TestWatcher watchman = new TestWatcher() {
        @Override
        protected void succeeded(Description description) {
            System.out.println("✅ " + description.getMethodName() + " passed successfully.");
        }

        @Override
        protected void failed(Throwable e, Description description) {
            System.out.println("❌ " + description.getMethodName() + " failed: " + e.getMessage());
        }
    };

    @Before
    public void setUp() throws Exception {

        userDbUtil = new userDbUtilImpl();
    }

    @After
    public void tearDown() throws Exception {

    }

    @Test
    public void testValidate() {
        String username = "kithsandu@gmail.com";
        String password = "kithpass";
        boolean result = userDbUtil.validate(username, password);
        assertTrue("Validation should be successful", result);
    }

    @Test
    public void testGetUser() {
        String userName = "kithsandu@gmail.com";
        List<user> users = userDbUtil.getUser(userName);
        assertNotNull("Users list should not be null", users);
        assertFalse("Users list should not be empty", users.isEmpty());
    }

    @Test
    public void testGetUserRole() {
        String userName = "kithsandu@gmail.com";
        String role = userDbUtil.getUserRole(userName);
        assertNotNull("User role should not be null", role);
        assertEquals("Role should be 'carOwner'", "carOwner", role);
    }

    @Test
    public void testGetAllUsers() {
        try {
            List<user> users = userDbUtil.getAllUsers();
            assertNotNull("Users list should not be null", users);
            assertFalse("Users list should not be empty", users.isEmpty());
        } catch (SQLException e) {
            fail("SQL Exception occurred: " + e.getMessage());
        }
    }

    @Test
    public void testGetUserFromId() {
        String id = "3"; // Assuming a user with ID 3 exists
        user retrievedUser = userDbUtil.getUserFromId(id);
        assertNotNull("User should not be null", retrievedUser);
        assertEquals("User ID should be 3", "3", String.valueOf(retrievedUser.getId()));
    }

    @Test
    public void testUpdatePW() {
        String newPassword = "kithpass";
        String id = "3"; // Assuming a user with ID 3 exists
        boolean result = userDbUtil.updatePW(newPassword, id);
        assertTrue("Password update should be successful", result);
    }
}
