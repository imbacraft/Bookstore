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
        <h1>Delivery Options</h1>

        <hr/>

        <sec:authorize access="hasRole('ADMIN')">
            <a href="${pageContext.request.contextPath}/admin">Administrator Home</a>
        </sec:authorize>

        <sec:authorize access="hasRole('SERVICEAGENT')">
            <a href="${pageContext.request.contextPath}/service">Service Agent Home</a>
        </sec:authorize>

        <br>

        <form:form action= "${pageContext.request.contextPath}/cart/address" method="post">
            
            Choose delivery option:
            <br>
            
            <input type="radio" id="standard" name="delivery" value="standard">
            <label for="standard">Standard delivery</label>
            
            <input type="radio" id="express" name="delivery" value="express">
            <label for="express">Express delivery</label>
            <br>
            
            First Name:
            <input type="text" name="firstname">
            
            <br>
            
            Last Name:
            <input type="text" name="lastname">
            
            <br>
            
            Country:
            <select name="country">

                <option value=""> --Select Country--</option>

                <c:forEach var = "country" items = "${countries}">
                    <option value="${country.countryid}"> ${country.name}</option>                 
                </c:forEach>

            </select>

            <br>
            
            City:
             <input type="text" name="city">
            
            <br>
            
            Street:
            <input type="text" name="street">
            
            Streetnumber:
            <input type="number" min="1" name="streetnumber">
            
            Postal Code:
            <input type="number" min="1" name="postalcode">
            
            <button type="submit">Submit and procceed to Payment via Stripe</button>
            
            </form:form>

        <a href="${pageContext.request.contextPath}/cart/index">Back to Basket</a>

        
        
    </body>


</html>
