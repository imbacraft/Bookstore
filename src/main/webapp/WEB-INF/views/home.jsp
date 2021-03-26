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
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Welcome to Spring Security</h1>

        <p>
            User: <sec:authentication property="principal.username"/>
            <br/>
            Role(s):<sec:authentication property="principal.authorities"/>
        </p>
        <hr/>
        <sec:authorize access="hasRole('ADMIN')">
            <div>
                <a href="${pageContext.request.contextPath}/admin">Administrator Home Page</a>
            </div>
        </sec:authorize>
        <br/>
        <sec:authorize access="hasRole('TEACHER')">
            <div>
                <a href="/teacher">Teacher Home Page</a>
            </div>
        </sec:authorize>
        <br/>
        <form:form action="/logout" method="POST">
            <input type="submit" value="Logout">
        </form:form>
    </body>


</html>
