<%--
  Created by IntelliJ IDEA.
  User: aymen
  Date: 09/05/2018
  Time: 16:45
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>

<body>
<div class="container">
    <!-- title -->
    <%@include file="component/title.jsp"%>

    <!-- navbar -->
    <%@include file="component/navbar.jsp"%>

    <!-- product -->

    <div class="card">
        <div class="row">
            <aside class="col-sm-5 border-right">
                <div id="carouselExampleControls" class="carousel slide" data-ride="carousel">
                    <div class="carousel-inner" role="listbox">
                        <div class="carousel-item active">
                            <img class="d-block img-fluid" src="<%=request.getContextPath()%>/uploads/component.jpg" alt="First slide">
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
                    <h2 class="mb-3">T-shirt</h2>

                    <p class="price-detail-wrap">
	<span class="price h3 text-warning">
		<span class="currency">€</span><span class="num">1299</span>
	</span>
                    </p>
                    <dl class="item-property">
                        <dt>Description</dt>
                        <dd><p>Here goes description consectetur adipisicing elit, sed do eiusmod
                            tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
                            quis nostrud exercitation ullamco </p></dd>
                    </dl>
                    <dl class="param param-feature">
                        <dt>Model#</dt>
                        <dd>12345611</dd>
                    </dl>
                    <dl class="param param-feature">
                        <dt>Color</dt>
                        <span  style="width:25px;background:#5a5a5a;"></span>
                        <span  style="width:25px;background:white;"></span>
                    </dl>
                    <hr>
                    <div class="row">
                        <div class="col-sm-5">
                            <dl class="param param-inline">
                                <dt>Quantity: </dt>
                                <dd>
                                    <input min="0" type="number" class="form-control form-control-sm" style="width:70px;">
                                </dd>
                            </dl>
                        </div>
                        <div class="col-sm-7">
                            <dl class="param param-inline">
                                <dt>Size: </dt>
                                <dd>
                                    <label class="form-check form-check-inline">
                                        <input class="form-check-input" type="radio" name="inlineRadioOptions" value="option2">
                                        <span class="form-check-label">SM</span>
                                    </label>
                                    <label class="form-check form-check-inline">
                                        <input class="form-check-input" type="radio" name="inlineRadioOptions" value="option2">
                                        <span class="form-check-label">MD</span>
                                    </label>
                                    <label class="form-check form-check-inline">
                                        <input class="form-check-input" type="radio" name="inlineRadioOptions" value="option2">
                                        <span class="form-check-label">XXL</span>
                                    </label>
                                </dd>
                            </dl>
                        </div>
                    </div>
                    <hr>
                    <a href="#" class="btn btn-lg btn-primary text-uppercase"> Buy now </a>
                    <a href="#" class="btn btn-lg btn-primary text-uppercase"> <i class="fa fa-shopping-cart"></i> Add to cart </a>
                    <a href="#" class="btn btn-lg btn-primary "><i class="fa fa-heart fa-lg"></i></a>
                </article>
            </aside>
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
</body>

</html>
