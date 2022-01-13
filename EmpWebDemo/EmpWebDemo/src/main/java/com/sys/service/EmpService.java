package com.sys.service;

import com.sys.bean.Employee;
import com.sys.mapper.EmpMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class EmpService {

    @Autowired
    EmpMapper empMapper;

    /**
     * 查询所有用户信息
     * @return
     */
    public List<Employee> findAllEmp(){
        List<Employee> emps = empMapper.findEmp(null, null, null);
        return emps;
    }

    /**
     * 多条件查询
     * @return
     */
    public List<Employee> findEmpByCondition(String emp_no, String emp_name, String department){
        List<Employee> emps = empMapper.findEmp(emp_no, emp_name, department);
        return emps;
    }

    /**
     * 添加数据
     * @return
     */
    public Integer addEmp(String emp_no, String emp_name,String phone, String job, String salary, String commission_pct, String department, String hiredate){
        Integer emps = empMapper.addEmp(emp_no, emp_name,phone,job,salary,commission_pct, department,hiredate);
        return emps;
    }

    /**
     * 更新数据
     * @return
     */
    public Integer updateEmp(String emp_no,String phone, String job, String salary, String commission_pct, String department){
        Integer emps = empMapper.updateEmp(emp_no,phone,job,salary,commission_pct, department);
        return emps;
    }

    /**
     * 删除数据
     * @return
     */
    public Integer deleteEmp(String emp_no){
        Integer emps = empMapper.deleteEmp(emp_no);
        return emps;
    }

}
