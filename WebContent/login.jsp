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
    <title> Login and Register</title>
    <!-- CSS -->
    <link rel="stylesheet" href="assets/css/bootstrap.css">
    <link rel="stylesheet" href="assets/css/login.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<body>
<div class="container">
    <div class="btnselect row justify-content-center">
        <button class="btn btn-primary btn-block col-md-4" id="login">Login</button>
        <h3>or</h3>
        <button class="btn btn-primary btn-block col-md-4" id="signup">Signup</button>
    </div>
    <!--login-form-->
    <div class="col-lg-12 col-md-12" id="loginform">
        <div class="account-holder">
            <h3>Login</h3>
            <br>
            <form>
                <div class="col-lg-12 col-md-12">
                    <div class="form-group">
                        <label class="control-label required" for="email">Email
                            <sup style="color:red">*</sup>
                        </label>
                        <input name="email" type="text" class="form-control" placeholder="Enter Email Address">
                    </div>
                </div>
                <div class="col-lg-12 col-md-12">
                    <div class="form-group">
                        <label class="control-label required" for="email">Password
                            <sup style="color:red">*</sup>
                        </label>
                        <input name="password" type="password" class="form-control" placeholder="password">
                    </div>
                    <a href="#" class="forgot-password">Forgot Password?</a>
                </div>
                <div class="col-lg-12 col-md-12">
                    <button class="btn btn-primary btn-block">Login</button>
                </div>
                <div class="col-lg-12 col-md-12">
                     <div class="form-check">
                         <input class="form-check-input" type="checkbox" value="" id="defaultCheck1">
                         <label class="form-check-label" for="defaultCheck1">Remember me</label>
                     </div>
                </div>
            </form>
        </div>
    </div>

    <!--sing-up-form-->
    <div class="col-lg-12 col-md-12" id="signupform">
        <div class="account-holder">
            <h3>Signup</h3>
            <br>
            <form>
                <div class="col-lg-12 col-md-12">
                    <div class="form-group">
                        <label class="control-label required" for="name"> Name
                            <sup style="color:red">*</sup>
                        </label>
                        <input name="name" type="text" class="form-control" placeholder="Enter Your Name">
                    </div>
                </div>
                <div class="col-lg-12 col-md-12">
                    <div class="form-group">
                        <label class="control-label required" for="name"> Surname
                            <sup style="color:red">*</sup>
                        </label>
                        <input name="surname" type="text" class="form-control" placeholder="Enter Your Surname">
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
                        <input name="email" type="email" class="form-control" placeholder="Enter Email Address">
                    </div>
                </div>
                <div class="col-lg-12 col-md-12">
                    <div class="form-group">
                        <label class="control-label required" for="password">Password
                            <sup style="color:red">*</sup>
                        </label>
                        <input name="password" type="password" class="form-control" placeholder="password">
                    </div>
                    <div class="mb30">
                        <p>Already have an account?
                            <a href="#">Login</a>
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
<script src="assets/js/login.js"></script>
</body>
</html>
