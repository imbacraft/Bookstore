<%-- 
    Document   : home
    Created on : Feb 18, 2021, 8:46:36 PM
    Author     : user
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Welcome to Administrator Home Page</h1>
        <p>
            User: <sec:authentication property="principal.username"/>
            <br/>
            Role(s):<sec:authentication property="principal.authorities"/>
        </p>
        <hr/>

        
        <a href="${pageContext.request.contextPath}/admin/customers">Manage Customers</a>
        <br>
        <a href="${pageContext.request.contextPath}/admin/carts">Manage Orders</a>
        <br>
        <a href="${pageContext.request.contextPath}/admin/serviceagents">Manage Customer Service Agents</a>
        <br>
        <a href="${pageContext.request.contextPath}/admin/books">Manage Books</a>
        <br>
        <a href="${pageContext.request.contextPath}/admin/stockmanagers">Manage Stock Managers</a>
        
        <br>
        <br>
        <form:form action="${pageContext.request.contextPath}/logout" method="POST">
            <input type="submit" value="Logout">
        </form:form>
    </body>
    
    
</html>
