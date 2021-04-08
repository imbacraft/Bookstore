<%-- 
    Document   : home
    Created on : Feb 18, 2021, 8:46:36 PM
    Author     : user
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <title>BookaPorta bookstore landing page</title>
        <%@include file="styles.jspf" %>
    </head>

    <body >
        <%@include file="banner_greece.jspf" %>
        <%@include file="header.jspf" %>
        <%@include file="main_menu_bar.jspf" %>
        <%@include file="frontmatter.jspf" %>
        <%@include file="footer.jspf" %>
    </body>
</html>

