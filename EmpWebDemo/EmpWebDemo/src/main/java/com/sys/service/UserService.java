package com.sys.service;

import com.sys.bean.User;
import com.sys.mapper.UserMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserService {
    @Autowired
    UserMapper userMapper;

    public User login(String account,String pwd){
        //调用mapper当中的findOne方法
        User user = userMapper.findOne(account, pwd);
        return user;
    }
}
