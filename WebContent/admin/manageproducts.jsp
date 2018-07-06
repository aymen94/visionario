<%--
  ~ Copyright (c) 2018. Visionario
  --%>

<%--
  Created by IntelliJ IDEA.
  User: aymen
  Date: 06/07/2018
  Time: 17:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">

    <title>Manage Products| Visionario Dashboard</title>

    <!-- style -->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/bootstrap.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/admin.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<body>
<jsp:useBean id="model" class="model.ProductModel" />
<body>
<div id="wrapper" class="animate">
    <!-- menu -->
    <%@include file="/admin/component/menu.jsp"%>

    <div class="container-fluid">
        <div class="row">
            <div class="col">
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title">Products List</h5>
                        <table class="table">
                            <thead>
                            <tr>
                                <th scope="col">id</th>
                                <th scope="col">Title</th>
                                <th scope="col">Price</th>
                                <th scope="col">Reviews</th>
                                <th scope="col">image</th>
                                <th scope="col">Edit</th>
                                <th scope="col">Delete</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach var="l" items="${model.doRetrieveAll()}">
                                <tr>
                                    <th scope="row">${l.id}</th>
                                    <td >${l.title}</td>
                                    <td >${l.minPrice} - ${l.maxPrice}</td>
                                    <td >${l.numReviews}</td>
                                    <td >${l.defaultImage}</td>
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

