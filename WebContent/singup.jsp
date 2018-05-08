<%--
  Created by IntelliJ IDEA.
  User: aymen
  Date: 08/05/2018
  Time: 10:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Sing up</title>
    <!-- CSS -->
    <link rel="stylesheet" href="assets/css/bootstrap.css">
    <link rel="stylesheet" href="assets/css/login.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<body>
<div class="container">

    <!-- title -->
    <%@include file="component/title.jsp"%>

    <!--sing-up-form-->
    <div class="col-lg-12 col-md-12" id="signup">
        <ul class="nav nav-tabs text-center">
            <li class="col-md-6"><a class="btn btn-primary btn-block" href="login.jsp">Login</a></li>
            <li class="col-md-6"><a class="btn btn-primary btn-block active" >Sing up</a></li>
        </ul>
        <div class="account-holder">
            <h3>Signup</h3>
            <br>
            <form>
                <div class="col-lg-12 col-md-12">
                    <div class="form-group">
                        <label class="control-label required" for="name"> Name
                            <sup style="color:red">*</sup>
                        </label>
                        <input id="name" name="name" type="text" class="form-control" placeholder="Enter Your Name">
                    </div>
                </div>
                <div class="col-lg-12 col-md-12">
                    <div class="form-group">
                        <label class="control-label required" for="surname"> Surname
                            <sup style="color:red">*</sup>
                        </label>
                        <input id="surname" name="surname" type="text" class="form-control" placeholder="Enter Your Surname">
                    </div>
                </div>
                <div class="col-lg-12 col-md-12">
                    <div class="form-group">
                        <label class="control-label required" for="phone">Phone
                            <sup style="color:red">*</sup>
                        </label>
                        <input id="phone" name="phone" type="text" class="form-control" placeholder="Enter Mobile Number">
                    </div>
                </div>
                <div class="col-lg-12 col-md-12">
                    <div class="form-group">
                        <label class="control-label required" for="email">Email
                            <sup style="color:red">*</sup>
                        </label>
                        <input id="email" name="email" type="email" class="form-control" placeholder="Enter Email Address">
                    </div>
                </div>
                <div class="col-lg-12 col-md-12">
                    <div class="form-group">
                        <label class="control-label required" for="password">Password
                            <sup style="color:red">*</sup>
                        </label>
                        <input id="password" name="password" type="password" class="form-control" placeholder="Enter password">
                    </div>
                    <div class="form-group">
                        <label class="control-label required" for="passwordr">Repeat Password
                            <sup style="color:red">*</sup>
                        </label>
                        <input id="passwordr" name="passwordr" type="password" class="form-control" placeholder="Repeat password">
                    </div>
                    <div class="mb30">
                        <p>Already have an account?
                            <a id="accountLogin">Login</a>
                        </p>
                    </div>
                </div>
                <div class="col-lg-12 col-md-12">
                    <button class="btn btn-primary btn-block">Register</button>
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
<script src="assets/js/singup.js"></script>
</body>
</html>
