package com.ymr.controller;

import com.ymr.model.Lesson;
import com.ymr.model.Student;
import com.ymr.service.StudentService;
import com.ymr.utils.LessonUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;


@RestController
@RequestMapping("/student")
public class StudentController {

    @Autowired
    StudentService studentService;

    @RequestMapping(value = {"/login"})
    public ModelAndView login() {
        return new ModelAndView("student_login");
    }

    @RequestMapping(method = RequestMethod.POST,value = "/login/do")
    public ModelAndView doLogin(@RequestParam int id,@RequestParam String password,HttpSession session){
        ModelAndView mv=new ModelAndView();
        Student student=studentService.hasMatchStudent(id, password);
        if (student==null){
            mv.setViewName("redirect:/student/login");
            session.setAttribute("loginError",1);
        }
        else {
            session.setAttribute("student",student);
            mv.setViewName("redirect:/student/index");
        }
        return mv;
    }

    @RequestMapping("/logout")
    public ModelAndView logout(HttpSession session){
        session.invalidate();
        ModelAndView mv=new ModelAndView();
        mv.setViewName("redirect:/student/login");
        return mv;
    }

    @RequestMapping(/*method = RequestMethod.POST,*/value ="/index")
    public ModelAndView index(/*@RequestParam int id, @RequestParam String password, */HttpSession session){
        ModelAndView mv=new ModelAndView();
        Student student=(Student) session.getAttribute("student");
        /*Student student=studentService.hasMatchStudent(id,password);*/
       /* if (student==null) {
            mv.setViewName("student_login");
            //mv.addObject("loginError","该用户不存在或密码错误");
            session.setAttribute("loginError",1);
        }else {*/
            mv.setViewName("student_index");
            //session.setAttribute("student",student);
            String[][] schedule= LessonUtil.getSchedule(student.getLessons());
            mv.addObject("schedule",schedule);
        //}
        return mv;
    }

    @RequestMapping(value = "/signBook")
    public ModelAndView signBook(HttpSession session,@RequestParam int lessonId){
        ModelAndView mv=new ModelAndView();
        Student student=(Student) session.getAttribute("student");
        if (student!=null) {
            Lesson currentLesson = LessonUtil.currentLesson(student.getLessons());
            if (currentLesson==null||lessonId!=currentLesson.getId()){
                mv.addObject("wrong","当前无此课程");
            }else {
                mv.addObject("currentLesson", currentLesson);
            }
        }
        mv.setViewName("student_signIn");
        return mv;
    }

    @RequestMapping("/signIn")
    public ModelAndView signIn(@RequestParam int lessonId,HttpSession session){
        ModelAndView mv=new ModelAndView();
        Student student=(Student)session.getAttribute("student");
        if (student!=null) {
            studentService.signIn(student.getId(), lessonId);
            student.setSigned(true);
            mv.addObject("success", "签到成功");
        }
        mv.setViewName("student_signIn");
        return mv;
    }

    @RequestMapping("/self")
    public ModelAndView self(HttpSession session){
        ModelAndView mv=new ModelAndView();
        Student student=(Student) session.getAttribute("student");
        if (student!=null){
            Lesson currentLesson=LessonUtil.currentLesson(student.getLessons());
            if (currentLesson!=null){
                mv.addObject("currentLesson",currentLesson);
            }
        }
        mv.setViewName("student_self");
        return mv;
    }
}
