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
<link rel="stylesheet" href="assets/css/invoice.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<body>
<head>
<body>
    <div class="invoice-box">
        <table>
            <tr class="top">
                <td colspan="2">
                    <table>
                        <tr>
                            <td class="title">
                                <img src="https://www.sparksuite.com/images/logo.png" style="width:100%; max-width:300px;">
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
                                Sparksuite, Inc.<br>
                                12345 Sunny Road<br>
                                Sunnyville, CA 12345
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
                <td class="d-flex">
                   Item <span class="ml-auto">Quantity&nbsp;</span>
                </td>
                
                <td>
                    Price
                </td>
            </tr>
            
            <c:forEach items="${composition}" var="prod" varStatus="i">
            <tr class="item <c:if test="${i.index==composition.size()}">last</c:if>">
                <td class="d-flex">
                    ${prod.text} <span class="ml-auto">${prod.quantity}</span>
                </td>
                
                <td>
                    ${prod.price}
                </td>
            </tr>
            </c:forEach>        
            <tr class="total">
                <td></td>
                
                <td>
                   ${order.total}
                </td>
            </tr>
        </table>
    </div>
</body>
</html>