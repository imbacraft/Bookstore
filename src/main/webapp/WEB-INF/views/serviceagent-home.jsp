<%-- 
    Document   : customer-home
    Created on : 27-Mar-2021, 23:05:19
    Author     : Dell
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>This is Service Agent Management Homepage</h1>
        
        Click <a href="${pageContext.request.contextPath}/chat">here </a>to enter Customer Service chatroom.
        <br>
        Click <a href="${pageContext.request.contextPath}/service/customers">here </a>to go to Customer Management page.
        <br>
        Click <a href="${pageContext.request.contextPath}/service/carts">here </a>to go to Order/Cart page.
        
    </body>
</html>
