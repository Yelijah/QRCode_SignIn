package com.ymr.dao;

import com.ymr.model.Student;

import java.util.List;

public interface StudentDao {
    List<Student> getStudentsByLesson(int lessonId);

    Student getStudentById(int id);
}
