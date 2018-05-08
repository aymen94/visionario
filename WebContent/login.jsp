<%--
  Created by IntelliJ IDEA.
  User: aymen
  Date: 02/05/2018
  Time: 11:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Login</title>
    <!-- CSS -->
    <link rel="stylesheet" href="assets/css/bootstrap.css">
    <link rel="stylesheet" href="assets/css/login.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<body>
<div class="container">

    <!-- title -->
    <%@include file="component/title.jsp"%>

    <!--login-form-->
    <div class="col-lg-12 col-md-12" id="login">
        <ul class="nav nav-tabs text-center">
            <li class="col-md-6"><a class="btn btn-primary btn-block active ">Login</a></li>
            <li class="col-md-6"><a class="btn btn-primary btn-block" href="singup.jsp">Sing up</a></li>
        </ul>
        <div class="account-holder">
            <h3>Login</h3>
            <br>
            <form name="loginform">
                <div class="col-lg-12 col-md-12">
                    <div class="form-group">
                        <label class="control-label required" for="email">Email
                            <sup style="color:red">*</sup>
                        </label>
                        <input id="email" name="email" type="text" class="form-control" placeholder="Enter Email Address">
                    </div>
                </div>
                <div class="col-lg-12 col-md-12">
                    <div class="form-group">
                        <label class="control-label required" for="password">Password
                            <sup style="color:red">*</sup>
                        </label>
                        <input id="password" name="password" type="password" class="form-control" placeholder="password">
                    </div>
                    <a href="#" class="forgot-password">Forgot Password?</a>
                </div>
                <div class="col-lg-12 col-md-12">
                    <div class="form-check">
                        <input class="form-check-input" type="checkbox" value="" id="defaultCheck1">
                        <label class="form-check-label" for="defaultCheck1">Remember me</label>
                    </div>
                </div>
                <div class="col-lg-12 col-md-12">
                    <button class="btn btn-primary btn-block">Login</button>
                </div>
            </form>
        </div>
    </div>
</div>

<!-- Footer -->
<%@include file="component/footer.jsp"%>

<!-- Javascript -->
<script src="assets/js/jquery.min.js"></script>
<script src="assets/js/bootstrap.js"></script>
<script src="assets/js/login.js"></script>
</body>
</html>
