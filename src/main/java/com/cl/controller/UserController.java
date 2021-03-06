package com.cl.controller;

import com.cl.pojo.Manager;
import com.cl.pojo.User;
import com.cl.service.ManagerService;
import com.cl.service.ManagerServiceImpl;
import com.cl.service.UserService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.wf.captcha.utils.CaptchaUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/user")
public class UserController {
    @Autowired
    @Qualifier("UserServiceImpl")
    private UserService userService;
    @Autowired
    @Qualifier("ManagerServiceImpl")
    private ManagerService managerService;

    @RequestMapping("/captcha")
    public void captcha(HttpServletRequest request, HttpServletResponse response) throws Exception {
        CaptchaUtil.out(request, response);
    }

    @RequestMapping("/login")
    public String login(Manager manager, String verCode, Model model, HttpServletRequest request) {
        Manager serviceManager = managerService.findManager(manager);
        if (serviceManager != null) {
            request.getSession().setAttribute("manager", serviceManager);
        } else {
            model.addAttribute("loginMsg", "用户名或密码错误，请重新登录！ ");
        }
        if (!CaptchaUtil.ver(verCode, request)) {
            CaptchaUtil.clear(request);  // 清除session中的验证码
            model.addAttribute("loginMsg", "验证码不正确");
        } else if (serviceManager != null) {
            return "redirect:/user/allUser";
        }
        return "/login";
    }

    PageInfo pageStatus;

    @RequestMapping("/allUser")
    public String list(@RequestParam(required = false, defaultValue = "1", value = "pn") Integer pn,
                       Map<String, Object> map) {
        //引入分页查询，使用PageHelper分页功能
        //在查询之前传入当前页，然后多少记录
        PageHelper.startPage(pn, 5);
        //startPage后紧跟的这个查询就是分页查询
        List<User> users = userService.findAll();
        //model.addAttribute("list", users);
        //使用PageInfo包装查询结果，只需要将pageInfo交给页面就可以
        PageInfo pageInfo = new PageInfo<>(users, 5);
        //pageINfo封装了分页的详细信息，也可以指定连续显示的页数
        map.put("pageInfo", pageInfo);
        pageStatus = pageInfo;
        return "allUser";
    }

    //查询
    @RequestMapping("/queryUser")
    public String queryUser(@RequestParam(required = false, defaultValue = "1", value = "pn") Integer pn,
                            Map<String, Object> map, User user, Model model) {
        model.addAttribute("query_name", user.getName());
        model.addAttribute("query_address", user.getAddress());
        model.addAttribute("query_email", user.getEmail());
        PageHelper.startPage(pn, 5);
        List<User> users = userService.queryUser(user);
        PageInfo pageInfo = new PageInfo<>(users, 5);
        map.put("pageInfo", pageInfo);
        return "allUser";
    }


    @RequestMapping("/toAddUser")
    public String toAddPage() {
        return "addUser";
    }

    @ResponseBody
    @RequestMapping("/checkUser")
    public String checkUser(String name){
        User user = userService.checkName(name);
        //System.out.println(user);
        if (user != null) {
            return "1";  //表示admin这个用户名不能使用，已经存在
        }
        return "0";  //表示此时的用户名不存在，可以使用
    }

    @RequestMapping("/addUser")
    public String addUser(User users) {
        int size = pageStatus.getPageSize() - 1;
        userService.insert(users);
        return "redirect:/user/allUser?pn=" + size;
    }


    @RequestMapping("/toUpdateUser")
    public String toUpdateUser(int id, Model model) {
        User users = userService.findById(id);
        model.addAttribute("user", users);
        return "updateUser";
    }

    @RequestMapping("/updateUser")
    public String updateUser(User users) {
        int num = pageStatus.getPageNum();
        userService.update(users);
        return "redirect:/user/allUser?pn=" + num;
    }

    @RequestMapping("/del/{Id}")
    public String deleteUser(@PathVariable("Id") int id) {
        int num = pageStatus.getPageNum();
        userService.delete(id);
        userService.reAlter();//解决主键自增长不连续问题
        return "redirect:/user/allUser?pn=" + num;
    }

    @RequestMapping("/delSelected")
    public String delSelected(int[] uid) {
        int num = pageStatus.getPageNum();
        for (int i : uid) {
            userService.delete(i);
        }
        return "redirect:/user/allUser?pn=" + num;
    }
}
