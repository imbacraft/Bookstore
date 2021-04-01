<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Create/Update Cart</title>

    </head>
    <body>

        <h3>Create/Update Stockmanager form</h3>

        <p>${successMessage}</p>

        <br>
        
        <form:form  action="${pageContext.request.contextPath}/admin/stockmanagers/update" method="POST" modelAttribute = "stockmanagerToEdit">

            <label for="stockid">Stockmanager ID</label>
            <form:input path="stockid" id="stockid"  value="${stockmanagerToEdit.stockid}" readonly="true"/>

            <label for="username">Username</label>

            <form:input path="username" id="username"  placeholder="Enter Stockmanager username" value="${stockmanagerToEdit.username}"/>

            <br>

            <label for="password">Password</label>

            <form:input path="password" id="password"  placeholder="Enter Stockmanager password"  value="${stockmanagerToEdit.password}"/>

            <br>

         
            <input type="submit" value="Create/Update Stockmanager"/>


        </form:form>


    </body>
</html>
