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


 
            <c:if test = "${customer == null}">


            <h3>Personal details</h3> 

            First Name:
            <input type="text" name="firstname" value="${customer.firstname}"required />

            <br>

            Last Name:
            <input type="text" name="lastname" value="${customer.lastname}" required />

            <br>

            Email:
            <input type="email" name="email" value="${customer.email}" required />

            <br>

            Phone:
            <input type="text" name="phone" value="${customer.phone}" required />

            <br>


            <h3>Delivery address</h3> 

            Country:
            <select name="country" required/>

            <c:choose>
                <c:when test="${customer.firstname != null}">
                <option value="${customer.country.countryid}">  ${customer.country.name}</option>
            </c:when>

            <c:otherwise>
                <c:forEach var = "country" items = "${countries}">
                    <option value=""> Select</option>                 
                </c:forEach>
            </c:otherwise>
        </c:choose>

        <c:forEach var = "country" items = "${countries}">
            <option value="${country.countryid}"> ${country.name}</option>                 
        </c:forEach>

    </select>

    <br>

    City:
    <input type="text" name="city" value="${customer.city}" required/>

    <br>

    Street:
    <input type="text" name="street" value="${customer.street}" required/>

    Streetnumber:
    <input type="number" min="1" name="streetnumber" value="${customer.streetnumber}" required/>

    Postal Code:
    <input type="number" min="1" name="postalcode" value="${customer.postalcode}" required/>

    <br>
    <br>

    </c:if>
    
    <button type="submit">Submit and Proceed to Payment via Stripe </button

</form:form>


<br>

<a href="${pageContext.request.contextPath}/cart/index">Back to Basket</a>



</body>


</html>
