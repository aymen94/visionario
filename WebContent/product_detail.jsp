<%--
  Created by IntelliJ IDEA.
  User: aymen
  Date: 09/05/2018
  Time: 16:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="config.Config" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Product Detail</title>
    <!-- style -->
    <link rel="stylesheet" href="assets/css/bootstrap.css">
    <link rel="stylesheet" href="assets/css/style.css">
    <link rel="stylesheet" href="assets/css/carouselproduct.css">
    <link rel="stylesheet" href="assets/css/footer.css">
    <link rel="stylesheet" href="assets/css/title.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>

<body>
<jsp:useBean id="model" class="model.ProductDetailModel" />
<fmt:parseNumber var="prodId" type="number" value="${param.prod}" />
<c:set var="prod" value="${model.doRetrieveByKey(prodId)}" />
<c:set var="context" value="${pageContext.request.contextPath}" />

<!-- title -->
<%@include file="component/title.jsp"%>

<!-- navbar -->
<%@include file="component/navbar.jsp"%>
<div class="container">


    <!-- product -->

    <div class="card">
        <div class="row">
            <aside class="col-sm-5 border-right">
                <div id="carouselExampleControls" class="carousel slide" data-ride="carousel">
                    <div class="carousel-inner" role="listbox">
                        <div class="carousel-item active">
                            <img class="d-block img-fluid" src="${context}${Config.pathImg}${prod.defaultImage}" alt="${prod.title}">
                        </div>
                    </div>
                    <a class="carousel-control-prev" href="#carouselExampleControls" role="button" data-slide="prev">
                        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                        <span class="sr-only">Previous</span>
                    </a>
                    <a class="carousel-control-next" href="#carouselExampleControls" role="button" data-slide="next">
                        <span class="carousel-control-next-icon" aria-hidden="true"></span>
                        <span class="sr-only">Next</span>
                    </a>
                </div>
            </aside>
            <aside class="col-sm-7">
                <article class="card-body p-5">
                    <h2 class="mb-3">${prod.title}</h2>

                    <p class="price-detail-wrap">
	<span class="price h3 text-warning">
		<span class="num">${prod.minPrice} <span class="currency">€</span> - ${prod.maxPrice} <span class="currency">€</span></span>
	</span>
                    </p>
                    <input type="hidden" value="${prodId}" id="prodId"/>
                    <dl class="param param-feature">
                        <dt>Color and Size</dt>
                        
                        <dd class="btn-group btn-group-toggle" data-toggle="buttons">
                            <c:forEach  items="${prod.variants}" var="c" >
                                <label class="btn text-center" style="background-color:${c.color};">
                                    <input type="radio" name="variant"  value="${c.variantId}" >${c.size}
                                </label>
                            </c:forEach>
                        </dd>
                    </dl>
                    <hr>
                    <div class="row">
                        <div class="col-sm-5">
                            <dl class="param param-inline">
                                <dt>Quantity: </dt>
                                <dd>
                                    <input min="1" id="quantity" type="number" class="form-control form-control-sm" style="width:70px;" value="1"/>
                                </dd>
                            </dl>
                        </div>
                        <div class="col-sm-5">
                            <dl class="param param-inline">
                                <dt>Model: </dt>
                                <dd>#${prodId}</dd>
                            </dl>
                        </div>
                    </div>
                    <hr>
                    <a href="#" class="btn btn-lg btn-primary text-uppercase"> Buy now </a>
                    <a href="#" class="btn btn-lg btn-primary text-uppercase" id="addCart"> <i class="fa fa-shopping-cart"></i> Add to cart </a>
                    <a href="#" class="btn btn-lg btn-primary "><i class="fa fa-heart fa-lg"></i></a>
                </article>
            </aside>
        </div>
    </div>

    <div class="card">
        <div class="row">
            <aside>
                <article class="card-body">
                    <dl class="item-property">
                        <dt>Description: </dt>
                        <dd><p>${prod.description}></p></dd>
                    </dl>
                </article>
            </aside>
        </div>
    </div>

    <!-- The Modal -->
    <div class="modal fade" id="myModal">
        <div class="modal-dialog">
            <div class="modal-content">

                <!-- Modal Header -->
                <div class="modal-header">
                    <h5 class="modal-title"></h5>
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>

                <!-- Modal body -->
                <div class="modal-body">

                </div>
            </div>
        </div>
    </div>
    <!-- product carousel -->
    <%@include file="component/carousel_product.jsp"%>
</div>
<!-- Footer -->
<%@include file="component/footer.jsp"%>
<!-- script -->
<script src="assets/js/jquery.min.js"></script>
<script src="assets/js/bootstrap.js"></script>
<script src="assets/js/main.js"></script>
<script src="assets/js/product.js"></script>
</body>

</html>
