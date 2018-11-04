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
    <link rel="stylesheet" href="assets/css/cart.css">
    <link rel="stylesheet" href="assets/css/checkout.css">
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
        <ul class="breadcrumb  d-block">
            <li class="completed"><a
                href="<%=request.getContextPath()%>/cart">Cart</a></li>
            <li class="active"><a
                href="<%=request.getContextPath()%>/Checkout">Check-out</a></li>
            <li><a href="#">Finish</a></li>
        </ul>
        <form action="./payment" method="post">
            <div class="card mb-3">
                <div class="card-header">Products</div>
                <div class="card-body">
                    <c:forEach var="x" items="${sessionScope.checkout.items}"
                        varStatus="i">

                        <c:set var="prod" value="${x.product}" scope="page" />
                        <c:set var="var" value="${x.variant}" scope="page" />
                        <c:set var="price" value="${var.discountedPrice}"
                            scope="page" />
                        <c:set var="quantity" value="${checkout.getQuantity(x)}"
                            scope="page" />
                        <c:set var="subtotal"
                            value="${subtotal + price*quantity}" scope="page" />
                        <div class="row">
                            <div class="col-md-6 col-lg-7">${prod.title}</div>
                            <div class="col-md-3 col-lg-2">
                                Price: ${price}<span class="currency">&nbsp;€</span>
                            </div>
                            <div class="col-md-3  col-lg-2">Quantity:
                                ${quantity}</div>
                        </div>
                    </c:forEach>
                </div>
            </div>

            <div class="card mb-3">
                <div class="card-header">Address</div>
<!--                 <div class="card-body"> -->


                    <c:forEach var="a" items="${requestScope.address}" varStatus="i">

                        <div class="input-group">
                                            <div class="input-group-prepend">
                        <div class="input-group-text">
                            <input type="radio"
                                name="addressRadio" id="${a.id}" value="${a.id}"
                                <c:if test="${i.index==0}">checked</c:if>>
                                
                                </div>
                                </div>
<input type="text" readonly class="form-control col-4"
                        aria-label="Text input with radio button" value="${a.consignee}">
                        <input type="text" readonly class="form-control col-8" value="${a}"
                        aria-label="Text input with radio button">                                     

                        </div>
                    </c:forEach>
                    <div class="input-group">
                    <div class="input-group-prepend">
                        <div class="input-group-text">
                            <input type="radio" name="addressRadio" value="-1">
                        </div>
                    </div>
                    <input type="text" name="consignee" class="form-control col-4"
                        aria-label="Text input with radio button" placeholder="insert consignee">
                        <input type="text" name="addrline" class="form-control col-8"
                        aria-label="Text input with radio button" placeholder="insert your address">
                </div>

<!--             </div> -->
    </div>



<div class="row">

<div class="col-md-5 mb-3">
   <div class="card h-100">
                <div class="card-header">Pay with</div>
<!--                 <div class="card-body"> -->

<!--     <div class="row"> -->
        <div class="list-group">
            <label class="list-group-item">
                <input type="radio" name="pay" value="visa">
                                <i class="fa fa-cc-visa"></i>&nbsp;XXXX-XXXX-XXXX-3854
            </label>
            <label class="list-group-item">
                <input type="radio" name="pay" value="paypal" checked>
                                <i class="fa fa-cc-paypal"></i>&nbsp; PayPal              
            </label>
<!--         </div> -->
 </div>
 </div>   
        </div>
        
        

<div class="col-md-7 mb-3">
        <div class="card h-100">
            <div class="card-header">Check-out</div>
            <div class="card-body py-3">
                <h5 class="card-title text-center mb-0 py-1">Total: ${subtotal}<span class="currency">&nbsp;€</span></h5>
                <input type="hidden" value="${subtotal}" name="total">
            </div>
                            <button type="submit" class="btn btn-sm btn-primary">Pay</button>
            
<!--         </div> -->
    </div>
    </div>
    </div>
     </form>
    
 </div>
    <!-- Footer -->
    <%@include file="component/footer.jsp"%>
    <!-- script -->
    <script src="assets/js/jquery.min.js"></script>
    <script src="assets/js/bootstrap.js"></script>
    <script src="assets/js/main.js"></script>
</body>
</html>
