package com.ymr.model;

public class Lesson {
    private String name;
    private int id;
    private int weekday;
    private int beginTime;
    private int endTime;
    private String teacherName;
    private int studentNumbers;

    public Lesson(String name, int id, int weekday, int beginTime, int endTime, String teacherName) {
        this.name = name;
        this.id = id;
        this.weekday = weekday;
        this.beginTime = beginTime;
        this.endTime = endTime;
        this.teacherName = teacherName;
    }

    public Lesson() {
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getWeekday() {
        return weekday;
    }

    public void setWeekday(int weekday) {
        this.weekday = weekday;
    }

    public int getBeginTime() {
        return beginTime;
    }

    public void setBeginTime(int beginTime) {
        this.beginTime = beginTime;
    }

    public int getEndTime() {
        return endTime;
    }

    public void setEndTime(int endTime) {
        this.endTime = endTime;
    }

    public String getTeacherName() {
        return teacherName;
    }

    public void setTeacherName(String teacherName) {
        this.teacherName = teacherName;
    }

    public int getStudentNumbers() {
        return studentNumbers;
    }

    public void setStudentNumbers(int studentNumbers) {
        this.studentNumbers = studentNumbers;
    }

    public String toString() {
        String s="";
        switch (weekday){
            case 1:s="周一";break;
            case 2:s="周二";break;
            case 3:s="周三";break;
            case 4:s="周四";break;
            case 5:s="周五";break;
            case 6:s="周六";break;
            case 7:s="周日";break;
        }
        return name+" "+s+"第"+beginTime+"-"+endTime+"节 "+teacherName;
    }
}
