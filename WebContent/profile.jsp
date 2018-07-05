<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Profile</title>
<!-- CSS -->
<link rel="stylesheet" href="assets/css/bootstrap.css">
<link rel="stylesheet" href="assets/css/style.css">
<link rel="stylesheet" href="assets/css/form.css">
<link rel="stylesheet" href="assets/css/title.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<body>

        <!-- title -->
        <%@include file="component/title.jsp"%>

        <!-- navbar -->
        <%@include file="component/navbar.jsp"%>

        <!--edit-profile-form-->
            <div class="container mt-3">
        <div class="col-lg-12 col-md-12" id="signup">
            <ul class="nav nav-tabs nav-justified">
                <li class="nav-item"><a class="nav-link"
                    href="profile?password">Change Password</a></li>
                <li class="nav-item"><a
                    class="nav-link active">Edit Profile</a></li>
            </ul>
            <div class="account-holder py-0">
                <h3 class="mt-3 mb-0">Edit Profile</h3>
                <br>
                <form id="signupform">
                    <div class="row">
                        <div class="col-sm-6">
                            <div class="form-group">
                                <label class="control-label required"
                                    for="firstname"> First Name <sup
                                    style="color: red">*</sup>
                                </label> <input id="firstname" name="name" type="text"
                                    class="form-control" value="${user.name}">
                            </div>
                        </div>
                        <div class="col-sm-6">
                            <div class="form-group">
                                <label class="control-label required"
                                    for="surname"> Surname <sup
                                    style="color: red">*</sup>
                                </label> <input id="surname" name="surname" type="text"
                                    class="form-control" value="${user.surname}">
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
                                <input class="form-control" type="date"
                                    value="${user.birth}" id="birthday">
                            </div>
                        </div>
                        <div class="col-lg-6 col-md-8 col-sm-12">
                            <div class="form-group">
                                <label class="control-label required"
                                    for="gender">Gender <sup
                                    style="color: red">*</sup>
                                </label>
                                <div class="row-radio" id="gender">
                                    <c:forEach items="Male,Female,Other"
                                        var="gender">
                                        <div
                                            class="form-check form-check-inline">
                                            <input class="form-check-input"
                                                type="radio" name="gender"
                                                id="gender${gender.charAt(0)}"
                                                value="${gender.charAt(0)}"
                                                <c:if test="${user.sex==gender.charAt(0)}">
                                                checked
                                                </c:if>>
                                            <label class="form-check-label"
                                                for="gender${gender.charAt(0)}">${gender}</label>
                                        </div>
                                    </c:forEach>
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
                                </label> <input id="email" name="email" type="email"
                                    class="form-control" value="${user.email}">
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
    <script src="assets/js/signup.js"></script>
    <script src="assets/js/profile.js"></script>
</body>
</html>
