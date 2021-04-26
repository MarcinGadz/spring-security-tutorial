<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <title>Home Demo</title>
</head>
<body>
<h2>Hello in demo</h2>
<form:form action="${pageContext.request.contextPath}/logout" method="post">
    <input type="submit" value="Logout!"/>
</form:form>
</body>
</html>
