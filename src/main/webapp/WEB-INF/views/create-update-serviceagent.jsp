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

        <h3>Create/Update Customer Service Agent  form</h3>

        <p>${successMessage}</p>

        <br>
        
        <form:form  action="${pageContext.request.contextPath}/admin/serviceagents/update" method="POST" modelAttribute = "serviceagentToEdit">

            <label for="stockid">Service Agent ID</label>
            <form:input path="custserviceid" id="custserviceid"  value="${serviceagentToEdit.custserviceid}" readonly="true"/>

            <label for="username">Username</label>

            <form:input path="username" id="username"  placeholder="Enter Service Agent username" value="${serviceagentToEdit.username}"/>

            <br>

            <label for="password">Password</label>

            <form:input path="password" id="password"  placeholder="Enter Service Agent password"  value="${serviceagentToEdit.password}"/>

            <br>

         
            <input type="submit" value="Create/Update Service Agent"/>


        </form:form>


    </body>
</html>
