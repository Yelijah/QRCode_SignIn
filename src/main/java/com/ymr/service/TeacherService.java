package com.ymr.service;

import com.ymr.dao.AttendanceDao;
import com.ymr.dao.StudentDao;
import com.ymr.dao.TeacherDao;
import com.ymr.model.Attendance;
import com.ymr.model.Student;
import com.ymr.model.Teacher;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.sql.Timestamp;
import java.util.Calendar;
import java.util.List;

@Service
public class TeacherService {
    @Autowired
    private TeacherDao teacherDao;
    @Autowired
    private StudentDao studentDao;
    @Autowired
    private AttendanceDao attendanceDao;

    public List<Attendance> getAttendancesByLesson(int lessonId){
        Calendar calendar=Calendar.getInstance();
        calendar.set(Calendar.HOUR_OF_DAY,0);
        calendar.set(Calendar.MINUTE,0);
        calendar.set(Calendar.SECOND,0);

        //作弊测试代码begin
        //calendar.set(Calendar.DAY_OF_WEEK,1);
        //作弊测试代码end

        Timestamp today=new Timestamp(calendar.getTimeInMillis());
        return attendanceDao.getAttendancesByLessonId(lessonId,today);
    }

    public Teacher hasMatchTeacher(int id,String password){
        Teacher teacher=teacherDao.findTeacherById(id);
        if (teacher==null){
            return null;
        }
        if (teacher.getPassword().equals(password)){
            return teacher;
        }
        else {
            return null;
        }
    }
    public List<Student> getStudentsByLesson(int lessonId){
        return studentDao.getStudentsByLesson(lessonId);
    }



}
