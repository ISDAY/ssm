package com.sys.bean;

import java.util.Date;

/**
 * @program: EmpWebDemo
 * @description:
 * @author: DW
 * @create: 2021-11-16 18:27
 */
public class Employee {
    private Integer id;
    private String emp_no;
    private String emp_name;
    private String phone;
    private String job;
    private Double salary;
    private Double commission_pct;
    private String department;
    private String hiredate;

    public Employee() {
    }

    public Employee(Integer id, String emp_no, String emp_name, String phone, String job, Double salary, Double commission_pct, String department, String hiredate) {
        this.id = id;
        this.emp_no = emp_no;
        this.emp_name = emp_name;
        this.phone = phone;
        this.job = job;
        this.salary = salary;
        this.commission_pct = commission_pct;
        this.department = department;
        this.hiredate = hiredate;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getEmp_no() {
        return emp_no;
    }

    public void setEmp_no(String emp_no) {
        this.emp_no = emp_no;
    }

    public String getEmp_name() {
        return emp_name;
    }

    public void setEmp_name(String emp_name) {
        this.emp_name = emp_name;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getJob() {
        return job;
    }

    public void setJob(String job) {
        this.job = job;
    }

    public Double getSalary() {
        return salary;
    }

    public void setSalary(Double salary) {
        this.salary = salary;
    }

    public Double getCommission_pct() {
        return commission_pct;
    }

    public void setCommission_pct(Double commission_pct) {
        this.commission_pct = commission_pct;
    }

    public String getDepartment() {
        return department;
    }

    public void setDepartment(String department) {
        this.department = department;
    }

    public String getHiredate() {
        return hiredate;
    }

    public void setHiredate(String hiredate) {
        this.hiredate = hiredate;
    }

    @Override
    public String toString() {
        return "Employee{" +
                "id=" + id +
                ", emp_no='" + emp_no + '\'' +
                ", emp_name='" + emp_name + '\'' +
                ", phone='" + phone + '\'' +
                ", job='" + job + '\'' +
                ", salary=" + salary +
                ", commission_pct=" + commission_pct +
                ", department='" + department + '\'' +
                ", hiredate=" + hiredate +
                '}';
    }
}
