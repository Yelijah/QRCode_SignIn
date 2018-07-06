package com.ymr.model;

import java.sql.Timestamp;

public class Attendance {
    private String studentName;
    private int studentId;
    private String specialty;
    private int lessonId;
    private Timestamp attendTime;

    public String getStudentName() {
        return studentName;
    }

    public void setStudentName(String studentName) {
        this.studentName = studentName;
    }

    public int getStudentId() {
        return studentId;
    }

    public void setStudentId(int studentId) {
        this.studentId = studentId;
    }

    public String getSpecialty() {
        return specialty;
    }

    public void setSpecialty(String specialty) {
        this.specialty = specialty;
    }

    public int getLessonId() {
        return lessonId;
    }

    public void setLessonId(int lessonId) {
        this.lessonId = lessonId;
    }

    public Timestamp getAttendTime() {
        return attendTime;
    }

    public void setAttendTime(Timestamp attendTime) {
        this.attendTime = attendTime;
    }
}
