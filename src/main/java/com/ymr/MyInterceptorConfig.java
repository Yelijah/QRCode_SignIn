package com.ymr;

import com.ymr.interceptor.StudentLoginInterceptor;
import com.ymr.interceptor.TeacherLoginInterceptor;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;

@Configuration
public class MyInterceptorConfig extends WebMvcConfigurerAdapter {
    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        registry.addInterceptor(new TeacherLoginInterceptor()).addPathPatterns("/teacher/**").
                excludePathPatterns("/teacher/login/**","/**/*.css","/**/*.jpg","/**/*.png","/**/*.js");

        registry.addInterceptor(new StudentLoginInterceptor()).addPathPatterns("/student/**").
                excludePathPatterns("/student/login/**","/**/*.css","/**/*.jpg","/**/*.png","/**/*.js");
        super.addInterceptors(registry);
    }
}
