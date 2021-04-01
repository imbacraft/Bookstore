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
        <h1>Welcome to Customer Service Agents Management Page</h1>
        <p>
            User: <sec:authentication property="principal.username"/>
            <br/>
            Role(s):<sec:authentication property="principal.authorities"/>
        </p>
        <hr/>

        <a href="${pageContext.request.contextPath}/admin">Administrator Home</a>

        <p>${successMessage}</p>

        <br>

        <a href="${pageContext.request.contextPath}/admin/serviceagents/create">Create Customer Service Agent</a>

        <h2> Customer Service Agents list </h2>

        <table border="1">
            <tr>
                <th>Serviceagent ID</th>
                <th>Username</th>
                <th>Password</th>
                <th>Update</th>
                <th>Delete</th>


            </tr>   


            <c:forEach items="${listOfServiceagents}" var="serviceagent"> 

                <tr>

                    <td>${serviceagent.custserviceid}</td>
                    <td>${serviceagent.username}</td>
                    <td>${serviceagent.password}</td>
                    <td>      
                        <a href="${pageContext.request.contextPath}/admin/serviceagents/update?id=${serviceagent.custserviceid}">Update</a>
                    </td>
                    <td>
                        <a href="${pageContext.request.contextPath}/admin/serviceagents/delete?id=${serviceagent.custserviceid}">Delete</a>
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
