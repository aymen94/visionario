<%--
  Created by IntelliJ IDEA.
  User: aymen
  Date: 02/05/2018
  Time: 11:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<nav class="navbar navbar-expand-lg navbar-light bg-yellow sticky-top">
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target=".navbar-collapse" aria-controls="navbarNavDropdown"
            aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNavDropdown">
        <div class="collapse navbar-collapse d-flex" id="navflex">
                <ul class="navbar-nav">
                <li>
                    <a class="nav-item nav-link active" href="<%=request.getContextPath()%>/">Home
                        <span class="sr-only">(current)</span>
                    </a>
                </li>
                <li>
                    <a class="nav-item nav-link" href="#">Sale</a>
                </li>
                <jsp:useBean id="category" class="model.CategoryModel"
                    scope="request"></jsp:useBean>
                <c:forEach items="Man,Woman,Kid" var="gender">
                    <li class="nav-item dropdown"><a
                        class="nav-link dropdown-toggle" href="#"
                        data-toggle="dropdown" aria-haspopup="true"
                        aria-expanded="false"> ${gender} </a>
                        <div class="dropdown-menu">
                            <c:forEach
                                items="${category.doSearch(null,gender.charAt(0),null,null)}"
                                var="cat">
                                <a class="dropdown-item"
                                    href="<%=request.getContextPath()%>/search?category=${cat.id}&gender=${gender.charAt(0)}">${cat.name}</a>
                            </c:forEach>
                        </div></li>
                </c:forEach>
                <li><a class="nav-item nav-link" href="<%=request.getContextPath()%>/signin">Login</a>
                </li>
                </ul>
            </div>
        </div>
    <span class="title navbar-brand" id="smalltitle"> <a
        href="<%=request.getContextPath()%>/">Visionario</a>
    </span> <span class="nav-item" id="items"><a
        class="nav-right" id="wishbtn" href="#"><i
            class="fa fa-heart fa-lg"></i></a><a class="nav-right"
        id="cartbtn" href="<%=request.getContextPath()%>/cart.html"><i
            class="fa fa-shopping-cart fa-lg"></i></a><a class="nav-right"
        id="searchbtn" href="#search"><i class="fa fa-search  fa-lg"></i></a></span>
</nav>

<div id="search">
    <form method="get" action="<%=request.getContextPath()%>/search">
        <input type="text" name="q" placeholder="Search product" autocomplete="off"/>
    </form>
</div>

