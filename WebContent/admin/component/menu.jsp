<%--
  ~ Copyright (c) 2018. Visionario
  --%>

<%--
  Created by IntelliJ IDEA.
  User: aymen
  Date: 06/07/2018
  Time: 15:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<c:if test="${!sessionScope.permission}">
    <c:redirect url ="/" />
</c:if>
<nav class="navbar header-top fixed-top navbar-expand-lg navbar-dark bg-dark">
    <span class="navbar-toggler-icon leftmenutrigger"></span>
    <a class="navbar-brand" href="./" >Visionario Admin Dashboard</a>

    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarText" aria-controls="navbarText"
            aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarText">
        <ul class="navbar-nav animate side-nav">
            <li class="nav-item">
                <a class="nav-link" href="./" ><i class="fa fa-line-chart fa-lg"> Statistics</i><i class="fa fa-line-chart fa-2x smenu animate"></i></a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="./manageusers" ><i class="fa fa-users fa-lg"> Users</i><i class="fa fa-users fa-2x smenu animate"></i></a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="./manageproducts" ><i class="fa fa-shopping-basket fa-lg"> Products</i><i class="fa fa-shopping-basket fa-2x smenu animate"></i></a>
            </li>
        </ul>
        <ul class="navbar-nav ml-md-auto d-md-flex">
            <li class="nav-item">
                <a class="nav-link" href="<%=request.getContextPath()%>/"><i class="fa fa-home fa-lg"></i> Website </a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="<%=request.getContextPath()%>/profile"><i class="fa fa-user fa-lg"></i> Profile</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="<%=request.getContextPath()%>/logout"><i class="fa fa-key fa-lg"></i> Logout</a>
            </li>
        </ul>
    </div>
</nav>
