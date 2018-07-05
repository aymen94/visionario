<%--
  ~ Copyright (c) 2018. Visionario
  --%>

<%--
  Created by IntelliJ IDEA.
  User: aymen
  Date: 05/07/2018
  Time: 15:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page isErrorPage="true"  contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <!-- style -->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/error.css">

    <title>Visionario | error 500</title></head>
<body>
<div id='oopss'>
    <div id='error-text'>
        <span>500</span>
        <p>INTERNAL SERVER ERROR</p>
        <p class='hmpg'><a href='./' class="back">Back To Home</a></p>
    </div>
</div>
</body>
</html>
