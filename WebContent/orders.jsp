<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Change Password</title>
<!-- CSS -->
<link rel="stylesheet" href="assets/css/bootstrap.css">
<link rel="stylesheet" href="assets/css/style.css">
<link rel="stylesheet" href="assets/css/form.css">
<link rel="stylesheet" href="assets/css/title.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<%@include file="component/favicon.jsp"%>
</head>
<body>

        <!-- title -->
        <%@include file="component/title.jsp"%>

        <!-- navbar -->
        <%@include file="component/navbar.jsp"%>

        <!--edit-profile-form-->
      <div class="container mt-3">
      <div class="account-holder py-0">
        <h3 class="mt-3 mb-0">My Orders</h3>
        <br>            
            <jsp:useBean id="model" class="model.OrderModel"></jsp:useBean>
            <c:forEach items="${model.doRetrieveByUser(sessionScope.userId)}" var="order">
             <div class="card mb-2">
                    <div class="card-header">
                        <div class="row">
                            <div class="col-sm-4">
                                <span class="mr-auto">Order: ${order.id}</span>
                            </div>
                            <div class="col-sm-4">
                                <span class="ml-auto mr-auto"><span class="d-none d-md-inline">Date: </span>
                                    ${order.orderingDate}</span>
                            </div>
                            <div class="col-sm-4">
                                <span class="ml-auto"><span class="d-none d-md-inline">Total: </span>
                                    ${order.total}<span class="currency">€</span>
                                </span>
                            </div>
                        </div>
                    </div>
                    
                    <div class="card-body py-3 mt-1" style="font-size: 0.95rem;">
                    <div class="row">
                    <div class="col-sm-6 col-md-4">
                    Status: 
                    <c:choose>
                    <c:when test="${order.status==0}">
                    Accepted
                    </c:when>
                    <c:when test="${order.status==1}">
                    Paid
                    </c:when>
                    <c:when test="${order.status==2}">
                    Shipped
                    </c:when>
                    <c:when test="${order.status==3}">
                    Delivered
                    </c:when>
                    <c:when test="${order.status==4}">
                    Refunded
                    </c:when>
                    </c:choose>
                    </div>
                    <c:if test="${order.status>0}">
                    <div class="col-sm-6 col-md-4">
                    Paid with: ${order.paymentMethod}
                    </div>
                    </c:if>
                    <c:if test="${order.status>1}">
                    <div class="col-sm-6 col-md-4">                    
                    Shipping Date: ${order.shippingDate}
                    </div>
                    </c:if>
                    <c:if test="${order.status>2}">
                    <div class="col-sm-6 col-md-4">
                    
                    Delivery Date: ${order.deliveryDate}
                    </div>
                                        <div class="col-sm-6 col-md-4">
                    
                    Delivered to: ${order.sign}
                    </div>
                    </c:if>
                    <div class="col-sm-6 col-md-4">                    
                    Address: ${order.address}
                    </div>
                    </div>
                    <div class="row mb-0 mt-1 py-0">
                    <div class="col-sm-6 col-md-4">
                    </div>
                    <div class="col-sm-6 col-md-4">
                                        <c:if test="${order.status>2}">
                    
                    <a href="${order.track}" class="btn-link btn-sm" role="button">Track</a>
                                        </c:if>
                                        </div>
                                                                                <c:if test="${order.status>0}">
                                        
                    <div class="col-sm-6 col-md-4">                                        
                    <a href="./Invoice?order=${order.id}" class="btn-link btn-sm" role="button">See Invoice</a>
                    </div>


</c:if>
                    </div>
                    </div>
                </div>
            </c:forEach>

                  
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
            </div>
   </div>
  

    <!-- Footer -->
    <%@include file="component/footer.jsp"%>

    <!-- Javascript -->
    <script src="assets/js/jquery.min.js"></script>
    <script src="assets/js/bootstrap.js"></script>
    <script src="assets/js/main.js"></script>
</body>
</html>
