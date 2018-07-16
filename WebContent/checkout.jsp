<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  ~ Copyright (c) 2018. Visionario
  --%>

<%--
  Created by IntelliJ IDEA.
  User: Aymen
  Date: 16/07/2018
  Time: 09:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Check-out</title>
    <!-- style -->
    <link rel="stylesheet" href="assets/css/bootstrap.css">
    <link rel="stylesheet" href="assets/css/style.css">
    <link rel="stylesheet" href="assets/css/footer.css">
    <link rel="stylesheet" href="assets/css/title.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <!-- title -->
    <%@include file="component/favicon.jsp"%>
</head>

<body>
<!-- title -->
<%@include file="component/title.jsp"%>

<!-- navbar -->
<%@include file="component/navbar.jsp"%>

<div class="container">
    <div class="row">
        <ul class="breadcrumb  d-block">
            <li class="completed"><a href="<%=request.getContextPath()%>/cart">Cart</a></li>
            <li class="active"><a href="<%=request.getContextPath()%>/Checkout">Check-out</a></li>
            <li><a href="#">Finish</a></li>
        </ul>
    </div>
<form action="./payment" method="post">
    <div class="row">
    <div class="col m-2">
        <table class="table table-bordered">
        <thead>
        <tr>
            <th scope="col">Product</th>
            <th scope="col">Price</th>
            <th scope="col">Quantity</th>
        </tr>
        </thead>
            <tbody>
            <c:forEach var="x" items="${sessionScope.checkout.items}" varStatus="i">

                <c:set var="prod" value="${x.product}" scope="page" />
                <c:set var="var" value="${x.variant}" scope="page" />
                <c:set var="price" value="${var.discountedPrice}"
                       scope="page" />
                <c:set var="quantity" value="${checkout.getQuantity(x)}"
                       scope="page" />
                <c:set var="subtotal" value="${subtotal + price*quantity}"
                       scope="page" />
                    <tr>
                        <td>${prod.title}</td>
                        <td>${price}<span class="currency">&nbsp;€</span></td>
                        <td>${quantity}</td>
                    </tr>
            </c:forEach>
            </tbody>
        </table>
        </div>
    </div>
    <div class="row">
        <div class="col m-2 card">
            <div class="card-header">Address</div>
 <div class="card-body">
                    <div class="list-group col" data-toggle="buttons">
            
            <c:forEach var="a" items="${requestScope.address}" >
                    <label class="list-group-item">
                        <input type="radio" name="addressRadio" value="${a.id}">${a} ${a.consignee}</label>
                
            </c:forEach>
            </div>

        </div>
    </div>
    </div>


    <div class="row">
        <div class="list-group col" data-toggle="buttons">
            <label class="list-group-item">
                <i class="fa fa-cc-visa"></i>
                <input type="radio" name="pay" value="card visa">
            </label>
            <label class="list-group-item">
                <i class="fa fa-cc-paypal"></i>
                <input type="radio" name="pay" value="card paypal">
            </label>
            <label class="list-group-item">
                <i class="fa fa-credit-card"></i>
                <input type="radio" name="pay" value="transfer">
            </label>
        </div>
        <div class="card col">
            <h5 class="card-header">check-out</h5>
            <div class="card-body">
                <h5 class="card-title">Subtotal: ${subtotal}<span class="currency">&nbsp;€</span></h5>
                <button type="submit" class="btn btn-primary">Pay</button>
                <input type="hidden" value="${subtotal}" name="total">
            </div>
        </div>
    </div>
    
     </form>
    
 </div>
</body>
</html>
