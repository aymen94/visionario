<%@page import="java.util.TreeMap"%>
<%@page import="java.util.SortedMap"%>
<%@page import="model.ProductModel"%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Visionario<c:if
        test="${param.q!=null && param.q.length()>0}">: ${param.q}
</c:if></title>
<!-- style -->
<link rel="stylesheet" href="assets/css/bootstrap.css">
<link rel="stylesheet" href="assets/css/style.css">
<link rel="stylesheet" href="assets/css/footer.css">
<link rel="stylesheet" href="assets/css/title.css">
<link rel="stylesheet"
    href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<body>
    <!-- title -->
    <%@include file="component/title.jsp"%>

    <!-- navbar -->
    <%@include file="component/navbar.jsp"%>

    <form method="get" action="search">
        <div class="container-fluid">
            <div class="row">
                <div class="col-2">
                    <c:if test="${products.size()>0}">
                        <h4>Gender</h4>
                        <select name=gender>
                            <option value="0">All
                                <c:forEach items="${genders}" var="gend">
                                    <c:if test="${gend.isEnabled()}">
                                        <option value="${gend.id}"
                                            <c:if test="${param.gender.charAt(0)==gend.id}">selected
                                                </c:if>>${gend.name}
                                    </c:if>
                                </c:forEach>
                                </option>
                        </select>
                        <!--Sidebar content-->
                        <h4>Category</h4>
                        <select name=category>
                            <option value="0">All
                                <c:forEach items="${categories}"
                                    var="cat">
                                    <option value="${cat.id}"
                                        <c:if test="${param.category ==cat.id}">selected
                        </c:if>>${cat.name}
                                </c:forEach>
                        </select>
                        <h4>Size</h4>
                        <div class="btn-group-toggle "
                            data-toggle="buttons">
                            <c:forEach items="${sizes}" var="size">
                                <c:choose>
                                    <c:when
                                        test="${sizeList.contains(size)}">
                                        <label
                                            class="btn btn-secondary active"
                                            style="width: 6em; margin-bottom: 0.2rem;">
                                            <input type="checkbox"
                                            name="size" checked
                                            value="${size}">
                                            ${size}
                                        </label>
                                    </c:when>
                                    <c:otherwise>
                                        <label class="btn btn-secondary"
                                            style="width: 6em; margin-bottom: 0.2rem;">
                                            <input type="checkbox"
                                            name="size" value="${size}">
                                            ${size}
                                        </label>
                                    </c:otherwise>
                                </c:choose>
                            </c:forEach>
                        </div>
                        <h4>Color</h4>
                        <div class="btn-group-toggle "
                            data-toggle="buttons">
                            <c:forEach items="${colors}" var="color">
                                <c:choose>
                                    <c:when
                                        test="${colorList.contains(color)}">
                                        <label
                                            class="btn btn-secondary active"
                                            style="background-color:${color};margin-bottom: 0.2rem;">
                                            <input type="checkbox"
                                            name="color"
                                            value="${color}" checked>
                                        </label>
                                    </c:when>
                                    <c:otherwise>
                                        <label
                                            class="btn btn-secondary "
                                            style="background-color:${color};margin-bottom: 0.2rem;">
                                            <input type="checkbox"
                                            name="color"
                                            value="${color}">
                                        </label>
                                    </c:otherwise>
                                </c:choose>
                            </c:forEach>
                        </div>
                    </c:if>
                </div>
                <!--Search result-->
                <div class="col-10">
                    <div class="row" style="margin-top: 5rem;">
                        <div class="col-8">
                            <c:choose>
                                <c:when
                                    test="${param.q==null || param.q.length()<1}">
                                    <h2>All Products</h2>
                                </c:when>
                                <c:when test="${products.size()>0}">
                                    <h2>Search Result for
                                        "${param.q}"</h2>
                                </c:when>
                                <c:otherwise>
                                    <h2>No Result for "${param.q}"</h2>
                                    <br>The search for "${param.q}" did not
                                        produce any results.<br>
                                    <br>Tips:
                                    <ul>
                                        <li>Make sure that all
                                            words have been entered
                                            correctly.</li>
                                        <li>Try different keywords.</li>
                                        <li>Try more general
                                            keywords.</li>
                                        <li>Try fewer keywords.</li>
                                    </ul>
                                </c:otherwise>
                            </c:choose>
                        </div>
                        <div class="col-4">
                            <div class="form-inline">
                                <input class="form-control mr-sm-2"
                                    type="search" placeholder="Search"
                                    aria-label="Search" name="q"
                                    value="${param.q}">
                                <button
                                    class="btn btn-outline-success my-2 my-sm-0"
                                    type="submit">Search</button>
                            </div>
                        </div>
                    </div>
                    <div class="container" id="products">
                        <c:import url="/component/products.jsp" />
                    </div>
                </div>
            </div>
        </div>
    </form>
    <!-- Footer -->
    <%@include file="component/footer.jsp"%>
    <!-- script -->
    <script src="assets/js/jquery.min.js"></script>
    <script src="assets/js/bootstrap.js"></script>
    <script src="assets/js/main.js"></script>

</body>
</html>
