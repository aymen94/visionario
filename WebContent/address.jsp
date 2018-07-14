<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>My Addresses</title>
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

<div class="container-fluid mt-3">
    <div class="account-holder py-0">
        <h3 class="mt-3 mb-0">Address</h3>
        <br>
            <div id="accordion">

                <jsp:useBean id="model" class="model.AddressModel"></jsp:useBean>
                <c:forEach var="address"
                    items="${model.doRetrieveByUser(sessionScope.userId)}" varStatus="i">
                    <div class="card">
                        <div class="card-header" id="heading${address.id}">
                            <a class="btn btn-link"
                                data-toggle="collapse"
                                data-target="#collapse${address.id}" aria-expanded="true"
                                aria-controls="collapse${address.id}"
                               >Address ${i.index+1}&nbsp;<i class="fa fa-chevron-circle-down"></i></a>
                        </div>

                    <div id="collapse${address.id}" class="collapse"
                        aria-labelledby="heading${address.id}"
                        data-parent="#accordion">
                        <div class="card-body">
                            <form id="Address${address.id}">
                                <div class=row>
                                    <c:forEach
                                        items="country,province,city,zip,addressLine,consignee,phoneNumber"
                                        var="field">
                                        <div class="col-lg-6 col-md-6">
                                            <div class="form-group">
                                                <label
                                                    class="control-label required"
                                                    for="${field}">
                                                    ${field} <sup
                                                    style="color: red">*</sup>
                                                </label> <input id="${field}"
                                                    name="${field}" type="text"
                                                    class="form-control"
                                                    placeholder="Enter ${field}"
                                                    value="${address[field]}">
                                            </div>
                                        </div>

                                    </c:forEach>

                                </div>
                            </form>

                            <div class="row">
                                <div class="col-lg-6 col-md-4">
                                  <input type="hidden" name="id" id="id" value="${address.id}">
                                
                                </div>

                                <div class="col-lg-3 col-md-4">
                                    <button
                                        class="btn btn-primary btn-block save"
                                        id="save${address.id}">Save</button>
                                </div>
                                <div class="col-lg-3 col-md-4">
                                    <input type="button"
                                        class="btn btn-danger btn-block remove"
                                        id="remove${address.id}" value="Remove" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                </c:forEach>
                
                
                                    <div class="card">
                        <div class="card-header" id="headingNew">
                            <a  class="btn btn-link anchor"
                                data-toggle="collapse"
                                data-target="#collapseNew" aria-expanded="true"
                                aria-controls="collapseNew"
                                >Add new address&nbsp;&nbsp;<i class="fa fa-plus-circle"> </i></a>
                        </div>
                        <div id="collapseNew" class="collapse  <c:if test="${param.address.equals('0')}"> show</c:if>"
                            aria-labelledby="headingNew"
                            data-parent="#accordion">
                            <div class="card-body">
                        <form id="AddressNew">
                            <div class=row>
                                <c:forEach
                                    items="country,province,city,zip,addressLine,consignee,phoneNumber"
                                    var="field">
                                    <div class="col-lg-6 col-md-6">
                                        <div class="form-group">
                                            <label
                                                class="control-label required"
                                                for="${field}"> ${field}
                                                <sup style="color: red">*</sup>
                                            </label> <input id="${field}"
                                                name="${field}" type="text"
                                                class="form-control"
                                                placeholder="Enter ${field}">
                                        </div>
                                    </div>
                                </c:forEach>
                                </div>
                                <div class=row>
                                <div class="col-12">                             
                                    <button
                                        class="btn btn-primary btn-block insert"
                                        id="saveNew">Save</button>
                                </div>
                            </div>
                        </form>

                    </div>
                        </div>
                    </div>
            </div>

        <div class="modal fade" id="myModal">
            <div class="modal-dialog">
                <div class="modal-content">

                    <!-- Modal Header -->
                    <div class="modal-header">
                        <h5 class="modal-title"></h5>
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                    </div>

                    <!-- Modal body -->
                    <div class="modal-body"></div>


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
    <script src="assets/js/address.js"></script>
</body>
</html>



