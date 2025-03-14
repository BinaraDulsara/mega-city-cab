package com.test;

import static org.junit.Assert.*;
import java.sql.SQLException;
import java.util.List;

import com.dao.impl.NewUserUtilImpl;
import com.model.NewUser;
import com.model.User;
import org.junit.After;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.rules.TestWatcher;
import org.junit.runner.Description;

public class NewUserUtilImplTest {

    private NewUserUtilImpl newUserUtil;

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
        // Initialize the object before each test
        newUserUtil = new NewUserUtilImpl();
    }

    @After
    public void tearDown() throws Exception {
        // Cleanup after each test
    }

    @Test
    public void testAddUser() {
        User newuser1 = new User("John Doe", "password123", "johndoe@gmail.com", "1234567890", "user");
        boolean result = newUserUtil.addUser(newuser1);
        assertTrue("User addition should be successful", result);
    }

    @Test
    public void testGetAllNewUsers() {
        try {
            List<NewUser> users = newUserUtil.getAllNewUsers();
            assertNotNull("List should not be null", users);
            assertFalse("List should not be empty", users.isEmpty());
        } catch (SQLException e) {
            fail("SQL Exception occurred: " + e.getMessage());
        }
    }

    @Test
    public void testUpdateUserAccept() {
        String userId = "3"; // Assuming a user with ID 3 exists
        boolean result = newUserUtil.updateUser(userId, "accept");
        assertTrue("User should be accepted and verified", result);
    }

    // @Test
    // public void testUpdateUserDelete() {
    //     String userId = "2"; // Assuming a user with ID 2 exists
    //     boolean result = newUserUtil.updateUser(userId, "delete");
    //     assertTrue("User should be deleted successfully", result);
    // }
}
