<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Login!</title>
</head>
<body>
<h2>Login page</h2>
<form:form action="${pageContext.request.contextPath}/authUser" method="post">
    <c:if test="${param.error != null}">
        <b>Wrong data!</b>
    </c:if>
    <c:if test="${param.logout != null}">
        <b>You have been logged out</b>
    </c:if>
    <p>Username: <input type="text" name="username"/></p>
    <p>Password: <input type="password" name="password"/></p>
    <input type="submit" value="Login!"/>
</form:form>
</body>
</html>
