package com.ymr.service;

import com.ymr.QrcodeApplicationTests;
import com.ymr.model.Attendance;
import com.ymr.model.Teacher;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

//import static org.junit.Assert.*;

public class TeacherServiceTest extends QrcodeApplicationTests{
    @Autowired
    private TeacherService service;

    @Test
    public void testHasMatchTeacher(){
        Teacher teacher=service.hasMatchTeacher(1,"123456");
        if (teacher==null){
            return;
        }
        System.out.println(teacher.toString());
    }

    @Test
    public void testGetAttendancesByLesson(){
        List<Attendance> attendances=service.getAttendancesByLesson(1);
        if (attendances!=null) {
            System.out.println(attendances);
        }
    }

}