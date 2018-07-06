package com.ymr.dao;

import com.ymr.model.Attendance;
import org.apache.ibatis.annotations.Param;

import java.sql.Timestamp;
import java.util.List;

public interface AttendanceDao {
    List<Attendance> getAttendancesByLessonId(@Param("lessonId") int lessonId,
                                              @Param("attendanceDate") Timestamp attendanceDate);
    void addAttendance(@Param("studentId") int studentId,
                       @Param("lessonId") int lessonId,
                       @Param("attendTime") Timestamp attendTime);
}
