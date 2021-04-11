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
        <h3>Contact BookaPorta Customer Service</h3>
        <hr/>

        <p>Didn't find the answer you were looking for at our <a href="${pageContext.request.contextPath}/faqs">FAQs page?</a></p>
        
        <p>You can contact us either via e-mail at bookaportacustomerservice@gmail.com or you can press <a href="${pageContext.request.contextPath}/chat">here</a> to chat with the first available BookaPorta Customer Service agent</p>
        
        
        <a href="${pageContext.request.contextPath}/home">Home</a>


    </body>


</html>
