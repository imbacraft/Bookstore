<%-- 
    Document   : stockManagerHome
    Created on : Mar 29, 2021, 2:18:08 AM
    Author     : Σταθης Καράμπελας
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
            <h1>Welcome to StockManager Home Page</h1>
        <p>
            User: <sec:authentication property="principal.username"/>
            <br/>
            Role(s):<sec:authentication property="principal.authorities"/>
        </p>
        <hr/>

        
       
        <a href="${pageContext.request.contextPath}/stock/books">Manage Books</a>
        
        
      
    </body>
</html>
