<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<html>
<head>
    <title>Error 404</title>

    <spring:url value="/resources/css/template.css" var="template_style"/>
    <link href="${template_style}" rel="stylesheet"/>

</head>
<body>
<div class="alert alert-danger centered-error">
    <h1><strong>404 Not found</strong></h1>
    <p><strong><spring:message code="error.404.msg"/></strong></p>
    <img src="/resources/images/these_are_not_the_droids.jpg">
    <p><strong><spring:message code="error.404.busines"/></strong></p>
    <p><strong><spring:message code="error.404.move.along"/><a href="/">&nbsp;main page.</a></strong></p>
</div>
</body>
</html>
