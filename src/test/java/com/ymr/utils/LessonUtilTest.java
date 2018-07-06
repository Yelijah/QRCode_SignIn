package com.ymr.utils;

import com.ymr.model.Lesson;
import org.junit.Test;

import java.util.ArrayList;
import java.util.List;

import static org.junit.Assert.*;

public class LessonUtilTest {
    @Test
    public void currentLessonTest() throws Exception {
        List<Lesson> lessons=new ArrayList<>();
        lessons.add(new Lesson("高等数学",1,3,2,4,"方英"));
        lessons.add(new Lesson("大学英语",4,5,7,8,"张华"));
        lessons.add(new Lesson("普通物理",3,7,2,3,"李子其"));
        System.out.println(LessonUtil.currentLesson(lessons));
    }

}