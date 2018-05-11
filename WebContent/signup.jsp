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
    <title>Sign up</title>
    <!-- CSS -->
    <link rel="stylesheet" href="assets/css/bootstrap.css">
    <link rel="stylesheet" href="assets/css/style.css">
    <link rel="stylesheet" href="assets/css/form.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<body>
<div class="container">

    <!-- title -->
    <%@include file="component/title.jsp"%>

    <!--sign-up-form-->
    <div class="col-lg-12 col-md-12" id="signup">
        <ul class="nav nav-tabs text-center">
            <li class="col-md-6"><a class="btn btn-primary btn-block" href="signin">Login</a></li>
            <li class="col-md-6"><a class="btn btn-primary btn-block active" >Sing up</a></li>
        </ul>
        <div class="account-holder">
            <h3>Signup</h3>
            <br>
            <form>
                <div class="col-lg-12 col-md-12">
                    <div class="form-group">
                        <label class="control-label required" for="firstname"> First Name
                            <sup style="color:red">*</sup>
                        </label>
                        <input id="firstname" name="name" type="text" class="form-control" placeholder="Enter Your Name">
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
                        <div class="row">
                            <div class="col-sm-6">
                               <span><i id="longC" class="fa fa-times" aria-hidden="true" style="color:red;"></i>8 Minimum Characters </span><br>
                               <span><i id="upperC" class="fa fa-times" aria-hidden="true" style="color:red;"></i>1 Uppercase Letter</span>
                            </div>
                            <div class="col-sm-6">
                                <span><i id="lowerC" class="fa fa-times" aria-hidden="true" style="color:red;"></i>1 Lowercase Letter</span><br>
                                <span><i id="passN" class="fa fa-times" aria-hidden="true" style="color:red;"></i>1 Number</span>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label required" for="passwordr">Repeat Password
                            <sup style="color:red">*</sup>
                        </label>
                        <input id="passwordr" name="passwordr" type="password" class="form-control" placeholder="Repeat password">
                        <div class="row">
                            <div class="col-sm-12">
                                <span><i id="passM" class="fa fa-times" aria-hidden="true" style="color:red;"></i>match</span><br>
                            </div>
                        </div>
                    <div class="mb30">
                        <p>Already have an account?
                            <a id="accountLogin">Login</a>
                        </p>
                    </div>
                </div>
                <div class="col-lg-12 col-md-12">
                    <button class="btn btn-primary btn-block">Sign up</button>
                </div>
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
<script src="assets/js/signup.js"></script>
</body>
</html>