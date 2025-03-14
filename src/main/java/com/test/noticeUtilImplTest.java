//package com.test;
//
//import static org.junit.Assert.*;
//import java.sql.SQLException;
//import java.util.List;
//
//import com.dao.impl.noticeUtilImpl;
//import com.model.notice;
//import org.junit.After;
//import org.junit.Before;
//import org.junit.Test;
//
//public class noticeUtilImplTest {
//
//    private noticeUtilImpl noticeUtil;
//
//    @Before
//    public void setUp() throws Exception {
//        // Initialize the object before each test
//        noticeUtil = new noticeUtilImpl();
//    }
//
//    @After
//    public void tearDown() throws Exception {
//        // Cleanup after each test
//    }
//
//    @Test
//    public void testAddNotice() {
//        notice n1 = new notice("New notice message");
//        boolean result = noticeUtil.addNotice(n1);
//        assertTrue("Notice addition should be successful", result);
//    }
//
//    @Test
//    public void testGetAllNotices() {
//        List<notice> notices = noticeUtil.getAllNotices();
//        assertNotNull("List should not be null", notices);
//        assertTrue("List should not be empty", !notices.isEmpty());
//    }
//
////    @Test
////    public void testDeleteNoticeById() {
////        String id = "18"; // Assuming a notice with ID 3 exists
////        boolean result = noticeUtil.deleteNoticeById(id);
////        assertTrue("Notice should be deleted successfully", result);
////    }
//
//    //ain kara
////    @Test
////    public void testUpdateNotice() {
////        notice n1 = new notice("Updated notice message");
////        String id = "14"; // Assuming a notice with ID 3 exists
////        boolean result = noticeUtil.updateNotice(n1, id);
////        assertTrue("Notice should be updated successfully", result);
////    }
//}
