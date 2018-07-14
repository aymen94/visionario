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
    <link rel="stylesheet" href="<%=request.getContextPath()%>/admin/assets/css/admin.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<body>
<jsp:useBean id="model" class="model.ProductModel" />
<jsp:useBean id="variant" class="model.VariantModel" />

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
                        <table class="table table-hover table-bordered">
                            <input class="form-control" id="myInput" type="text" placeholder="Search..">
                            <thead>
                            <tr class="thead-dark">
                                <th>id</th>
                                <th>Title</th>
                                <th>Price</th>
                                <th>Reviews</th>
                                <th>image</th>
                                <th>Edit</th>
                                <th>Delete</th>
                                <th>Variant</th>
                            </tr>
                            <tr class="bg-secondary">
                                <th>variantId</th>
                                <th>color - size - weight</th>
                                <th>disc - price - sold</th>
                                <th>img</th>
                                <th>available</th>
                            </tr>
                            </thead>
                            <tbody id="myTable">
                            <c:forEach var="l" items="${model.doRetrieveAll()}">
                                    <th scope="row">${l.id}</th>
                                    <td>${l.title}</td>
                                    <td>${l.minPrice} - ${l.maxPrice}</td>
                                    <td>${l.numReviews}</td>
                                    <td>${l.defaultImage}</td>
                                    <td><button class="btn btn-warning"><i class="fa fa-pencil"></i></button></td>
                                    <td><button class="btn btn-danger"><i class="fa fa-trash"></i></button></td>
                                    <td><button class="btn btn-primary" data-toggle="collapse"   data-target=".variant${l.id}">Variant</button></td>
                                    <c:forEach var="v" items="${variant.doRetrieveByProd(l.id)}">
                                        <c:choose>
                                            <c:when test="${v.available==0}">
                                                <tr class="collapse variant${l.id} bg-secondary table-danger">
                                            </c:when>
                                            <c:otherwise>
                                                <tr class="collapse variant${l.id} bg-secondary">
                                            </c:otherwise>
                                        </c:choose>
                                            <th scope="row" >${v.variantId}</th>
                                            <td>${v.color} - ${v.size} - ${v.weight}</td>
                                            <td>${v.discountedPrice} - ${v.price} -${v.sold}%</td>
                                            <td> ${v.img}</td>
                                            <td>${v.available}</td>
                                        </tr>
                                    </c:forEach>
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
    <script src="<%=request.getContextPath()%>/admin/assets/js/admin.js"></script>
    <script src="<%=request.getContextPath()%>/admin/assets/js/user.js.js"></script>
</body>
</html>

