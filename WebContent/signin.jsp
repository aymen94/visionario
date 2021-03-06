<%--
  Created by IntelliJ IDEA.
  User: aymen
  Date: 02/05/2018
  Time: 11:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Sign In</title>
<!-- CSS -->
<link rel="stylesheet" href="assets/css/bootstrap.css">
<link rel="stylesheet" href="assets/css/style.css">
<link rel="stylesheet" href="assets/css/form.css">
<link rel="stylesheet" href="assets/css/title.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<%@include file="component/favicon.jsp"%>
</head>
<body>
    <div class="container">

        <!-- title -->
        <%@include file="component/title.jsp"%>

        <!--sign-in-form-->
        <div class="col-lg-12 col-md-12" id="signin">
            <ul class="nav nav-tabs nav-justified">
                <li class="nav-item"><a class="nav-link active">Sign
                        In</a></li>
                <li class="nav-item"><a class="nav-link "
                    href="signup">Sign up</a></li>
            </ul>
            <div class="account-holder">
                <h3>Sign In</h3>
                <br>
                <form>
                    <div class="row">
                        <div class="col-lg-12 col-md-12">
                            <div class="form-group">
                                <label class="control-label required"
                                    for="email">Email <sup
                                    style="color: red">*</sup>
                                </label> <input id="email" name="email"
                                    type="text" class="form-control"
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
                                    placeholder="password">
                            </div>
                            <a href="#" class="forgot-password" id="forgot">Forgot
                                Password?</a>
                        </div>
                    </div>
                    <div class="row d-none">

                        <div class="col-lg-12 col-md-12">
                            <div class="form-check-inline">
                                <input class="form-check-input"
                                    type="checkbox" value=""
                                    id="defaultCheck1"> <label
                                    class="form-check-label"
                                    for="defaultCheck1">Remember
                                    me</label>
                            </div>
                        </div>
                    </div>
                    <div class="row">

                        <div class="col-lg-12 col-md-12">
                            <button class="btn btn-primary btn-block" id="bsignin">Sign In</button>
                        </div>
                    </div>
                </form>

                <!-- The Modal -->
                <div class="modal fade" id="myModal">
                    <div class="modal-dialog">
                        <div class="modal-content">

                            <!-- Modal Header -->
                            <div class="modal-header">
                                <h5 class="modal-title"></h5>
                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                            </div>

                            <!-- Modal body -->
                            <div class="modal-body">

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Footer -->
    <%@include file="component/footer.jsp"%>

    <!-- Javascript -->
    <script src="assets/js/jquery.min.js"></script>
    <script src="assets/js/bootstrap.js"></script>
    <script src="assets/js/signin.js"></script>
</body>
</html>
