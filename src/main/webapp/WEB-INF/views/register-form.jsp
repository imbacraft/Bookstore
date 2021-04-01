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

        <a href="${pageContext.request.contextPath}/home">Home</a>
        
        <h3>Register account</h3>

        <form:form method="post" action="${pageContext.request.contextPath}/register" modelAttribute="customer">


            <label for="fname">First Name</label>

            <form:input  path="firstname" id="firstname"  placeholder="Enter your first name"/>

            <br>


            <label for="lname">Last Name</label>

            <form:input  path="lastname" id="lastname"  placeholder="Enter your Name"/>

            <br>

            <label for="email" >Your Email</label>

            <form:input type="email"  path="email" id="email"  placeholder="Enter your Email"/>

            <br>

            <label for="username" >Username</label>

            <form:input path="username" id="username"  placeholder="Enter your Username" required="true"/>
            <form:errors path="username"  />

            <br>

            <label for="password">Password</label>

            <form:password path="password" id="password"  placeholder="Enter your Password"/>


            <br>

            <label for="country">Country</label>

            <form:input path="country" id="country"  placeholder="Enter your Country"/>

            <br>


            <label for="street">Address</label>

            <form:input class="form-control" path="street" id="street"  placeholder="Enter Street name"/>
            
            <label for="streetnumber">Street number</label>
            <form:input path="streetnumber" id="streetnumber"  placeholder="Enter Street number"/>
            
            <label for="street">Postal Code</label>
            <form:input path="postalcode" id="postalcode"  placeholder="Enter Postal Code" />

            <br>

            <label for="dateofbirth">Date of Birth</label>

            <form:input type="date" path="dateofbirth" id="dateofbirth"  placeholder="Enter Date of Birth" />
            
             <br>

            <label for="paypalaccount">PayPal Account</label>
            <form:input path="paypalaccount" id="paypalaccount"  placeholder="Enter PayPal Account" />

            <br>

            <input id="button" type="submit"  value="Register"/>


        </form:form>


    </body>
</html>
