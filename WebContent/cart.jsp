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
<link rel="stylesheet"
    href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<body>
<!-- title -->
<%@include file="component/title.jsp"%>

<!-- navbar -->
<%@include file="component/navbar.jsp"%>

<div class="container">
    <div class="row">
        <div class="col-md-12">
            <table class="table table-hover">
                <thead>
                    <tr>
                    </tr>
                    <tr>
                        <th>Cart</th>
                        <th>Quantity</th>
                        <th class="text-center">Price</th>
                        <th class="text-center">Total</th>
                        <th></th>
                        <th> </th>
                    </tr>
                </thead>
                <tbody>
                <c:set var="total" value="${0}"/>

                <c:forEach var="x"  items="${cartMap.items}">
                    <c:set var="total" value="${total + c.price}" />
                    <c:set var="prod" value="${x.product}" />
                    <c:set var="var" value="${x.variant}" />
                    <tr>
                        <td class="col-sm-8 col-md-6">
                            <div class="media">
                                <a class="thumbnail pull-left" href="#"> <img class="media-object" src="http://icons.iconarchive.com/icons/custom-icon-design/flatastic-2/72/product-icon.png" style="width: 72px; height: 72px;"> </a>
                                <div class="media-body">
                                    <h4 class="media-heading">
                                        <a href="<%=request.getContextPath()%>/product_detail?prod=${prod.id}">${prod.title}</a>
                                    </h4>
                                    <span>Status: </span><span class="text-success"><strong>In Stock</strong></span>
                                </div>
                            </div></td>
                        <td class="col-sm-1 col-md-1" style="text-align: center">
                            <input type="number" class="form-control"id="inputQuantity" value="${cartMap.getQuantity(x)}" />
                        </td>
                        <td class="col-sm-1 col-md-1 text-center"><strong>${var.getDiscountedPrice()}</strong></td>
                        <td class="col-sm-1 col-md-1 text-center"><strong>${var.getDiscountedPrice()
                                .multiply(cartMap.getQuantity(x))}</strong></td>
                        <td class="col-sm-1 col-md-1">
                            <button type="button" class="btn btn-danger">
                                <span class="glyphicon glyphicon-remove"></span> Remove
                            </button></td>
                    </tr>
                </c:forEach>


                <tr>
                        <td> </td>
                        <td> </td>
                        <td> </td>
                        <td><h5>Subtotal</h5>jik</td>
                        <td class="text-right"><h5>
                                <strong></strong>
                            </h5></td>
                    </tr>
                    <tr>
                        <td> </td>
                        <td> </td>
                        <td> </td>
                        <td><h5>Estimated ship</h5></td>
                        <td class="text-right"><h5>
                            <c:choose>
                                <c:when test="${'30'.compareTo(subtotal) == 1}">
                                    <strong>${BigDecimal.valueOf(10)}</strong>
                                </c:when>
                                <c:otherwise>
                                    <strong>${BigDecimal.valueOf(0)}</strong>
                                </c:otherwise>
                            </c:choose>
                            </h5></td>
                    </tr>
                    <tr>
                        <td> </td>
                        <td> </td>
                        <td> </td>
                        <td><h3>Total</h3></td>
                        <td class="text-right"><h3>
                                <strong>subtotal</strong>
                            </h3></td>
                    </tr>
                    <tr>
                        <td> </td>
                        <td> </td>
                        <td> </td>
                        <td>
                            <button type="button" class="btn btn-default"
                                onclick="location.href='<%=request.getContextPath()%>/'">
                                <span class="glyphicon glyphicon-shopping-cart"></span>
                                Continue Shopping
                            </button>
                        </td>

                        <td>
                            <button type="button" class="btn btn-success">
                                Checkout <span class="glyphicon glyphicon-play"></span>
                            </button>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
      </div>
    </div>
</body>
</html>