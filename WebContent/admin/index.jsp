<%--
  ~ Copyright (c) 2018. Visionario
  --%>

<%--
  Created by IntelliJ IDEA.
  User: aymen
  Date: 05/07/2018
  Time: 12:13
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

    <title>Visionario | Admin Dashboard</title>

    <!-- style -->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/bootstrap.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/admin/assets/css/admin.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<body>
<jsp:useBean id="model" class="model.AdminModel" />
<body>
        <div id="wrapper" class="animate">
            <!-- menu -->
            <%@include file="/admin/component/menu.jsp"%>

            <div class="container-fluid">
                <div class="row">
                    <div class="col">
                        <div class="card">
                            <div class="card-body text-center">
                                <h2 class="card-title"><i class="fa fa-users fa-3x"></i>
                                </h2>
                                <h5 class="card-subtitle mb-2 text-muted">${model.doRetrieveByNumber("user")}</h5>
                                <p class="card-text">Users</p>
                            </div>
                        </div>
                    </div>
                    <div class="col">
                        <div class="card">
                            <div class="card-body text-center">
                                <h2 class="card-title"><i class="fa fa-shopping-basket fa-3x"></i></h2>
                                <h5 class="card-subtitle mb-2 text-muted">${model.doRetrieveByNumber("product")}</h5>
                                <p class="card-text">Products</p>
                            </div>
                        </div>
                    </div>
                    <div class="col">
                        <div class="card">
                            <div class="card-body text-center">
                                <h2 class="card-title"><i class="fa fa-shopping-bag fa-3x"></i></h2>
                                <h5 class="card-subtitle mb-2 text-muted">${model.doRetrieveByNumber("productvariant")}</h5>
                                <p class="card-text">Product variants</p>
                            </div>
                        </div>
                    </div>
                    <div class="col">
                        <div class="card">
                            <div class="card-body text-center">
                                <h2 class="card-title"><i class="fa fa-comment fa-3x"></i></h2>
                                <h5 class="card-subtitle mb-2 text-muted">${model.doRetrieveByNumber("review")}</h5>
                                <p class="card-text">Reviews</p>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col">
                        <div class="card">
                            <div class="card-body text-center">
                                <h2 class="card-title"><i class="fa fa-cubes fa-3x"></i></h2>
                                <h5 class="card-subtitle mb-2 text-muted">${model.doRetrieveByNumber("`order`")}</h5>
                                <p class="card-text">Orders</p>
                            </div>
                        </div>
                    </div>
                    <div class="col">
                        <div class="card">
                            <div class="card-body text-center">
                                <h2 class="card-title"><i class="fa fa-credit-card-alt fa-3x"></i></h2>
                                <h5 class="card-subtitle mb-2 text-muted">${model.doRetrieveRevenue()}</h5>
                                <p class="card-text">Revenue</p>
                            </div>
                        </div>
                    </div>
                    <div class="col">
                        <div class="card">
                            <div class="card-body text-center">
                                 <h2 class="card-title"><i class="fa fa-address-card fa-3x"></i></h2>
                                 <h5 class="card-subtitle mb-2 text-muted">${model.doRetrieveByNumber("address")}</h5>
                                 <p class="card-text">addresses</p>
                            </div>
                        </div>
                    </div>
                </div>
           </div>
        </div>

        <!-- script -->
        <script src="<%=request.getContextPath()%>/assets/js/jquery.min.js"></script>
        <script src="<%=request.getContextPath()%>/assets/js/bootstrap.js"></script>
        <script src="<%=request.getContextPath()%>/admin/assets/js/admin.js"></script>
</body>
</html>

