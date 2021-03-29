<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
        <title>Login page</title>
        
    </head>
    <body>

        <div>
            <div>
                
                <!-- Checks for different messages -->
                <c:if test="${param.logout != null}">
                    <div class="logout">
                        <i>You logged out successfully</i>
                    </div>
                </c:if>
                
                <c:if test="${param.error != null}">
                    <div class="error">
                        <i>Invalid credentials</i>
                    </div>
                </c:if>
                
                <c:if test="${requestScope.registered != null}">
                    <div class="registered">
                        <i>Successfully registered. Try to sign in!!!</i>
                    </div>
                </c:if>
  

                <!-- Login Form -->
                <form:form action="${pageContext.request.contextPath}/authenticate" method="post">
                    <input type="text" id="login" name="username" placeholder="login">
                    <input type="password" id="password" name="password" placeholder="password">
                    <input type="submit" value="Log In">
                </form:form>

                <!-- Register -->
                <div>
                    Don't have an account? <a href="${pageContext.request.contextPath}/register"> Register</a>
                </div>
                
                <!-- Back to HomePage -->
                <div>
                     <a href="${pageContext.request.contextPath}/home"> Home</a>
                </div>

            </div>
        </div>
    </body>
</html>
