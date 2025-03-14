package com.dao;

import com.model.booking;

import java.sql.SQLException;
import java.util.List;

public interface bookingUtil {
    boolean addBooking(booking book);
    List<booking> getAllBookingsOfUser(String userId) throws SQLException;
    boolean deleteBookingById(String bookId);

}
