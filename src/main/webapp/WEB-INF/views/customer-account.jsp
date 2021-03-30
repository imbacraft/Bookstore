<%-- 
    Document   : customer-home
    Created on : 27-Mar-2021, 23:05:19
    Author     : Dell
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>This is Customer Homepage</h1>
        <hr>
        
        <br>
        <br>
        
        <h2>Your Account Details</h2>
        
        
        
        <p>First Name: ${customer.firstname}</p>
        <p>Last Name: ${customer.lastname}</p>
        <p>Email: ${customer.email}</p>
        <p>Username: ${customer.username}</p>
        <p>Password: ${customer.password}</p>
        <p>Country: ${customer.country}</p>
        <p>Street: ${customer.street}</p>
         <p>Street number: ${customer.streetnumber}</p>
         
         <form:form action="${pageContext.request.contextPath}/logout" method="POST">
                <input type="submit" value="Logout">
            </form:form>
    </body>
</html>
