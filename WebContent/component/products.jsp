<%--
  Created by IntelliJ IDEA.
  User: aymen
  Date: 02/05/2018
  Time: 12:02
  To change this template use File | Settings | File Templates.
--%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.ProductBean"%>
<%@page import="model.ProductModel"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<div class="card-group">

<% ProductModel model = new ProductModel();

ArrayList<ProductBean> items= new ArrayList<>();
items.add(model.doRetrieveByKey(1));
items.add(model.doRetrieveByKey(2));
for (ProductBean item: items){
%>
    <div class="card">
        <img class="card-img-top" src="<%=request.getContextPath()+item.getDefaultImage()%>" alt="Card image cap">
        <div class="card-body">
            <h4 class="pull-right"><%=item.getLowerPrice() %>-<%=item.getMaxPrice()%></h4>
            <h4><a href="<%=request.getContextPath()%>/product_detail.jsp"><%=item.getTitle() %></a></h4>
        </div>
    </div>
<%} %>
</div>
