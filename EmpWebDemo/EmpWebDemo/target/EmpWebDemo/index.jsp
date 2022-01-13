<%--
  Created by IntelliJ IDEA.
  User: ch
  Date: 2021/10/25
  Time: 12:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
  <html>
  <head>
    <meta charset="utf-8">
    <title>登录</title>
    <meta name="viewport" content="width=device-width, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <link rel='stylesheet' href="css/bootstrap.min.index.css">
    <link rel='stylesheet' href="css/perfect-scrollbar.min.css">
    <link rel="stylesheet" href="css/style.index.css">
    <script src="js/jquery-3.2.1.min.js"></script>
  </head>

  <body>
    <div class="container-fluid">
      <div class="row no-gutters">
        <div class="col-12 col-sm-12 col-md-12 col-lg-5 text-center left__section">
          <div class="dowebok">
            <h1 class="heading my-5">用户登陆</h1>
            <p class="showMsg"><font color="red">${msg}</font></p>
            <p class="paragraph">请使用账号密码或第三方账号登陆</p>
            <form id="loginForm" action="./login" class="mt-4" method="post">
              <div class="input-group my-4">
                <div class="input-group-prepend">
                  <label for="formGroupExampleInput" class="d-block mx-auto"><img src="img/8dq.svg"
                                                                                  width="18" height="18" class="mt-2"></label>
                </div>
                <input type="text" class="form-control" placeholder="请输入账号" aria-label=""
                       aria-describedby="basic-addon1" name="account" value="">
              </div>
              <div class="input-group my-4">
                <div class="input-group-prepend">
                  <label for="formGroupExampleInput" class="d-block mx-auto"><img src="img/8dT.svg"
                                                                                  width="18" height="18" class="mt-2"></label>
                </div>
                <input type="text" class="form-control" placeholder="请输入密码" aria-label=""
                       aria-describedby="basic-addon1" name="pwd" value="">
              </div>
              <div class="d-flex justify-content-between align-items-center">
                <a href="javascript:" class="link">忘记密码？</a>
                <button type="button" class="btn btn-primary" onclick="login()">登陆</button>
              </div>
              <div class="form-check float-left my-3">
                <input class="form-check-input" type="checkbox" name="unForgetMe" value="checked" id="defaultCheck1">
                <label class="form-check-label" for="defaultCheck1">5天内可免账号密码登录</label>
              </div>
            </form>
            <div class="col-12 my-4">
              <span class="divider">或者</span>
            </div>
            <div class="btn-group" role="group" aria-label="Basic example">
              <button type="button" class="btn btn-primary ">
                <img src="img/8fh.svg" width="20" height="20" alt="">
              </button>
              <button type="button" class="btn btn-primary btn-facebook">使用 Twitter 账号登陆</button>
            </div>
          </div>
        </div>

        <div class="col-12 col-sm-12 col-md-12 col-lg-7">
          <div class="bg">
          </div>
        </div>
      </div>
    </div>

    <script>
      function login(){
        $('#loginForm').submit();
      }
    </script>

  </body>
</html>
