package com.dao;

import com.model.notice;

import java.util.List;

public interface noticeUtil {
    boolean addNotice(notice n1);
    List<notice> getAllNotices();
    boolean deleteNoticeById(String id);
    boolean updateNotice(notice n1, String id);

}
