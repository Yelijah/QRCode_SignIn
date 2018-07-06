package com.ymr.service;

import com.ymr.QrcodeApplicationTests;
import com.ymr.model.Student;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;


public class StudentServiceTest extends QrcodeApplicationTests {

    @Autowired
    StudentService service;

    @Test
    public void hasMatchStudentTest(){
        Student student=service.hasMatchStudent(1,"1634");
        if (student==null){
            return;
        }
        System.out.println(student.toString());
    }

    @Test
    public void signInTest(){
        service.signIn(1,1);
    }
}
