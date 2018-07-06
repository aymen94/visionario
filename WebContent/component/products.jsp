<%--
  Created by IntelliJ IDEA.
  User: aymen
  Date: 02/05/2018
  Time: 12:02
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ page import="config.Config" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="row mt-3 mb-3">
<c:forEach items="${products}" var="prod">
      <div class="col-sm-6 col-md-4 col-lg-3 card card-body d-flex flex-column">
        <img class="card-img-top" src="<%=request.getContextPath()+Config.pathImg%>${prod.defaultImage}" alt="${prod.title}">
            <h5 class="card-title mb-1"><a href="<%=request.getContextPath()%>/product_detail?prod=${prod.id}<c:if test="${param.sale!=null}">&var=${prod.numReviews}
</c:if>">${prod.title}</a></h5>
            <c:choose>
                <c:when test="${param.sale==null}">
                    <h5 class="card-text mt-auto">${prod.minPrice}€ -
                        ${prod.maxPrice} €</h5>

                </c:when>
                <c:otherwise>
                    <h4 class="card-text mt-auto p-0">
                        <span class="num">${prod.minPrice}
                                <span class="currency">€</span>
                        </span> <span class="second-price">${prod.maxPrice} <span
                                class="currency">€</span></span>
                    </h4>
                </c:otherwise>
            </c:choose>
        </div>
</c:forEach>
</div>
