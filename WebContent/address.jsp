<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Profile</title>
<!-- CSS -->
<link rel="stylesheet" href="assets/css/bootstrap.css">
<link rel="stylesheet" href="assets/css/style.css">
<link rel="stylesheet" href="assets/css/form.css">
<link rel="stylesheet" href="assets/css/title.css">
<link rel="stylesheet"
    href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<body>

    <!-- title -->
    <%@include file="component/title.jsp"%>

    <!-- navbar -->
    <%@include file="component/navbar.jsp"%>

    <!--         edit-profile-form -->
    <!--             <div class="container"> -->
    <!--         <div class="col-lg-12 col-md-12" id="signup"> -->
    <!--             <ul class="nav nav-tabs nav-justified"> -->
    <!--                 <li class="nav-item"><a class="nav-link active" -->
    <!--                    >Change Password</a></li> -->
    <!--                 <li class="nav-item"><a -->
    <!--                     class="nav-link"  href="profile">Edit Profile</a></li> -->
    <!--             </ul> -->
    <div class="account-holder">
        <h3>Address</h3>
        <br>
            <div id="accordion">

                <jsp:useBean id="model" class="model.AddressModel"></jsp:useBean>
                <c:forEach var="address"
                    items="${model.doRetrieveByUser(sessionScope.userId)}" varStatus="i">
                    <div class="card">
                        <div class="card-header" id="heading${i.index+1}">
                            <a class="btn btn-link"
                                data-toggle="collapse"
                                data-target="#collapse${i.index+1}" aria-expanded="true"
                                aria-controls="collapse${i.index+1}"
                               >Address ${i.index+1}&nbsp;<i class="fa fa-chevron-circle-down"></i></a>
                        </div>

                    <div id="collapse${i.index+1}" class="collapse"
                        aria-labelledby="heading${i.index+1}"
                        data-parent="#accordion">
                        <div class="card-body">
                            <form id="Address${i.index+1}">
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
                                <div class="col-lg-6 col-md-6">
                                  <input type="hidden" name="id" value="${address.id}">
                                
                                </div>

                                <div class="col-lg-3 col-md-3">
                                    <button
                                        class="btn btn-primary btn-block save"
                                        id="save${i.index+1}">Save</button>
                                </div>
                                <div class="col-lg-3 col-md-3">
                                    <input type="button"
                                        class="btn btn-danger btn-block remove"
                                        id="remove${i.index+1}" value="Remove" />
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
                        <form id="Address${i.index+1}">
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



    <!-- Footer -->
    <%@include file="component/footer.jsp"%>

    <!-- Javascript -->
    <script src="assets/js/jquery.min.js"></script>
    <script src="assets/js/bootstrap.js"></script>
    <script src="assets/js/address.js"></script>
</body>
</html>


