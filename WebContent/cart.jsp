<%@page import="java.math.BigDecimal"%>
<%@page import="model.bean.CartItem"%>
<%@page import="model.bean.ProductBean"%>
<%@page import="model.bean.VariantBean"%>



<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>

<jsp:useBean id="cartMap" class="model.bean.CartBean" />
<c:set var="cartMap" value='${sessionScope["cart"]}' />

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Cart</title>
<!-- style -->
<link rel="stylesheet" href="assets/css/bootstrap.css">

<link rel="stylesheet" href="assets/css/style.css">
<link rel="stylesheet" href="assets/css/footer.css">
<link rel="stylesheet" href="assets/css/title.css">
<link rel="stylesheet" href="assets/css/cart.css">

<link rel="stylesheet"
    href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<body>
<!-- title -->
<%@include file="component/title.jsp"%>

<!-- navbar -->
<%@include file="component/navbar.jsp"%>

    <div class="container">
            <ul class="breadcrumb d-block">
                <li class="active"><a href="<%=request.getContextPath()%>/cart">Cart</a></li>
                <li><a href="#">Check-out</a></li>
                <li><a href="#">Finish</a></li>
            </ul>
        <h2>Cart</h2>
        <div
            class="
            <c:if test="${cartMap!=null && cartMap.getSize()>0}">d-none</c:if>"
            id="empty">
            
            <h4>Your cart is empty.</h4>
            <p>
                If you want to buy one or more items, click Add to Cart, next to
                the items you want to buy. <br> <a
                    class="d-none d-md-block btn-sm btn-link px-0"
                    href="<%=request.getContextPath()%>/">Click here to
                    continue shopping</a>
            </p>
            <a class="d-block d-md-none btn btn-sm btn-primary px-0"
                href="<%=request.getContextPath()%>/">Continue Shopping</a>
        </div>
        <c:if test="${cartMap!=null && cartMap.getSize()>0}">       
        <div id="cart">
                <div class="row row-head d-none d-md-flex">
                    <div class="col-md-5 col-lg-7"></div>
                    <div class="col-md-2">Price</div>
                    <div class="col-md-3 col-lg-2">Quantity</div>
                    <div class="col-md-2 col-lg-1"></div>
                </div>

                <c:forEach var="x" items="${cartMap.items}" varStatus="i">

                    <c:set var="prod" value="${x.product}" scope="page" />
                    <c:set var="var" value="${x.variant}" scope="page" />
                    <c:set var="price" value="${var.discountedPrice}"
                        scope="page" />
                    <c:set var="quantity" value="${cartMap.getQuantity(x)}"
                        scope="page" />
                    <c:set var="subtotal" value="${subtotal + price*quantity}"
                        scope="page" />
                        <input type="number" class="d-none" hidden="1" value="${prod.id}" id="prod${i.index}">
                        <input type="number" class="d-none" hidden="1" value="${var.variantId}" id="var${i.index}">
                        <input type="text" class="d-none" hidden="1" value="${price}" id="price${i.index}">
                        
                        
                    <div class="row row-body" id="${i.index}">
                        <div class="col-md-5 col-lg-7">
                            <div class="row row-media">
                                    <div class="col-xs-3 col-sm-4 col-md-3 col-lg-2">
                                        <a
                                            href="<%=request.getContextPath()%>/product_detail?prod=${prod.id}&var=${var.variantId}">
                                            <img
                                            src="<%=request.getContextPath()%>/uploads/images/${var.img}"
                                            style="width: 100%;">
                                        </a>
                                    </div>
                                <div class="col-xs-9 col-sm-8 col-md-9 col-lg-10">
                                        <div class="">
                                            <h4>
                                                <a
                                                    href="<%=request.getContextPath()%>/product_detail?prod=${prod.id}&var=${var.variantId}">${prod.title}</a>
                                            </h4>
                                        </div>
                                        <div class="d-block d-md-none">
                                            <h5>${price}<span
                                                    class="currency">&nbsp;€</span>
                                            </h5>
                                        </div>

                                        <div class="">
                                            <c:choose>
                                                <c:when
                                                    test="${var.available<1}">
                                                    <h6 class="text-danger">Out
                                                        of stock</h6>
                                                </c:when>
                                                <c:when
                                                    test="${var.available<10}">
                                                    <h6 class="text-warning">Only
                                                        ${var.available} left in
                                                        stock</h6>
                                                </c:when>
                                                <c:otherwise>
                                                    <h6 class="text-success">In
                                                        Stock</h6>
                                                </c:otherwise>
                                            </c:choose>
                                        </div>
                                    </div>
                            </div>
                        </div>
                        <div class="d-none d-md-block col-md-2 col-lg-2">${price}<span
                                class="currency">&nbsp;€</span>
                        </div>
                        <div
                            class="col-sm-4 col-md-3 col-lg-2 mb-2 mb-md-0 text-center text-md-left">
                            <input type="number"
                                class="form-control text-center text-md-left quantity"
                                id="inputQuantity${i.index}" value="${quantity}" max="${var.available}"
                                min="0">
                        </div>
                        <div
                            class="col-sm-8 col-md-2 col-lg-1 mb-2 mb-md-0 text-center text-md-left">
                            <button class="btn btn-danger remove" aria-hidden="false" id="remove${i.index}">
                                <i class="fa fa-trash"></i><span
                                    class="d-inline d-md-none"> Remove</span>
                            </button>
                        </div>
                    </div>
                </c:forEach>
                <div class="row mt-2">
                    <div class="col-12">
                        <h4 class="text-right">
                            Subtotal: <span id="subtotal">${subtotal}</span><span class="currency">&nbsp;€</span>
                        </h4>
                    </div>

                    <div class="col-md-4 col-lg-5"></div>
                    <div class="col-md-5 col-lg-4 mb-2">
                        <button type="button" class="btn btn-default"
                            onclick="location.href='<%=request.getContextPath()%>/'">
                            <span class="fa fa-shopping-cart"></span>
                            Continue Shopping
                        </button>
                    </div>
                    <div class="col-md-3 col-lg-3">
                        <button type="button"onclick="location.href='<%=request.getContextPath()%>/Checkout'" class="btn btn-success">
                            Checkout <span class="fa fa-play"></span>

                        </button>
                    </div>
                </div>
</div>
</c:if>
    </div>


    <!-- Footer -->
    <%@include file="component/footer.jsp"%>

    <!-- Javascript -->
    <script src="assets/js/jquery.min.js"></script>
    <script src="assets/js/bootstrap.js"></script>
    <script src="assets/js/cart.js"></script>
    
    </body>
</html>