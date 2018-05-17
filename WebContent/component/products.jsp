<%--
  Created by IntelliJ IDEA.
  User: aymen
  Date: 02/05/2018
  Time: 12:02
  To change this template use File | Settings | File Templates.
--%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.bean.ProductBean"%>
<%@page import="model.ProductModel"%>
<%@ page import="config.Config" %>
<%@ page import="java.sql.SQLException" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%! ArrayList<ProductBean> items = null;%>
<% try {
    items = new ProductModel().doRetrieveAll();
    }catch (SQLException e){
    e.printStackTrace();
}%>
<div class="card-group">
<%for (ProductBean item : items){ %>
    <div class="card">
        <img class="card-img-top" src="<%=request.getContextPath()+Config.pathImg+item.getDefaultImage()%>" alt="<%=item.getTitle()%>">
        <div class="card-body">
            <h4 class="pull-right"><%=item.getMinPrice()%>-<%=item.getMaxPrice()%></h4>
            <h4><a href="<%=request.getContextPath()%>/product_detail?prod=<%=item.getId()%>"><%=item.getTitle()%></a></h4>
        </div>
    </div>
<%}%>
</div>
