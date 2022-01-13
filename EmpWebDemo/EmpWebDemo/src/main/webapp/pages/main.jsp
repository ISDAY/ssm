<%--
  Created by IntelliJ IDEA.
  User: 吴为
  Date: 2021/10/23
  Time: 10:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
  <head>
    <meta charset="utf-8">
    <title>员工管理</title>
    <!-- BootStrap的核心 CSS 文件 -->
    <link rel="stylesheet" href="../css/bootstrap.min.css">
    <!-- BootStrap的依赖 -->
    <script src="../js/jquery-3.2.1.js"></script>
    <!-- Bootstrap的核心 JS 文件 -->
    <script src="../js/bootstrap.min.js"></script>
    <!-- 引入自定义配置文件 -->
    <link rel="stylesheet" href="../css/style.css">
  </head>
  <body>
    <!-- 顶部导航栏 -->
    <!--头部 用于存放导航栏-->
    <header id="my_header">
      <!--导航条-->
      <nav class="navbar navbar-default navbar-static-top nav_show">
        <div class="container-fluid">
          <!-- 右侧自适应3杠小图标 -->
          <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse"
                    data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
              <span class="sr-only">Toggle navigation</span>
              <span class="icon-bar"></span>
              <span class="icon-bar"></span>
              <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand " href="#">首页</a>
          </div>

          <!-- Collect the nav links, forms, and other content for toggling -->
          <div class="collapse navbar-collapse">
            <ul class="nav navbar-nav">
              <li><a href="#">员工管理 </a></li>
              <li><a href="#">部门管理</a></li>
              <li><a href="#">岗位管理</a></li>
              <li><a href="#">考勤管理</a></li>
              <li><a href="#">工资管理</a></li>
              <li><a href="#">年度考核管理</a></li>
              <li><a href="#">系统管理</a></li>
            </ul>
            <!-- 大中屏幕下右侧显示内容 -->
            <ul class="nav navbar-nav navbar-right hidden-sm hidden-xs">
              <li><a href="#">你好:</a></li>
              <li><a href="#">${user.account}</a></li>
            </ul>
          </div><!-- /.navbar-collapse -->
        </div><!-- /.container-fluid -->
      </nav>
    </header>
    <!--面板-->
    <div id="my_body" class="panel panel-default">
      <!-- Default panel contents -->
      <div class="panel-heading">员工信息总页</div>
      <div class="panel-body">
        <form class="form-inline" id="selectData" action="<%=application.getContextPath()%>/mainPage/findEmpByCondition" method="post">
          <div class="form-group">
            <input type="text" class="form-control" id="num" name="emp_no" placeholder="请输入员工编号">
          </div>
          <div class="form-group">
            <input type="text" class="form-control" id="TXM" name="emp_name" placeholder="请输入员工姓名">
          </div>
          <div class="form-group">
            <select class="form-control" name="department" style="width: 200px;">
              <option value="">--请选择部门--</option>
              <option value="研发部">研发部</option>
              <option value="销售部">销售部</option>
              <option value="售后部">售后部</option>
              <option value="人事部">人事部</option>
              <option value="行政部">行政部</option>
              <option value="安保部">安保部</option>
            </select>
          </div>
          <button type="submit" class="btn btn-success" id="findEmpsBtn" onclick="findEmpByCondition()">
            <i class="glyphicon glyphicon-search"></i> 查询
          </button>
          <button type="reset" class="btn btn-danger">
            <i class="glyphicon glyphicon-repeat"></i> 清除条件
          </button>
          <button type="button" class="btn btn-primary" onclick="reloadData()">
            <i class="glyphicon glyphicon-list-alt"></i> 返回主列表
          </button>
          <button type="button" class="btn btn-info" data-toggle="modal" data-target="#addModal">
            <i class="glyphicon glyphicon-plus"></i> 添加
          </button>
        </form>
      </div>
      <!-- Table -->
      <table class="table table-striped table-bordered text-center show_table">
        <tr id="beforeDate" style="background-color: #CAE8EA;">
          <th><input type="checkbox"></th>
          <th>员工编号</th>
          <th>姓名</th>
          <th>联系电话</th>
          <th>所在岗位</th>
          <th>工资/月</th>
          <th>提成百分比</th>
          <th>所在部门</th>
          <th>入职时间</th>
          <th>相关操作</th>
        </tr>
        <c:forEach var="emp" items="${emps}">
          <tr>
            <td><input type="checkbox"></td>
            <td>${emp.emp_no}</td>
            <td>${emp.emp_name}</td>
            <td>${emp.phone}</td>
            <td>${emp.job}</td>
            <td>${emp.salary}</td>
            <td>${emp.commission_pct}</td>
            <td>${emp.department}</td>
            <td>${emp.hiredate}</td>
            <td>
              <button type="submit" id="updateBtn" class="btn btn-warning" data-toggle="modal" data-target="#updateModal" onclick="showThisData(this)">
                <i class="glyphicon glyphicon-pencil"></i> 修改
              </button>&emsp;
              <button type="button" id="deleteBtn" class="btn btn-danger" onclick="deleteEmp(this)">
                <i class="glyphicon glyphicon-trash"></i> 删除
              </button>
            </td>
          </tr>
        </c:forEach>
      </table>

      <!--面板尾部-->
      <div class="panel-footer show_foot" style="background-color: transparent;">
        <div class="f_left pull-left">
          <p class="pull-left">每页共</p>
          <select class="form-control pull-left input-sm" style="width:50px;">
            <option>5</option>
            <option>10</option>
            <option>15</option>
          </select>
          <p class="pull-left">条记录，显示第xx到第xx条记录，总共xx条记录</p>
        </div>
        <div class="f_right hidden-xs hidden-sm pull-right">
          <!--分页显示-->
          <nav aria-label="Page navigation ">
            <ul class="pagination">
              <li>
                <a href="#" aria-label="Previous">
                  <span aria-hidden="true">&laquo;</span>
                </a>
              </li>
              <li><a href="#">1</a></li>
              <li><a href="#">2</a></li>
              <li><a href="#">3</a></li>
              <li><a href="#">4</a></li>
              <li><a href="#">5</a></li>
              <li><a href="#">...</a></li>
              <li><a href="#">10</a></li>
              <li>
                <a href="#" aria-label="Next">
                  <span aria-hidden="true">&raquo;</span>
                </a>
              </li>
            </ul>
          </nav>
        </div>
      </div>
    </div>

    <!-- 修改按钮的模态框 -->
    <div class="modal fade" id="updateModal" tabindex="-1" role="dialog">
      <div class="modal-dialog" role="document">
        <div class="modal-content">

          <!-- 模态框头部 -->
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                    aria-hidden="true">&times;</span></button>
            <h4 class="modal-title">修改信息</h4>
          </div>

          <!-- 模态框主体 -->
          <div class="modal-body">
            <form id="updateData">
              <div class="form-group">
                <label for="emp_no">员工编号：</label>
                <input type="text" class="form-control" id="emp_no" name="emp_no" readonly="readonly"
                       value="">
              </div>
              <div class="form-group">
                <label for="emp_name">员工姓名：</label>
                <input type="text" class="form-control" id="emp_name" name="emp_name"
                       readonly="readonly" value="">
              </div>
              <div class="form-group">
                <label for="phone">联系电话：</label>
                <input type="text" class="form-control" id="phone" name="phone" placeholder="请输入联系电话："
                       value="">
              </div>
              <div class="form-group">
                <label for="job">所在岗位：</label>
                <input type="text" class="form-control" id="job" name="job" placeholder="请输入员工所在的岗位："
                       value="">
              </div>
              <div class="form-group">
                <label for="salary">工资/月：</label>
                <input type="text" class="form-control" id="salary" name="salary"
                       placeholder="请输入每个月的工资：" value="">
              </div>
              <div class="form-group">
                <label for="commission_pct">提成百分比：</label>
                <input type="text" class="form-control" id="commission_pct" name="commission_pct"
                       placeholder="请输入提成百分比：" value="">
              </div>
              <div class="form-group">
                <label for="department">所在部门：</label>
                <select id="department" class="form-control" name="department" style="width: 200px;">
                  <option value="">--请选择部门--</option>
                  <option value="研发部">研发部</option>
                  <option value="销售部">销售部</option>
                  <option value="售后部">售后部</option>
                  <option value="人事部">人事部</option>
                  <option value="行政部">行政部</option>
                  <option value="安保部">安保部</option>
                </select>
              </div>
              <div class="form-group">
                <label for="hiredate">入职时间：</label>
                <input type="text" class="form-control" id="hiredate" name="hiredate"
                       readonly="readonly" value="">
              </div>
            </form>

          </div>
          <!-- 模态框底部 -->
          <div class="modal-footer">
            <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
            <button type="button" class="btn btn-primary" onclick="submitUpdate()">提交</button>
          </div>
        </div>
      </div>
    </div>

    <!-- 添加信息的模态框 -->
    <div class="modal fade" id="addModal" tabindex="-1" role="dialog">
      <div class="modal-dialog" role="document">
        <div class="modal-content">

          <!-- 模态框头部 -->
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                    aria-hidden="true">&times;</span></button>
            <h4 class="modal-title">添加信息</h4>
          </div>

          <!-- 模态框主体 -->
          <div class="modal-body">
            <form id="addData">
              <div class="form-group">
                <label for="emp_no1">员工编号：</label>
                <input type="text" class="form-control" id="emp_no1" name="emp_no" placeholder="请输入联系电话：" value="">
              </div>
              <div class="form-group">
                <label for="emp_name1">员工姓名：</label>
                <input type="text" class="form-control" id="emp_name1" name="emp_name" placeholder="请输入员工姓名：" value="">
              </div>
              <div class="form-group">
                <label for="phone1">联系电话：</label>
                <input type="text" class="form-control" id="phone1" name="phone" placeholder="请输入联系电话：" value="">
              </div>
              <div class="form-group">
                <label for="job1">所在岗位：</label>
                <input type="text" class="form-control" id="job1" name="job" placeholder="请输入员工所在的岗位："
                       value="">
              </div>
              <div class="form-group">
                <label for="salary1">工资/月：</label>
                <input type="text" class="form-control" id="salary1" name="salary" placeholder="请输入每个月的工资：" value="">
              </div>
              <div class="form-group">
                <label for="commission_pct1">提成百分比：</label>
                <input type="text" class="form-control" id="commission_pct1" name="commission_pct" placeholder="请输入提成百分比：" value="">
              </div>
              <div class="form-group">
                <label for="department1">所在部门：</label>
                <select id="department1" class="form-control" name="department" style="width: 200px;">
                  <option value="">--请选择部门--</option>
                  <option value="研发部">研发部</option>
                  <option value="销售部">销售部</option>
                  <option value="售后部">售后部</option>
                  <option value="人事部">人事部</option>
                  <option value="行政部">行政部</option>
                  <option value="安保部">安保部</option>
                </select>
              </div>
              <div class="form-group">
                <label for="hiredate1">入职时间：</label>
                <input type="date" class="form-control" id="hiredate1" name="hiredate" value="">
              </div>
            </form>

          </div>
          <!-- 模态框底部 -->
          <div class="modal-footer">
            <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
            <button type="button" class="btn btn-primary" onclick="submitAdd()">提交</button>
          </div>
        </div>
      </div>
    </div>

    <script>

      function findEmpByCondition(){
        // 将表单提交即可
        $('#selectData').submit();
      }

      /* 在修改模态框中回显数据 */
      function showThisData(th) {
        /* 获取当前按钮的父元素td，然后获取该元素所有兄弟元素的文本内容 */
        let tds = $(th).parent("td").siblings("td");
        console.log( tds );
        /*获取修改模态框中所有的input元素*/
        let inputs = $('#updateData input');
        console.log( inputs );
        /* 遍历tds并给inputs的value属性赋值 */
        for( let i = 1; i < tds.length; i++ ){
          if (i == 7){
            setOptionSelected(tds[i].innerText);
          }else if (i==8){
            inputs[i-2].value = tds[i].innerText;
          }else{
            inputs[i-1].value = tds[i].innerText;
          }
        }
      }

      /* 将指定的option设置为已选择状态 */
      function setOptionSelected(content) {
        let options = $('#updateData option');
        for ( let i = 0; i < options.length; i++){
          if ( options[i].value == content ){
            options[i].selected = "selected";
          }
        }
      }

      /* 提交修改后的数据 */
      function submitUpdate() {
        /*关闭修改模态框*/
        $('#updateModal').modal('hide');
        /* 使用AJax发送请求并获取响应 */
        $.ajax('<%=application.getContextPath()%>/mainPage/updateEmp',{
          // 请求的类型
          type: 'post',
          // 发送的数据
          data: $('#updateData').serialize(),
          // 接收的数据类型
          dataType: 'text',
          // 回调函数
          success: function (data) {
            if ( data > 0 ){
              alert("修改成功。。。");
            }else{
              alert("修改失败！！！")
            }
            // 不管操作是否成功，均跳转到main.jsp
            window.location.assign('<%=application.getContextPath()%>/mainPage/');
          }
        })
      }

      /* 回到主列表按钮，自动提交数据，保证页面显示的合理性 */
      function reloadData() {
        // 1、点击该按钮，会先将from表单的action（即请求的URL）修改为main
        $('#selectData').attr("action","<%=application.getContextPath()%>/mainPage/");
        // 2、然后提交数据，由于此时请求的是"main"，所以会获取所有的信息并显示
        $('#selectData').submit();
      }

      function submitAdd() {
        /* 隐藏模态框 */
        $('#addModal').modal('hide');
        /* 使用AJax发送请求并获取响应 */
        $.ajax('<%=application.getContextPath()%>/mainPage/addEmp',{
          // 请求的类型
          type: 'post',
          // 发送的数据
          data: $('#addData').serialize(),
          // 接收的数据类型
          dataType: 'text',
          // 回调函数
          success: function (data) {
            if ( data > 0 ){
              alert("添加成功。。。");
            }else{
              alert("添加失败！！！")
            }
            // 不管操作是否成功，均跳转到main.jsp
            window.location.assign('<%=application.getContextPath()%>/mainPage/');

          }
        })
      }

      function deleteEmp(th) {
        if (confirm("确定删除？")){
          /* 获取当前按钮的父元素td，然后获取该元素所有兄弟元素中第二个，即存放emp_no的td元素 */
          let emp_no_td = $(th).parent("td").siblings("td")[1];
          // $th.parent("td").parent("tr")[2].remove();
          // console.log(emp_no_td.innerText);
          $.ajax('<%=application.getContextPath()%>/mainPage/deleteEmp',{
            // 请求的类型
            type: 'get',
            // 发送的数据
            data: 'emp_no='+emp_no_td.innerText,
            // 接收的数据类型
            dataType: 'text',
            // 回调函数
            success: function (data) {

              console.log("hello");
              if ( data > 0 ){
                alert("删除成功。。。");

              }else{
                alert("删除失败！！！")
              }
              // 不管操作是否成功，均跳转到main.jsp
              window.location.assign('<%=application.getContextPath()%>/mainPage/');

            }
          })

        }
      }

    </script>
  </body>
</html>

