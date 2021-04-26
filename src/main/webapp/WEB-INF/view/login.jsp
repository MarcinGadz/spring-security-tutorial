<%--
  Created by IntelliJ IDEA.
  User: marcin
  Date: 26.04.2021
  Time: 22:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <title>Login!</title>
</head>
<body>
<h2>Login page</h2>
<form:form action="${pageContext.request.contextPath}/authUser" method="post">
    <p>Username: <input type="text" name="username"/></p>
    <p>Password: <input type="password" name="password"/></p>
    <input type="submit" value="Login!"/>
</form:form>
</body>
</html>
