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
        <title>Bookstore Home</title>
    </head>
    <body>
        <h1>Welcome to our Bookstore!</h1>
        <hr/>

        <h2>This is Visitor's homepage</h2>


        <sec:authorize access="!isAuthenticated()">

            <!-- if user is not authenticated, show this link. Otherwise, it stays hidden.--> 
            <a href="${pageContext.request.contextPath}/login">Login with your customer acccount</a>

            <br>
            
            Don't have an account? <a class="underlineHover" href="${pageContext.request.contextPath}/register"> Register</a>

        </sec:authorize>


        <h3>Bestseller books</h3>



        <sec:authorize access="hasRole('ADMIN')">
            <div>
                <a href="${pageContext.request.contextPath}/admin">Administrator Management Page</a>
            </div>

            <p>
                User: <sec:authentication property="principal.username"/>
                <br/>
                Role(s):<sec:authentication property="principal.authorities"/>
            </p>

            <form:form action="${pageContext.request.contextPath}/logout" method="POST">
                <input type="submit" value="Logout">
            </form:form>

        </sec:authorize>

        <br/>

        <sec:authorize access="hasRole('CUSTOMER')">

            <div>
                <h3>Welcome, <sec:authentication property="principal.username" /> !</h3>
            </div>

            <div>
                <a href="${pageContext.request.contextPath}/customer">Account Details</a>
            </div>

            <br>

            <form:form action="${pageContext.request.contextPath}/logout" method="POST">
                <input type="submit" value="Logout">
            </form:form>

        </sec:authorize>



        <sec:authorize access="hasRole('SERVICEAGENT')">
            <div>
                <a href="${pageContext.request.contextPath}/service">Go to Customer Service Agent Management Page</a>
            </div>

            <form:form action="${pageContext.request.contextPath}/logout" method="POST">
                <input type="submit" value="Logout">
            </form:form>

        </sec:authorize>


        <sec:authorize access="hasRole('STOCKMANAGER')">
            <div>
                <a href="${pageContext.request.contextPath}/stock">Go to Stock Management Page</a>
            </div>

            <form:form action="${pageContext.request.contextPath}/logout" method="POST">
                <input type="submit" value="Logout">
            </form:form>

        </sec:authorize>




    </body>



</html>
