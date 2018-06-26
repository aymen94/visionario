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
<div class="row">
<c:forEach items="${products}" var="prod">
      <div class="col-sm-6 col-md-4 col-lg-3 card card-body d-flex flex-column">
        <img class="card-img-top" src="<%=request.getContextPath()+Config.pathImg%>${prod.defaultImage}" alt="${prod.title}">
            <h5 class="card-title"><a href="<%=request.getContextPath()%>/product_detail?prod=${prod.id}">${prod.title}</a></h5>
            <h5 class="card-text mt-auto">${prod.minPrice} € - ${prod.maxPrice} €</h5>
    </div>
</c:forEach>
</div>
