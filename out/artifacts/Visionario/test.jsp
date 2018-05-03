<%--
  Created by IntelliJ IDEA.
  User: aymen
  Date: 02/05/2018
  Time: 12:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Test page</title>
</head>
<body>

<div id="test"></div>
<script>
  var test = document.getElementById("test");
    test.textContent = navigator.userAgent;
</script>
</body>
</html>
