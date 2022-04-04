<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <title>BookaPorta login</title>
         <link rel="stylesheet" href="./css/body.css" />
         <link rel="stylesheet" href="./css/login.css" />

        <!-- Libraries -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css"/>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"/>
        
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
         
    </head>
    <body>

    <div id="bodyContainer"> 
    
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
                            <p>Take advantage of having a BookaPorta account and benefit 
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