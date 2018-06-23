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
<div class="col-sm-3">

      <div class="card card-body flex-fill">
        <img class="card-img-top" src="<%=request.getContextPath()+Config.pathImg%>${prod.defaultImage}" alt="${prod.title}">
<!--         <div class="card-footer"> -->
            <h4 class="pull-right">${prod.minPrice}-${prod.maxPrice}</h4>
            <h4><a href="<%=request.getContextPath()%>/product_detail?prod=${prod.id}">${prod.title}</a></h4>
<!--         </div> -->
    </div>
    </div>
</c:forEach>
</div>
