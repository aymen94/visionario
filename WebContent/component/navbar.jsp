<%--
  Created by IntelliJ IDEA.
  User: aymen
  Date: 02/05/2018
  Time: 11:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<nav class="navbar navbar-expand-lg navbar-light bg-yellow sticky-top">
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target=".navbar-collapse" aria-controls="navbarNavDropdown"
            aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNavDropdown">
        <div class="collapse navbar-collapse d-flex" id="navflex">
                <ul class="navbar-nav">
                <li>
                    <a class="nav-item nav-link active" href="/">Home
                        <span class="sr-only">(current)</span>
                    </a>
                </li>
                <li>
                    <a class="nav-item nav-link" href="#">Sale</a>
                </li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#"  data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        Man
                    </a>
                    <div class="dropdown-menu">
                        <a class="dropdown-item" href="#">Action</a>
                        <a class="dropdown-item" href="#">Another action</a>
                        <a class="dropdown-item" href="#">Something else here</a>
                    </div>
                </li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        Woman
                    </a>
                    <div class="dropdown-menu">
                        <a class="dropdown-item" href="#">Action</a>
                        <a class="dropdown-item" href="#">Another action</a>
                        <a class="dropdown-item" href="#">Something else here</a>
                    </div>
                </li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#"  data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        Kid
                    </a>
                    <div class="dropdown-menu" >
                        <a class="dropdown-item" href="#">Action</a>
                        <a class="dropdown-item" href="#">Another action</a>
                        <a class="dropdown-item" href="#">Something else here</a>
                    </div>
                </li>
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

