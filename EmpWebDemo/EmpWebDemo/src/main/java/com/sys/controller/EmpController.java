package com.sys.controller;

import com.sys.bean.Employee;
import com.sys.service.EmpService;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping("/mainPage")
public class EmpController {

    @Autowired
    EmpService empService;

    //跳转到main.jsp
    @RequestMapping("/")
    public String toMainpage(Model model){
        List<Employee> emps = empService.findAllEmp();
        model.addAttribute("emps",emps);

        return "main";
    }

    @RequestMapping("/findEmpByCondition")
    public String findEmpByCondition(@RequestParam("emp_no") String emp_no, @RequestParam("emp_name") String emp_name, @RequestParam("department") String department, Model model){
        List<Employee> emps = empService.findEmpByCondition(emp_no, emp_name, department);
        model.addAttribute("emps",emps);
        return "main";
    }


    @RequestMapping(value = "/addEmp", produces = "text/plain;charset=UTF-8")
    @ResponseBody
    public String addEmp(@RequestParam("emp_no") String emp_no, @RequestParam("emp_name") String emp_name, @RequestParam("phone") String phone,@RequestParam("job") String job,@RequestParam("salary") String salary,@RequestParam("commission_pct") String commission_pct,@RequestParam("department") String department,@RequestParam("hiredate") String hiredate){
        Integer row = empService.addEmp(emp_no,emp_name,phone,job,salary,commission_pct,department,hiredate);
        return row.toString();
    }


    @RequestMapping(value = "/updateEmp", produces = "text/plain;charset=UTF-8")
    @ResponseBody
    public String updateEmp(@RequestParam("emp_no") String emp_no,@RequestParam("phone") String phone,@RequestParam("job") String job,@RequestParam("salary") String salary,@RequestParam("commission_pct") String commission_pct,@RequestParam("department") String department){
        Integer row= empService.updateEmp(emp_no,phone,job,salary,commission_pct,department);
        return row.toString();

    }

    @RequestMapping(value = "/deleteEmp", produces = "text/plain;charset=UTF-8")
    @ResponseBody
    public String deleteEmp(@RequestParam("emp_no") String emp_no){
        Integer row = empService.deleteEmp(emp_no);
        return row.toString();
    }

}
