<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Invoice ${order.id}</title>
<!-- CSS -->
<link rel="stylesheet" href="assets/css/bootstrap.css">
<link rel="stylesheet" href="assets/css/style.css">
<link rel="stylesheet" href="assets/css/form.css">
<link rel="stylesheet" href="assets/css/invoice.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<%@include file="component/favicon.jsp"%>
<head>
<body>
    <div class="invoice-box">
        <table>
            <tr class="top">
                <td colspan="2">
                    <table>
                        <tr>
                            <td class="title">
                                <img src="<%=request.getContextPath()%>/assets/img/invoice.png" style="width:100%; max-width:300px;">
                            </td>
                            
                            <td>
                                Invoice ${order.id}<br>
                                Created: ${order.orderingDate}<br>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            
            <tr class="information">
                <td colspan="2">
                    <table>
                        <tr>
                            <td>
                                Visionario, Srls.<br>
                                Via del Fatturato<br>
                                Rho, MI<br>
                                P.IVA 12345663
                            </td>
                            
                            <td>
                                ${order.consignee}<br>
                                <br>
                                ${order.address}
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            
            <tr class="heading">
                <td>
                    Payment Method
                </td>
                                <td>
                </td>
            </tr>
            
            <tr class="details">
                <td>
                    ${order.paymentMethod}
                </td>
                                <td>
                </td>
            </tr>
            
            <tr class="heading">
                <td>
                   Item <span class="quantity">Qty&nbsp;</span>
                </td>
                
                <td>
                    Price
                </td>
            </tr>
            
            <c:forEach items="${composition}" var="prod" varStatus="i">
            <tr class="item">
                <c:set var = "price" scope = "page" value = "${prod.price.multiply(100).divide(122,2,5)}"/>
                <td class="">
                    <span class="text">${prod.text}</span> <span class="quantity">${prod.quantity}</span>
                </td>
                
                <td>
                  ${price}<span class="currency">&nbsp;€</span>
                </td>
                <c:set var = "subtotal" scope = "page" value = "${subtotal+price*prod.quantity}"/>
            </tr>
            </c:forEach>
            <tr class="item last">
                <c:set var = "price" scope = "page" value = "${order.shippingFees.multiply(100).divide(122,2,5)}"/>
                <td>
                    <span class="text">Shipping</span> <span class="quantity">1</span>
                </td>
                
                <td>
                  ${price}<span class="currency">&nbsp;€</span>
                </td>
                <c:set var = "subtotal" scope = "page" value = "${subtotal+(price)}"/>
            </tr>
            <tr class="subtotal">
<td></td>
                <td>
                   Taxable: ${subtotal}<span class="currency">&nbsp;€</span>
                </td>
            </tr>
            <tr class="subtotal">
<td></td>                <td>
                   VAT: ${order.total-subtotal}<span class="currency">&nbsp;€</span>
                </td>
            </tr>               
            <tr class="total">
                <td></td>
                <td>
                  Total Invoice: ${order.total}<span class="currency">&nbsp;€</span>
                </td>
            </tr>
        </table>
    </div>
</body>
</html>