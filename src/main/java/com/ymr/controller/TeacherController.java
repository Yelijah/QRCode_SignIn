package com.ymr.controller;

import com.google.zxing.BarcodeFormat;
import com.google.zxing.WriterException;
import com.google.zxing.client.j2se.MatrixToImageWriter;
import com.google.zxing.common.BitMatrix;
import com.google.zxing.qrcode.QRCodeWriter;
import com.ymr.model.Attendance;
import com.ymr.model.Lesson;
import com.ymr.model.Student;
import com.ymr.model.Teacher;
import com.ymr.service.TeacherService;
import com.ymr.utils.LessonUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;


import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/teacher")
public class TeacherController {
    @Autowired
    TeacherService service;

    @RequestMapping("/login")
    public ModelAndView login(){
        return new ModelAndView("teacher_login");
    }

    @RequestMapping(method = RequestMethod.POST,value = "/login/do")
    public ModelAndView doLogin(@RequestParam int id, @RequestParam String password, HttpSession session){
        ModelAndView mv=new ModelAndView();
        Teacher teacher=service.hasMatchTeacher(id,password);
        if (teacher==null){
            mv.setViewName("redirect:/teacher/login");
            session.setAttribute("loginError",1);
            //mv.addObject("loginError","该用户不存在或密码错误");
        }
        else {
            session.setAttribute("teacher",teacher);
            mv.setViewName("redirect:/teacher/index");
        }
        return mv;
    }

    @RequestMapping(value = "/index")
    public ModelAndView index(HttpSession session){

        ModelAndView mv=new ModelAndView();
        Teacher teacher=(Teacher)session.getAttribute("teacher");
        mv.setViewName("teacher_index");
        String[][] schedule= LessonUtil.getSchedule(teacher.getLessons());
        mv.addObject("schedule",schedule);

        return mv;
    }

    @RequestMapping("/schedule")
    public ModelAndView getAllLessons(HttpSession session){
        ModelAndView mv=new ModelAndView();
        Teacher teacher=(Teacher) session.getAttribute("teacher");

        String[][] schedule= LessonUtil.getSchedule(teacher.getLessons());
        mv.addObject("schedule",schedule);
        mv.setViewName("teacher_index");
        return mv;
    }

    @RequestMapping("/currentLesson")
    public ModelAndView getCurrentLesson(HttpSession session){
        ModelAndView mv=new ModelAndView();

        Teacher teacher=(Teacher) session.getAttribute("teacher");
        Lesson currentLesson = LessonUtil.currentLesson(teacher.getLessons());
        if (currentLesson!=null) {
            List<Student> students = service.getStudentsByLesson(currentLesson.getId());
            currentLesson.setStudentNumbers(students.size());
        }
        mv.addObject("currentLesson",currentLesson);
        mv.setViewName("teacher_currentLesson");
        return mv;
    }

    @RequestMapping("/currentLesson/getQrCode")
    public void getQrCode(HttpServletResponse response,HttpSession session){
        Teacher teacher=(Teacher) session.getAttribute("teacher");
        Lesson currentlesson=LessonUtil.currentLesson(teacher.getLessons());
        if (currentlesson!=null) {
            String url = "http://www.yangmingrui.info/student/signBook?lessonId=" + currentlesson.getId();
            int width = 200;
            int height = 200;
            ServletOutputStream stream = null;
            try {
                stream = response.getOutputStream();
                QRCodeWriter writer = new QRCodeWriter();
                BitMatrix bitMatrix = writer.encode(url, BarcodeFormat.QR_CODE, width, height);
                MatrixToImageWriter.writeToStream(bitMatrix, "jpg", stream);
            } catch (IOException | WriterException e) {
                e.printStackTrace();
            } finally {
                if (stream != null) {
                    try {
                        stream.flush();
                        stream.close();
                    } catch (IOException e) {
                        e.printStackTrace();
                    }
                }
            }
        }
    }

    @RequestMapping("/signBook")
    public ModelAndView getStudentsByLesson(HttpSession session){
        ModelAndView mv=new ModelAndView();
        mv.setViewName("teacher_signBook");
        Teacher teacher=(Teacher) session.getAttribute("teacher");
        Lesson currentLesson = LessonUtil.currentLesson(teacher.getLessons());
        if(currentLesson==null){
            return mv;
        }
        List<Student> students=service.getStudentsByLesson(currentLesson.getId());
        List<Attendance> attendances=service.getAttendancesByLesson(currentLesson.getId());
        Map<Student,String> attendanceSheet=new HashMap<>();
        for (Student student:students){
            attendanceSheet.put(student,"");
            for (Attendance attendance:attendances){
                if (student.getId()==attendance.getStudentId()){
                    SimpleDateFormat format=new SimpleDateFormat("yyyy/MM/dd HH:mm");
                    String time=format.format(attendance.getAttendTime());
                    attendanceSheet.replace(student,time);
                }
            }
        }
        mv.addObject("attendanceSheet",attendanceSheet);
        return mv;
    }

   /* @RequestMapping(method = RequestMethod.POST,value = "/register")
    public ModelAndView register(Teacher teacher){
        ModelAndView mv=new ModelAndView();

        return mv;
    }*/
}
