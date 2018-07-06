<%--
  Created by IntelliJ IDEA.
  User: aymen
  Date: 02/05/2018
  Time: 11:24
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
</head>

<body>
    <!-- title -->
    <%@include file="component/title.jsp"%>

    <!-- navbar -->
    <%@include file="component/navbar.jsp"%>

    <div class="container">
<c:if test="${param.sale==null}">
    <%@include file="component/carousel.jsp"%>
</c:if>
    <!-- product  -->
    <jsp:useBean id="product" scope="request" class="model.ProductModel"/>
    <c:choose>
    <c:when test="${param.sale==null}">
    <c:set var="products" value="${product.doRetrieveAll()}" scope="request"/>
    </c:when>
    <c:otherwise>
    <c:set var="products" value="${product.doRetrieveDiscounted(30)}" scope="request"/>
    </c:otherwise>
    </c:choose>
  
    <c:import url="/component/products.jsp"/>
    </div>

    <!-- Footer -->
    <%@include file="component/footer.jsp"%>
    <!-- script -->
    <script src="assets/js/jquery.min.js"></script>
    <script src="assets/js/bootstrap.js"></script>
    <script src="assets/js/main.js"></script>
</body>

</html>
