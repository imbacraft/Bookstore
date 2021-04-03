<%-- 
    Document   : login.jsp
    Created on : 1 Απρ 2021, 3:47:58 π.μ.
    Author     : george
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>


<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <title>BookaPorta bookstore login</title>
        <%@include file="styles.jspf" %>
    </head>
    <body style="max-width: 1024px; margin: 0 auto;">
        <%@include file="banner_greece.jspf" %>
        <%@include file="header.jspf" %>
        <%@include file="login-form.jspf" %>
        <%@include file="footer.jspf" %>
    </body>
</html>