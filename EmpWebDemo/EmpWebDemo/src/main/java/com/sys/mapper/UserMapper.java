package com.sys.mapper;

import com.sys.bean.User;
import org.apache.ibatis.annotations.Param;

public interface UserMapper {
    User findOne(@Param("account") String account,@Param("pwd") String pwd);
}
