<%--
  ~ Copyright (c) 2018. Visionario
  --%>

<%--
  Created by IntelliJ IDEA.
  User: Aymen
  Date: 16/07/2018
  Time: 14:41
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
    <title>Visionario</title>
    <!-- style -->
    <link rel="stylesheet" href="assets/css/bootstrap.css">
    <link rel="stylesheet" href="assets/css/style.css">
    <link rel="stylesheet" href="assets/css/footer.css">
    <link rel="stylesheet" href="assets/css/title.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <!-- title -->
    <%@include file="component/favicon.jsp"%>
</head>

<body>
<!-- title -->
<%@include file="component/title.jsp"%>

<!-- navbar -->
<%@include file="component/navbar.jsp"%>

<div class="container">
        <ul class="breadcrumb  d-block">
            <li class="completed"><a href="<%=request.getContextPath()%>/cart">Cart</a></li>
            <li class="completed"><a href="<%=request.getContextPath()%>/checkout">Check-out</a></li>
            <li class="active"><a href="<%=request.getContextPath()%>/pay">Finish</a></li>
        </ul>

    <div class="row">
        <div class="col m-5">
            <h2>Payment Completed</h2>
            <p>
                go to order for view your product or shop other product
            </p>
            <a class="btn btn-sm btn-primary p-2" href="<%=request.getContextPath()%>/">Return To home page</a>
            <a class="btn btn-sm btn-primary p-2" href="<%=request.getContextPath()%>/profile?order">your order</a>

        </div>
    </div>

</div>
    <!-- Footer -->
    <%@include file="component/footer.jsp"%>
    <!-- script -->
    <script src="assets/js/jquery.min.js"></script>
    <script src="assets/js/bootstrap.js"></script>
    <script src="assets/js/main.js"></script>
</body>
</html>
