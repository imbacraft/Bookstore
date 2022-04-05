<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <link rel="icon" href="./images/favicon.ico">


        <title>BookaPorta login</title>

    
        <link rel="stylesheet" href="./css/body.css" />
        <link rel="stylesheet" href="./css/login.css" />

         <%@include file="library-dependencies.jspf" %>
         
    </head>
    <body>

    <div id="bodyContainer"> 
    
      <!-- Include Header   -->
      <%@include file="header.jspf"%>

            <h3>Account login & registration</h3>  
 
                <div class="login-area">
                    <div class="log-reg-box" id="loginItemBox">
         
                        <!-- Login Form --> 
                        <form:form action="${pageContext.request.contextPath}/authenticate" method="post">
            
                        <p class="title">Are you already a member?</p>
             
                        <div>         
                            <c:if test="${param.error != null}">
                                <div class="login-error">
                                ❌ Invalid username or password. Please try again.
                                </div>
                            </c:if> 
                        </div>
            
                        <div class="credentials">
                            <input type="text" id="login" name="username" placeholder="login" size="40" required>

                            <input type="password" id="password" name="password" placeholder="password" size="40" required>
                        </div>
           
                        <div class="login-button">
                            <input type="submit" value="Log In">
                        </div>
                        </form:form>
                    </div>
            
    
                    <div class="log-reg-box">
                        <!-- Register -->
                            <p class="title">Don't have an account?</p>
                            <p id="registerText">Take advantage of having a BookaPorta account and benefit 
                                from easier transactions, special offers and more!</p>
                            
                            <a id="register-button" href="${pageContext.request.contextPath}/register"><Button>Register</button></a>
                                    
                        
                    </div> 
                </div>     
                    
                    

        <div>
            <div>
                
                <!-- Checks for different messages -->
                <c:if test="${param.logout != null}">
                    <div class="logout">
                        <i>You logged out successfully</i>
                    </div>
                </c:if>
                

                
                <c:if test="${requestScope.registered != null}">
                    <div class="registered">
                        <i>Successfully registered. Try to sign in.</i>
                    </div>
                </c:if>
  


            </div>


                
               

            </div>
        </div>

        <%@include file="footer.jspf" %>

    </div>


    </body>


</html>