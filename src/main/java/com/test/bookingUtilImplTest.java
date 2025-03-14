package com.test;

import static org.junit.Assert.*;

import java.sql.SQLException;
import java.util.List;

import com.dao.impl.bookingUtilImpl;
import org.junit.After;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;

import com.db.DBconnect;
import com.model.booking;
import org.junit.rules.TestWatcher;
import org.junit.runner.Description;

public class bookingUtilImplTest {

    private booking testBooking;
    private bookingUtilImpl bookingUtil;

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
        // Create a test booking object
        testBooking = new booking("2", "2", "2024-05-08", 1, 5000);
        bookingUtil = new bookingUtilImpl();

        // Ensure the database connection is established
        DBconnect.getConnection();
    }

    @After
    public void tearDown() throws Exception {
        // Cleanup database after tests (optional)
        DBconnect.getConnection().close();
    }

    @Test
    public void testAddBooking() {
        boolean result = bookingUtil.addBooking(testBooking);
        assertTrue("Booking should be added successfully", result);
    }

    @Test
    public void testGetAllBookingsOfUser() throws SQLException {
        // Ensure booking is added first
        bookingUtil.addBooking(testBooking);

        // Retrieve bookings for the given user
        List<booking> bookings = bookingUtil.getAllBookingsOfUser("2");
        assertNotNull("Bookings list should not be null", bookings);
        assertFalse("Bookings list should not be empty", bookings.isEmpty());

        // Check if the inserted booking exists
        boolean found = false;
        for (booking b : bookings) {
            if (b.getVid().equals("2") && b.getUserId().equals("2")) {
                found = true;
                break;
            }
        }
        assertTrue("Inserted booking should exist in the retrieved list", found);
    }

    @Test
    public void testDeleteBookingById() {
        // First, add a booking
        boolean added = bookingUtil.addBooking(testBooking);
        assertTrue("Booking should be added before deletion", added);

        // Retrieve the booking ID
        List<booking> bookings;
        try {
            bookings = bookingUtil.getAllBookingsOfUser("2");
            assertFalse("Bookings should not be empty", bookings.isEmpty());

            int bookingId = bookings.get(2).getId(); // Get the first booking's ID

            // Now, delete the booking
            boolean deleted = bookingUtil.deleteBookingById(String.valueOf(bookingId));
            assertTrue("Booking should be deleted successfully", deleted);

            // Ensure the booking is no longer present
            List<booking> updatedBookings = bookingUtil.getAllBookingsOfUser("2");
            assertFalse("Deleted booking should not be in the list", updatedBookings.contains(testBooking));

        } catch (SQLException e) {
            fail("SQL Exception occurred: " + e.getMessage());
        }
    }
}
