<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Change Password</title>
<!-- CSS -->
<link rel="stylesheet" href="assets/css/bootstrap.css">
<link rel="stylesheet" href="assets/css/style.css">
<link rel="stylesheet" href="assets/css/form.css">
<link rel="stylesheet" href="assets/css/title.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<%@include file="component/favicon.jsp"%>
</head>
<body>

        <!-- title -->
        <%@include file="component/title.jsp"%>

        <!-- navbar -->
        <%@include file="component/navbar.jsp"%>

        <!--edit-profile-form-->
            <div class="container mt-3">
        <div class="col-lg-12 col-md-12" id="signup">
            <ul class="nav nav-tabs nav-justified">
                <li class="nav-item"><a class="nav-link active"
                   >Change Password</a></li>
                <li class="nav-item"><a
                    class="nav-link"  href="profile">Edit Profile</a></li>
            </ul>
            <div class="account-holder py-0">
                <h3 class="mt-3 mb-0">Change Password</h3>
                <br>
                <form id="passowrdForm">
                
                     <div class="row">
                        <div class="col-lg-12 col-md-12">
                            <div class="form-group">
                                <label class="control-label required"
                                    for="oldpassword">Old Password<sup style="color: red">*</sup>
                                </label> <input id="oldpassword" name="oldpassword"
                                    type="password" class="form-control"
                                    placeholder="Enter old password">
                            </div>
                        </div>
                    </div>
                  <div class="row">
                        <div class="col-lg-12 col-md-12">
                            <div class="form-group">
                                <label class="control-label required"
                                    for="password">New Password <sup
                                    style="color: red">*</sup>
                                </label> <input id="password" name="password"
                                    type="password" class="form-control"
                                    placeholder="Enter new password">
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
                                            style="color: red;"></i>
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
                                    for="passwordr">Confirm New
                                    Password <sup style="color: red">*</sup>
                                </label> <input id="passwordr" name="passwordr"
                                    type="password" class="form-control"
                                    placeholder="Confirm new password">
                                        <span id="passCheck" hidden=1><i
                                            class="fa fa-times"
                                            aria-hidden="true"
                                            style="color: red;"></i>
                                            Passwords do not match</span> <span
                                            id="passCheck2" hidden=1><i
                                            class="fa fa-check"
                                            aria-hidden="true"
                                            style="color: green;"></i>
                                            Passwords match</span>
                            </div>
                        </div>
                    </div>  

                    <div class="row">
                        <div class="col-lg-12 col-md-12">
                            <button class="btn btn-primary btn-block" id="save">Save</button>
                        </div>
                    </div>
                </form>
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
    <script src="assets/js/main.js"></script>
    <script src="assets/js/password.js"></script>
</body>
</html>
