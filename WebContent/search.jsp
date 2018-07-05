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
                <div class="d-none d-md-block col-md-3 col-lg-2 mt-5" id="sidebar">
                    <!--Sidebar content-->
                    <c:if test="${products.size()>0}">
                        <h4>Gender</h4>
                        <select name=gender  onchange="this.form.submit()">
                            <option value="0">All
                                <c:forEach items="${genders}" var="gend">
                                    <c:if test="${gend.isEnabled()}">
                                        <option value="${gend.id}"
                                            <c:if test="${param.gender.charAt(0)==gend.id}">selected
                                            <c:set var="gendername" value="${gend.name}" scope="request"/>
                                                </c:if>>${gend.name}
                                    </c:if>
                                </c:forEach>
                                </option>
                        </select>
                        <h4>Category</h4>
                        <select name=category onchange="this.form.submit()">
                            <option value="0">All
                                <c:forEach items="${categories}"
                                    var="cat">
                                    <option value="${cat.id}"
                                        <c:if test="${param.category ==cat.id}">selected
                                        <c:set var="catname" value="${cat.name}" scope="request"/>
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
                                            class="search-filter btn btn-secondary active">
                                            <input type="checkbox" onchange="this.form.submit()"
                                            name="size" checked 
                                            value="${size}">
                                            ${size}
                                        </label>
                                    </c:when>
                                    <c:otherwise>
                                        <label class="search-filter btn btn-secondary">
                                            <input type="checkbox" onchange="this.form.submit()"
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
                                            class="color search-filter btn btn-secondary active focus"
                                            style="background-color:${color};">
                                            <input type="checkbox" onchange="this.form.submit()"
                                            name="color"
                                            value="${color}" checked>
                                        </label>
                                    </c:when>
                                    <c:otherwise>
                                        <label
                                            class="color search-filter btn btn-secondary"
                                            style="background-color:${color};">
                                            <input type="checkbox" onchange="this.form.submit()"
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
                <div class="col-12 col-md-9 col-lg-10">
                    <div class="row mt-2 mt-md-5 " >
                        <div class="col-6">
                            <c:choose>
                                <c:when test="${products.size()>0}">
                                    <c:choose>
                                        <c:when
                                            test="${param.q==null || param.q.length()<1}">
                                            <c:choose>
                                                <c:when
                                                    test="${catname!=null && gendername!=null}">
                                                    <h2>${gendername}
                                                        ${catname}</h2>
                                                </c:when>
                                                <c:otherwise>
                                                    <h2>All Products</h2>
                                                </c:otherwise>
                                            </c:choose>
                                        </c:when>
                                        <c:otherwise>
                                            <h2>Search Result for
                                                "${param.q}"</h2>
                                        </c:otherwise>
                                    </c:choose>
                                </c:when>
                                <c:otherwise>
                                    <h2>
                                        No Results
                                        <c:if
                                            test="${param.q !=null && param.q.length()>0}"
                                            var="test"> for "${param.q}"</c:if>
                                    </h2>
                                    <c:if test="${test}">
                                        <br>The search for "${param.q}" did not
                                        produce any results.<br>
                                        <br>Tips:
                                    <ul>
                                            <li>Make sure that all words
                                                have been entered correctly.</li>
                                            <li>Try different keywords.</li>
                                            <li>Try more general keywords.</li>
                                            <li>Try fewer keywords.</li>
                                        </ul>
                                    </c:if>
                                </c:otherwise>
                            </c:choose>
                        </div>
                        <div class="col-6">
                            <div class="form-inline">

                                <select class="custom-select ml-auto" onchange="this.form.submit()"
                                    style="vertical-align: baseline; width: auto;"
                                    name="sort" id="sort"
                                    aria-labelledby="sort_by_text">
                                    <c:forEach
                                        items="Relevance,Price: Low to High,Price: High to Low"
                                        var="sorting" varStatus="i">
                                        <option value="${i.index}"
                                            <c:if test="${param.sort==i.index}">selected</c:if>>
                                            ${sorting}</option>
                                    </c:forEach>
                                </select> <input class="form-control d-none"
                                    type="search" placeholder="Search"
                                    aria-label="Search" name="q"
                                    value="${param.q}">
                                <button class="btn btn-light  d-none"
                                    type="submit">Search</button>
                            </div>
                        </div>
                    </div>
                    <div class="col-12" id="products">
                        <c:import url="/component/products.jsp" />
                        <div class="d-flex">
                        <div class="ml-auto">
                            Page
                            <select class="custom-select" name=offset  style="vertical-align: baseline; width: auto; height:auto;" onchange="this.form.submit()">
                            <c:forEach begin="1" end="${lastPage}" varStatus="i">
                            <option value="${(i.index-1)*limit}" style="" <c:if test="${i.index==activePage}"> selected</c:if>>${i.index}</option>
                            </c:forEach>
                            </select> of ${lastPage}
                        </div></div>
                        
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
