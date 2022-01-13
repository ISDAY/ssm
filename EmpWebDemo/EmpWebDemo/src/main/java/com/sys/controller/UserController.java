package com.sys.controller;

import com.sys.bean.User;
import com.sys.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

/**
 * @SessionAttributes("user"):向session当中存放一个名为“user”的数据
 *
 */
@Controller
@SessionAttributes("user")
public class UserController {
    @Autowired
    UserService userService;
    /**
     * 登录功能
     * （1）用户的账号密码正确则跳转到main.jsp
     * （2）反正，跳转到index.jsp(/)
     * @return
     */
    @RequestMapping("/login")
    public String login(@RequestParam("account") String account, @RequestParam("pwd") String pwd, Model model){
        //判断userService.login()方法的返回user是否为null
        User user = userService.login(account, pwd);
        if(user != null){
            //账号密码正确,则将用户信息存放在session域对象当中，方便main.jsp获取
            model.addAttribute("user",user);
            // 则跳转到main.jsp
            return "redirect:/mainPage/";
        }
        //账号密码不正确，则跳转到到index.jsp(/)
        return "redirect:/";
    }
}
