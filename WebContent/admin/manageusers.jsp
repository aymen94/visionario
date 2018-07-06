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
    <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/admin.css">
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
                            <tbody>
                            <c:forEach var="l" items="${model.doRetrieveAllUsers()}">
                                <tr>
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

<!-- script -->
<script src="<%=request.getContextPath()%>/assets/js/jquery.min.js"></script>
<script src="<%=request.getContextPath()%>/assets/js/bootstrap.js"></script>
<script src="<%=request.getContextPath()%>/assets/js/admin.js"></script>
</body>
</html>

