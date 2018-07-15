<%--
  ~ Copyright (c) 2018. Visionario
  --%>

<%--
  Created by IntelliJ IDEA.
  User: aymen
  Date: 06/07/2018
  Time: 14:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">

    <title>Manage User| Visionario Dashboard</title>

    <!-- style -->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/bootstrap.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/admin/assets/css/admin.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<body>
<jsp:useBean id="model" class="model.UserModel" />
<body>
<div id="wrapper" class="animate">
    <!-- menu -->
    <%@include file="/admin/component/menu.jsp"%>

    <div class="container-fluid">
        <div class="row">
            <div class="col">
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title">Users List</h5>
                        <table class="table table-hover">
                            <div class="row col">
                                <input class="form-control col m-1" id="myInput" type="text" placeholder="Search..">
                                <button class="btn btn-primary col-2 m-1" data-toggle="modal" data-target="#adduser"><i class="fa fa-user-plus"></i> New User</button>
                            </div>
                            <thead>
                            <tr>
                                <th scope="col">id</th>
                                <th scope="col">FirstName</th>
                                <th scope="col">LastName</th>
                                <th scope="col">email</th>
                                <th scope="col">sex</th>
                                <th scope="col">birth</th>
                                <th scope="col">permission</th>
                                <th scope="col">Edit</th>
                                <th scope="col">Delete</th>
                            </tr>
                            </thead>
                            <tbody id="myTable">
                            <c:forEach var="l" items="${model.doRetrieveAll()}">
                               <c:choose>
                                    <c:when test="${l.password==null}">
                                        <tr class="table-danger">
                                    </c:when>
                                    <c:otherwise>
                                        <tr>
                                    </c:otherwise>
                               </c:choose>
                                    <th scope="row">${l.id}</th>
                                    <td >${l.name}</td>
                                    <td >${l.surname}</td>
                                    <td >${l.email}</td>
                                    <td >${l.sex}</td>
                                    <td >${l.birth}</td>
                                    <td >${l.permission}</td>
                                    <td ><button class="btn btn-warning"><i class="fa fa-pencil"></i></button></td>
                                    <td ><button class="btn btn-danger"><i class="fa fa-trash"></i></button></td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
    </div>
</div>

    <!-- The Modal -->
    <div class="modal fade" id="adduser" role="dialog" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">New message</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
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
                                    <input placeholder="Enter Your Birthday"
                                           class="form-control" type="date"
                                           id="birthday">
                                </div>
                            </div>
                            <div class="col-lg-6 col-md-8 col-sm-12">
                                <div class="form-group">
                                    <label class="control-label required"
                                           for="gender">Gender <sup
                                            style="color: red">*</sup>
                                    </label>
                                    <div class="row-radio" id="gender" >
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
                                                   id="genderN" value="O">
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
                                                    type="text" class="form-control"
                                                    placeholder="Enter password">
                                    </div>
                                </div>
                            </div>
                        <div class="row">
                            <div class="col-lg-12 col-md-12">
                                <div class="form-group">
                                    <label for="permission">Permission</label>
                                    <select class="form-control" id="permission">
                                        <option value="0">user</option>
                                        <option value="1">admin</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" id="adduserb" class="btn btn-success">add</button>
                    <button type="button" class="btn btn-danger" data-dismiss="modal">cancel</button>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- script -->
<script src="<%=request.getContextPath()%>/assets/js/jquery.min.js"></script>
<script src="<%=request.getContextPath()%>/assets/js/bootstrap.js"></script>
<script src="<%=request.getContextPath()%>/admin/assets/js/admin.js"></script>
<script src="<%=request.getContextPath()%>/admin/assets/js/user.js"></script>
</body>
</html>

