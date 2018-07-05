<%@page import="java.math.BigDecimal"%>
<%@page import="java.util.List"%>
<%@page import="model.bean.CartBean"%>
<%@page import="model.bean.CartItem"%>
<%@page import="model.bean.ProductBean"%>
<%@page import="model.bean.VariantBean"%>



<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
    CartBean cartMap = (CartBean) session.getAttribute("cart");
    if (cartMap == null) {
        cartMap = new CartBean();
    }
    CartItem c = new CartItem();
	c.setId(1);
	c.setVariantId((short)1);
	
	CartItem c1 = new CartItem();
	c1.setId(2);
	c1.setVariantId((short)1);
	
	cartMap.put(c, 2);
	cartMap.put(c1, 0);
    session.setAttribute("cart", cartMap);
%>

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
    <div class="row">
        <div class="col-sm-12 col-md-10 col-md-offset-1">
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
                    <%
                        BigDecimal subtotal = new BigDecimal(0);
                        for (CartItem x : cartMap.getItems()) {
                            ProductBean prod = x.getProduct();
                            VariantBean var = x.getVariant();
                            
                            subtotal = subtotal.add(var.getDiscountedPrice()
                                    .multiply(BigDecimal.valueOf(cartMap.getQuantity(x))));
                    %>
                    <tr>
                        <td class="col-sm-8 col-md-6">
                            <div class="media">
                                <a class="thumbnail pull-left" href="#"> <img
                                    class="media-object"
                                    src="http://icons.iconarchive.com/icons/custom-icon-design/flatastic-2/72/product-icon.png"
                                    style="width: 72px; height: 72px;">
                                </a>
                                <div class="media-body">
                                    <h4 class="media-heading">
                                        <a
                                            href="<%=request.getContextPath()%>/product_detail?prod=<%=prod.getId()%>"><%=prod.getTitle()%></a>
                                    </h4>
                                    <span>Status: </span><span
                                        class="text-success"><strong><%=cartMap.getQuantity(x)%></strong></span>


                                </div>
                            </div>
                        </td>
                        <td class="col-sm-1 col-md-1" style="text-align: center">
                            <input type="number" class="form-control"
                            id="inputQuantity" value=<%=cartMap.getQuantity(x)%>>
                        </td>

                        <td class="col-sm-1 col-md-1 text-center"><strong><%=var.getDiscountedPrice()%></strong></td>
                        <td class="col-sm-1 col-md-1 text-center"><strong><%=var.getDiscountedPrice()
                        .multiply(BigDecimal.valueOf(cartMap.getQuantity(x)))%></strong></td>
                        <td class="col-sm-1 col-md-1"></td>
                        <td>
                            
                   			
                        </td>
                        
                    </tr>

                    <tr>
                        <td> </td>
                        <td> </td>
                        <td> </td>
                        <td><h5>Subtotal</h5><%=subtotal%></td>
                        <td class="text-right"><h5>
                                <strong></strong>
                            </h5></td>
                    </tr>



                    <%!public BigDecimal estimatedShip(BigDecimal subtotal) {
        if ((new BigDecimal("30").compareTo(subtotal)) == 1) {
            return BigDecimal.valueOf(10);
        }
        return BigDecimal.valueOf(0);
    }%>
                    <tr>
                        <td> </td>
                        <td> </td>
                        <td> </td>
                        <td><h5>Estimated ship</h5></td>
                        <td class="text-right"><h5>
                                <strong><%=estimatedShip(subtotal)%></strong>
                            </h5></td>
                    </tr>
                    <tr>
                        <td> </td>
                        <td> </td>
                        <td> </td>
                        <td><h3>Total</h3></td>
                        <td class="text-right"><h3>
                                <strong><%=subtotal.add(estimatedShip(subtotal))%></strong>
                            </h3></td>
                    </tr>
                    <tr>
                        <td> </td>
                        <td> </td>
                        <td> </td>
                        <td>
                            <button type="button" class="btn btn-default"
                                onclick="location.href='index.jsp'">
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
</body>
</html>