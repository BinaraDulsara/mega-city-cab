package com.test;

import static org.junit.Assert.*;
import java.sql.SQLException;
import java.util.List;

import com.dao.impl.vehicleUtilImpl;
import com.model.vehicle;
import org.junit.After;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.rules.TestWatcher;
import org.junit.runner.Description;

public class vehicleUtilImplTest {

    private vehicleUtilImpl vehicleUtil;

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
        vehicleUtil = new vehicleUtilImpl();
    }

    @After
    public void tearDown() throws Exception {
        // Cleanup after each test if needed
    }

    @Test
    public void testAddVehicle() {
        vehicle v1 = new vehicle("van", "superGL", "toyota", 7, 30000, "3");
        boolean result = vehicleUtil.addVehicle(v1);
        assertTrue("Vehicle should be added successfully", result);
    }

    @Test
    public void testGetAllVehicleOfUser() {
        String ownerId = "3"; // Assume this is a valid owner ID in the database
        try {
            List<vehicle> vehicles = vehicleUtil.getAllVehicleOfUser(ownerId);
            assertNotNull("Vehicles list should not be null", vehicles);
            assertFalse("Vehicles list should not be empty", vehicles.isEmpty());
        } catch (SQLException e) {
            fail("SQL Exception occurred: " + e.getMessage());
        }
    }

    @Test
    public void testMakeUnavailable() {
        String vehicleId = "3"; // Assume a vehicle with ID 3 exists in the database
        boolean result = vehicleUtil.makeUnavailable(vehicleId);
        assertTrue("Vehicle status should be updated to unavailable", result);
    }

    @Test
    public void testMakeAvailable() {
        String vehicleId = "3"; // Assume a vehicle with ID 3 exists in the database
        boolean result = vehicleUtil.makeAvailable(vehicleId);
        assertTrue("Vehicle status should be updated to available", result);
    }

    @Test
    public void testGetAvailableVehicles() {
        try {
            List<vehicle> vehicles = vehicleUtil.getAvailableVehicles();
            assertNotNull("Available vehicles list should not be null", vehicles);
            assertFalse("Available vehicles list should not be empty", vehicles.isEmpty());
        } catch (SQLException e) {
            fail("SQL Exception occurred: " + e.getMessage());
        }
    }
}
