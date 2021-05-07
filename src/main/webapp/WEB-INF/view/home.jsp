<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<html>
<head>
    <title>Home Demo</title>
</head>
<body>
<h2>Hello in demo</h2>
<hr/>
<p>User: <sec:authentication property="principal.username"/> </p>
<p>Roles: <sec:authentication property="principal.authorities"/> </p>
<hr/>
<sec:authorize access="hasRole('MANAGER')">
    <a href="${pageContext.request.contextPath}/leaders"><p>For leaders</p></a>
</sec:authorize>
<sec:authorize access="hasRole('ADMIN')">
    <a href="${pageContext.request.contextPath}/systems"><p>For admins!</p></a>
</sec:authorize>
<hr/>
<form:form action="${pageContext.request.contextPath}/logout" method="post">
    <input type="submit" value="Logout!"/>
</form:form>
</body>
</html>
