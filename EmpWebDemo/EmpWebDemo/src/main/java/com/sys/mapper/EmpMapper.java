package com.sys.mapper;

import com.sys.bean.Employee;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface EmpMapper {

    //查询用户信息（查询所有、多条件查询）
    List<Employee> findEmp(@Param("emp_no") String emp_no,
                           @Param("emp_name") String emp_name,
                           @Param("department") String department);

    //添加数据
    Integer addEmp(@Param("emp_no") String emp_no,
                           @Param("emp_name") String emp_name,
                           @Param("phone") String phone,
                           @Param("job") String job,
                           @Param("salary") String salary,
                           @Param("commission_pct") String commission_pct,
                           @Param("department") String department,
                           @Param("hiredate") String hiredate);

    //更新数据
    Integer updateEmp(@Param("emp_no") String emp_no,
                             @Param("phone") String phone,
                             @Param("job") String job,
                             @Param("salary") String salary,
                             @Param("commission_pct") String commission_pct,
                             @Param("department") String department);

    //删除数据
    Integer deleteEmp(@Param("emp_no") String emp_no);

}
