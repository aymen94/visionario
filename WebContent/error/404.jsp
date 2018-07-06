<%--
  ~ Copyright (c) 2018. Visionario
  --%>

<%--
  Created by IntelliJ IDEA.
  User: aymen
  Date: 05/07/2018
  Time: 15:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page isErrorPage="true" contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <!-- style -->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/error.css">

    <title>Visionario | error 404</title></head>
<body>
    <div id='oopss'>
        <div id='error-text'>
            <span>404</span>
            <p>PAGE NOT FOUND</p>
            <p class='hmpg'><a href='<%=request.getContextPath()%>/' class="back">Back To Home</a></p>
        </div>
    </div>
</body>
</html>
