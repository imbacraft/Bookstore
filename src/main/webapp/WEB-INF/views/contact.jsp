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
        <title>Contact</title>

        <%@include file="library-dependencies.jspf"%>  

    </head>
    <body>

        <div id="bodyContainer">

            <!-- Header -->
            <%@include file="header.jspf"%>

            <h3 class="faqs">Contact BookaPorta Customer Service</h3>
        
            <br>

            
            <p class="contact">
                
                Didn't find the answer you were looking for at our <a href="${pageContext.request.contextPath}/faqs">FAQs page?</a>

                <br> <br>
                
                You can contact us either via e-mail at bookaportacustomerservice@gmail.com or you can press <a href="${pageContext.request.contextPath}/chat">here</a> to chat with the first available BookaPorta Customer Service agent.
            
            </p>
        
        
        </div>

    </body>


    <!-- Footer -->
    <%@include file="footer.jspf"%>


</html>
