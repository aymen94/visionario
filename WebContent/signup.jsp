<%--
  Created by IntelliJ IDEA.
  User: aymen
  Date: 08/05/2018
  Time: 10:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
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
<link rel="stylesheet"
    href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<body>
    <div class="container">

        <!-- title -->
        <%@include file="component/title.jsp"%>

        <!--sign-up-form-->
        <div class="col-lg-12 col-md-12" id="signup">
            <ul class="nav nav-tabs nav-justified">
                <li class="nav-item"><a class="nav-link"
                    href="signin">Sign In</a></li>
                <li class="nav-item"><a
                    class="nav-item nav-link active">Sign up</a></li>
            </ul>
            <div class="account-holder">
                <h3>Signup</h3>
                <br>
                <form id="signupform">
                    <div class="row">
                        <div class="col-sm-6">
                            <div class="form-group">
                                <label class="control-label required"
                                    for="firstname"> First Name
                                    <sup style="color: red">*</sup>
                                </label> <input id="firstname" name="name"
                                    type="text" class="form-control"
                                    placeholder="Enter Your Name">
                            </div>
                        </div>
                        <div class="col-sm-6">
                            <div class="form-group">
                                <label class="control-label required"
                                    for="surname"> Surname <sup
                                    style="color: red">*</sup>
                                </label> <input id="surname" name="surname"
                                    type="text" class="form-control"
                                    placeholder="Enter Your Surname">
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-6 col-md-4 col-sm-12">
                            <div class="form-group">
                                <label class="control-label required"
                                    for="birthday">Birthday <sup
                                    style="color: red">*</sup>
                                </label>
                                <!-- We make the birthday fields of type text when it is not blur, in order to show placeholder -->
                                <input placeholder="Enter Your Birthday"
                                    class="form-control" type="text"
                                    onfocus="(this.type='date')"
                                    onblur="(this.type='text')"
                                    id="birthday">
                            </div>
                        </div>
                        <div class="col-lg-6 col-md-8 col-sm-12">
                            <div class="form-group">
                                <label class="control-label required"
                                    for="gender">Gender <sup
                                    style="color: red">*</sup>
                                </label>
                                <div class="row-radio">
                                    <div
                                        class="form-check form-check-inline">
                                        <input class="form-check-input"
                                            type="radio" name="gender"
                                            id="genderM" value="M">
                                        <label class="form-check-label"
                                            for="genderM">Male</label>
                                    </div>
                                    <div
                                        class="form-check form-check-inline">
                                        <input class="form-check-input"
                                            type="radio" name="gender"
                                            id="genderF" value="F">
                                        <label class="form-check-label"
                                            for="genderF">Female</label>
                                    </div>
                                    <div
                                        class="form-check form-check-inline">
                                        <input class="form-check-input"
                                            type="radio" name="gender"
                                            id="genderN" value="null">
                                        <label class="form-check-label"
                                            for="genderN">Other</label>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-12 col-md-12">
                            <div class="form-group">
                                <label class="control-label required"
                                    for="email">Email <sup
                                    style="color: red">*</sup>
                                </label> <input id="email" name="email"
                                    type="email" class="form-control"
                                    placeholder="Enter Email Address">
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-12 col-md-12">
                            <div class="form-group">
                                <label class="control-label required"
                                    for="password">Password <sup
                                    style="color: red">*</sup>
                                </label> <input id="password" name="password"
                                    type="password" class="form-control"
                                    placeholder="Enter password">
                                <div class="row" id=passInfo hidden=1>
                                    <div class="col-sm-6">
                                        <span id="long"><i
                                            id="longC"
                                            class="fa fa-times"
                                            aria-hidden="true"
                                            style="color: red;"></i> 8
                                            Minimum Characters<br>
                                        </span> <span id="upper"><i
                                            id="upperC"
                                            class="fa fa-times"
                                            aria-hidden="true"
                                            style="color: red;"></i> 1
                                            Uppercase Letter<br></span>
                                    </div>
                                    <div class="col-sm-6">
                                        <span id="lower"><i
                                            id="lowerC"
                                            class="fa fa-times"
                                            aria-hidden="true"
                                            style="color: red;"></i> 1
                                            Lowercase Letter<br></span> <span
                                            id="N"><i id="passN"
                                            class="fa fa-times"
                                            aria-hidden="true"
                                            style="color: red;"></i> 1
                                            Number<br></span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-12 col-md-12">
                            <div class="form-group">
                                <label class="control-label required"
                                    for="passwordr">Confirm
                                    Password <sup style="color: red">*</sup>
                                </label> <input id="passwordr" name="passwordr"
                                    type="password" class="form-control"
                                    placeholder="Confirm password">
                                <div class="row">
                                    <div class="col-sm-12">
                                        <span id="passCheck" hidden=1><i
                                            id="passM"
                                            class="fa fa-times"
                                            aria-hidden="true"
                                            style="color: red;"></i>
                                            Passwords do not match</span> <span
                                            id="passCheck2" hidden=1><i
                                            id="passM"
                                            class="fa fa-check"
                                            aria-hidden="true"
                                            style="color: green;"></i>
                                            Passwords match</span><br>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class=row>
                        <div class="col-lg-12 col-md-12">
                            <div class="mb30">
                                <p>
                                    Already have an account? <a
                                        id="accountLogin">Login</a>
                                </p>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-12 col-md-12">
                            <button class="btn btn-primary btn-block">Sign
                                up</button>
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
