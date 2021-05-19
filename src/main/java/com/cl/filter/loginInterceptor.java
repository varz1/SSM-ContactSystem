package com.cl.filter;

import com.cl.pojo.Manager;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class loginInterceptor implements HandlerInterceptor {
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        // 获取请求的URL
        String url = request.getRequestURI();
        // login.jsp或登录请求放行，不拦截
        if (url.indexOf("/captcha") >= 0 || url.indexOf("/login") >= 0) {
            return true;
        }
        // 获取 session
//        HttpSession session = request.getSession();
//        Object obj = session.getAttribute("manager");
        Object obj = request.getSession().getAttribute("manager");
        if (obj != null)
            return true;
        // 没有登录且不是登录页面，转发到登录页面，并给出提示错误信息
        request.setAttribute("loginMsg", "欢迎来到人员管理系统，请登录");
        request.getRequestDispatcher("/WEB-INF/jsp/login.jsp").forward(request,response);
        return false;
    }
}
