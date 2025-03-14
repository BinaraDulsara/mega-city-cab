package com.test;

import static org.junit.Assert.*;
import java.sql.SQLException;
import java.util.List;

import com.dao.impl.ApplicationUtilImpl;
import org.junit.After;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;

import com.model.Application;
import com.model.vehicle;
import org.junit.rules.TestWatcher;
import org.junit.runner.Description;

public class ApplicationUtilImplTest {

    private ApplicationUtilImpl applicationUtil;

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
        applicationUtil = new ApplicationUtilImpl();
    }

    @After
    public void tearDown() throws Exception {
        // Cleanup after each test
    }

    @Test
    public void testInsertData() {
        Application application1 = new Application("SUV", "X5", "BMW", 5, 60000.0, "owner123");
        boolean result = applicationUtil.insertData(application1);
        assertTrue("Insertion should be successful", result);
    }

    @Test
    public void testGetAllRegistrationsOfUser() {
        String ownerId = "owner123";
        try {
            List<Application> Applications = applicationUtil.getAllRegistartionsOfUser(ownerId);
            assertNotNull("List should not be null", Applications);
            assertFalse("List should not be empty", Applications.isEmpty());
        } catch (SQLException e) {
            fail("SQL Exception occurred: " + e.getMessage());
        }
    }

    @Test
    public void testGetAllRegistrations() {
        try {
            List<Application> Applications = applicationUtil.getAllRegistartions();
            assertNotNull("List should not be null", Applications);
            assertFalse("List should not be empty", Applications.isEmpty());
        } catch (SQLException e) {
            fail("SQL Exception occurred: " + e.getMessage());
        }
    }

    @Test
    public void testGetRegistrationFromId() {
        String id = "19"; // Assuming an application with ID 1 exists
        try {
            vehicle v1 = applicationUtil.getRegistrationFromId(id);
            assertNotNull("Vehicle should not be null", v1);
        } catch (SQLException e) {
            fail("SQL Exception occurred: " + e.getMessage());
        }
    }

    @Test
    public void testApproveApplication() {
        String id = "29";
        boolean result = applicationUtil.approveApplication(id);
        assertTrue("Approval should be successful", result);
    }

    @Test
    public void testDeleteApplication() {
        String id = "34"; // Assuming an application with ID 1 exists
        boolean result = applicationUtil.deleteApllication(id);
        assertTrue("Deletion should be successful", result);
    }
}
