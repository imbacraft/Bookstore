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
        <main style="margin-left: 80px; " class="address">
            
<img src="../../glasses.png" width="100" height="100" alt=""/>
        <h1>Delivery Options</h1>

          <sec:authorize access="!isAuthenticated()">
              <h4>Recommendation: Order with a registered Customer Account to track your Order and receive Discount Coupons! </h4> <a href="${pageContext.request.contextPath}/login">Login/Register</a>
          </sec:authorize>
        <hr/>

        <sec:authorize access="hasRole('ADMIN')">
            <a href="${pageContext.request.contextPath}/admin">Administrator Home</a>
        </sec:authorize>

        <sec:authorize access="hasRole('SERVICEAGENT')">
            <a href="${pageContext.request.contextPath}/service">Service Agent Home</a>
        </sec:authorize>

        <br>

        <form:form action= "${pageContext.request.contextPath}/cart/address" method="post">


            <c:if test = "${containsOnlyEbook == false}">
                <h3>Choose delivery option:
                    <br>
                    (Applies to non ebook items)
                </h3> 

                <input type="radio" id="standard" name="delivery" value="standard" required>
                <label for="standard">Standard delivery
                    <br>
                    Ships within 4-8 working days after dispatching
                    <br>
                    Price: 15 &euro;
                </label> 

                <br>

                <input type="radio" id="express" name="delivery" value="express" required>
                <label for="express">Express delivery
                    <br>
                    Ships within 1-3 working days after dispatching
                    <br>
                    Price: 35 &euro;</label>
                </c:if>

            <br>


 
       <sec:authorize access="!isAuthenticated()">
        <!-- if user is not authenticated-->

       
          <h3>Personal details</h3> 

            <label for="firstname">First Name:</label>
            <input id="firstname" type="text" name="firstname" value="${customer.firstname}" required />

            <br>

            <label for="lastname">Last Name:</label>
            <input id="lastname" type="text" name="lastname" value="${customer.lastname}" required />

            <br>

            <label for="email">e-mail:</label>
            <input id="email" type="email" name="email" value="${customer.email}" required />

            <br>

            <label for="phone">Phone:</label>
            <input id="phone" type="text" name="phone" value="${customer.phone}" required />

            <br>

             </sec:authorize>
            
               <sec:authorize access="!isAuthenticated()">
             <c:if test = "${containsOnlyEbook == false}">
            <h3>Delivery address</h3> 


            <select id="country" name="country" required/>

            <c:choose>
                <c:when test="${customer.firstname != null}">
                <option value="${customer.country.countryid}">  ${customer.country.name}</option>
            </c:when>

            <c:otherwise>
             
                    <option value=""> Select Country </option>                 

            </c:otherwise>
        </c:choose>

        <c:forEach var = "country" items = "${countries}">
            <option value="${country.countryid}"> ${country.name}</option>                 
        </c:forEach>

    </select>

    <br>

    <label for="city">City:</label>
    <input id="city" type="text" name="city" value="${customer.city}" required/>

    <br>

    <label for="street">Street:</label>
    <input id="street" type="text" name="street" value="${customer.street}" required/>

    <label for="streetnumber">Streetnumber:</label>
    <input id="streetnumber" type="number" min="1" name="streetnumber" value="${customer.streetnumber}" required/>

    <label for="postalcode">Postal Code:</label>
    <input id="postalcode" type="number" min="1" name="postalcode" value="${customer.postalcode}" required/>

    <br>
    <br>
       </c:if>
       </sec:authorize>

    
    
    <button type="submit">Submit and Proceed to Payment via Stripe </button

</form:form>

    <br>
<a href="${pageContext.request.contextPath}/cart/index">Back to Cart</a>

    </main>

</body>


</html>
