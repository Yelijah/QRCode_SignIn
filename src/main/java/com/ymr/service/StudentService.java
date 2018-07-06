package com.ymr.service;

import com.ymr.dao.AttendanceDao;
import com.ymr.dao.StudentDao;
import com.ymr.model.Student;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.sql.Timestamp;
import java.util.Calendar;

@Service
public class StudentService {
    @Autowired
    private StudentDao studentDao;

    @Autowired
    private AttendanceDao attendanceDao;

    public Student hasMatchStudent(int id,String password){
        Student student=studentDao.getStudentById(id);
        if (student==null){
          return null;
        }
        if (student.getPassword().equals(password)){
            return student;
        }
        return null;
    }

    public void signIn(int studentId, int lessonId){
        //作弊测试代码begin
        /*Calendar calendar=Calendar.getInstance();
        calendar.set(Calendar.DAY_OF_WEEK,1);
        calendar.set(Calendar.HOUR_OF_DAY,9);
        Timestamp attendTime=new Timestamp(calendar.getTimeInMillis());*/
        //作弊测试代码end
        Timestamp attendTime=new Timestamp(System.currentTimeMillis());

        attendanceDao.addAttendance(studentId,lessonId,attendTime);
    }

}
