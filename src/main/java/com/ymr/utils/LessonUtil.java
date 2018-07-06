package com.ymr.utils;

import com.ymr.model.Lesson;

import java.util.Calendar;
import java.util.List;


public class LessonUtil {
    public static String[][] getSchedule(List<Lesson> lessons){
        String[][] schedule=new String[11][7];
        for (int i=0;i<11;i++){
            for (int j=0;j<7;j++){
                schedule[i][j]="";
            }
        }
        for (Lesson lesson:lessons){
            schedule[lesson.getBeginTime()-1][lesson.getWeekday()-1]=lesson.toString();
            for (int i=lesson.getBeginTime()+1;i<=lesson.getEndTime();i++){
                schedule[i-1][lesson.getWeekday()-1]=null;
            }
        }
        return schedule;
    }

    public static Lesson currentLesson(List<Lesson> lessons){
        int a=nowWhichLesson();

        //作弊测试用代码begin
        //int nowWeekDay=1;
        //作弊测试试用代码end
        int nowWeekDay=Calendar.getInstance().get(Calendar.DAY_OF_WEEK)-1;

        for (Lesson lesson:lessons){
            if (nowWeekDay!=lesson.getWeekday() && !(nowWeekDay==0&&lesson.getWeekday()==7)){
                continue;
            }
            if (lesson.getBeginTime()<=a&&a<=lesson.getEndTime()){
                return lesson;
            }
        }
        return null;
    }

    /*
    根据当前时间，判断是当前是第几节课，
    */
    private static int nowWhichLesson(){
        Calendar now=Calendar.getInstance();

        //作弊测试用代码begin
        /*now.set(Calendar.HOUR_OF_DAY,9);
        now.set(Calendar.MINUTE,20);*/
        //作弊测试试用代码end

        Calendar calendar=Calendar.getInstance();
        calendar.set(Calendar.HOUR_OF_DAY,7);
        calendar.set(Calendar.MINUTE,50);
        for (int i=0;i<11;i++){
            if (i==4){
                //若是中午，则调整为1:20
                calendar.set(Calendar.HOUR_OF_DAY,13);
                calendar.set(Calendar.MINUTE,20);
            }else if (i==8){
                //若是晚上，则调整为6:20
                calendar.set(Calendar.HOUR_OF_DAY,18);
                calendar.set(Calendar.MINUTE,20);
            }else if (i==1||i==5||i==9){
                //若是第2,6,10节课，则给下课时间加10min
                calendar.add(Calendar.MINUTE,10);
            }
            if (now.compareTo(calendar)>=0){
                calendar.add(Calendar.HOUR_OF_DAY,1);
                if (now.compareTo(calendar)<0){
                    return i+1;
                }
            }
        }
        return 0;
    }
}
