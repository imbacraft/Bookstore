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
        <h1>Welcome to Stockmanager Management Page</h1>
        <p>
            User: <sec:authentication property="principal.username"/>
            <br/>
            Role(s):<sec:authentication property="principal.authorities"/>
        </p>
        <hr/>

        <a href="${pageContext.request.contextPath}/admin">Administrator Home</a>

        <p>${successMessage}</p>

        <br>

        <a href="${pageContext.request.contextPath}/admin/stockmanagers/create">Create Stockmanager</a>

        <h2> Stockmanager list </h2>

        <table border="1">
            <tr>
                <th>Stockmanager ID</th>
                <th>Username</th>
                <th>Password</th>
                <th>Update</th>
                <th>Delete</th>


            </tr>   


            <c:forEach items="${listOfStockmanagers}" var="stockmanager"> 

                <tr>

                    <td>${stockmanager.stockid}</td>
                    <td>${stockmanager.username}</td>
                    <td>${stockmanager.password}</td>
                    <td>      
                        <a href="${pageContext.request.contextPath}/admin/stockmanagers/update?id=${stockmanager.stockid}">Update</a>
                    </td>
                    <td>
                        <a href="${pageContext.request.contextPath}/admin/stockmanagers/delete?id=${stockmanager.stockid}">Delete</a>
                    </td>

                </tr>

            </c:forEach>


        </table>

        <br/>

        <form:form action="${pageContext.request.contextPath}/logout" method="POST">
            <input type="submit" value="Logout">
        </form:form>
    </body>


</html>
