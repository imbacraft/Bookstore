<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registration page</title>
      
    </head>
    <body>
       
                    <h5>Create Customer account.</h5>
                    
                    <form:form class="" method="post" action="${pageContext.request.contextPath}/register" modelAttribute="customer">

                     
                            <label for="fname" class="cols-sm-2 control-label">First Name</label>
                           
                                        <form:input class="form-control" path="firstname" id="firstname"  placeholder="Enter your first name"/>
                      
                                        <br>
                                        
                                        
                            <label for="lname" class="cols-sm-2 control-label">Last Name</label>
                            
                                        <form:input class="form-control" path="lastname" id="lastname"  placeholder="Enter your Name"/>
                                        
                                         <br>

                            <label for="email" class="cols-sm-2 control-label">Your Email</label>
                          
                                        <form:input type="email" class="form-control" path="email" id="email"  placeholder="Enter your Email"/>

                                         <br>
                                         
                            <label for="username" class="cols-sm-2 control-label">Username</label>
                          
                                        <form:input class="form-control" path="username" id="username"  placeholder="Enter your Username"/>
                                        <form:errors class="form-control" path="username"  />

                                         <br>
                                         
                                        <label for="password">Password</label>
                            
                                        <form:password class="form-control" path="password" id="password"  placeholder="Enter your Password"/>
                                        
                                        
                                         <br>
                                         
                                         <label for="country">Country</label>
                            
                                        <form:input class="form-control" path="country" id="country"  placeholder="Enter your Country"/>
                                        
                                         <br>
                                        
                                        
                                            <label for="street">Address</label>
                            
                                        <form:input class="form-control" path="street" id="street"  placeholder="Enter Street name"/>
                                        <form:input class="form-control" path="streetnumber" id="streetnumber"  placeholder="Enter Street number"/>

                    
                            <input id="button" type="submit"  value="Register"/>


                    </form:form>


    </body>
</html>
