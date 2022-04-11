
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Delivery Options</title>

        <%@include file="library-dependencies.jspf"%>  
       
    </head>


<body>
      
<div id="bodyContainer">

      <!-- Header -->
      <%@include file="header.jspf"%>

    <div class="deliveryOptionsContainer">
            
        <sec:authorize access="hasRole('ADMIN')">
            <a href="${pageContext.request.contextPath}/admin">Administrator Home</a>
        </sec:authorize>

        <sec:authorize access="hasRole('SERVICEAGENT')">
            <a href="${pageContext.request.contextPath}/service">Service Agent Home</a>
        </sec:authorize>


        <form:form action= "${pageContext.request.contextPath}/cart/address" method="post">

    <div class="deliveryOptions">

        <c:if test = "${containsOnlyEbook == false}">
        
            <div class="deliveryOptionsTitle">

                <h3>Choose delivery option:</h3>
                <h6>(Applies to non ebook items)</h6>   

            </div>
    
            
            <hr style="height: 1px; border-width: 0; color: #e0e0e0; background-color: #e0e0e0;"/>

        
            <div class="deliveryOptionsRadio">

                    <input type="radio" id="standard" name="delivery" value="standard" required>
           
                    <label for="standard">Standard delivery
                    </label> 
                        <br>
                        Ships within 4-8 working days after dispatching
                        <br>
                        Price: 15 &euro;

                    <br>
                    <br>

                    <input type="radio" id="express" name="delivery" value="express" required>
                    <label for="express">Express delivery
                    </label>
                        <br>
                        Ships within 1-3 working days after dispatching
                        <br>
                        Price: 35 &euro;

            </div>
            
        
        </c:if>

    </div>
      

            <br> <br>
 


        <!-- if user is NOT authenticated, which means he is not a registered customer, show the below content -->
       <sec:authorize access="!isAuthenticated()">


        <div class="advice">
            <h4>Advice from BookaPorta:</h4>
            <br>
            <h5> Order with a registered Customer Account to track your Order and receive Discount Coupons! </h5> 
            <br>
            <a href="${pageContext.request.contextPath}/login">Register here</a>
            <br>
            <br>

            <h5>Don't want to Register? Don't worry! Fill in your personal details below! We promise we won't send you spam emails!</h5>
        </div>
          


        <div id="personalDetailsContainer">

            <div class="personalDetails">
               
                <h3>Personal details</h3> 

                        <label for="firstname">First Name:</label>
                        <input class="inputs" id="firstname" type="text" name="firstname"  value="${customer.firstname}" required />

                        <br>

                        <label for="lastname">Last Name:</label>
                        <input class="inputs" id="lastname" type="text" name="lastname"  value="${customer.lastname}" required />

                        <br>

                        <label for="email">e-mail:</label>
                        <input class="inputs" id="email" type="email" name="email" value="${customer.email}" required />

                        <br>

                        <label for="phone">Phone:</label>
                        <input class="inputs" id="phone" type="number" min="1" name="phone" value="${customer.phone}" required />

                        <br>

            </div>


                        </sec:authorize>
                    
            


    <sec:authorize access="!isAuthenticated()">

        <div class="deliveryAddress">


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
    <input class="inputs" id="city" type="text" name="city" value="${customer.city}" required/>

    <br>

    <label for="street">Street:</label>
    <input class="inputs" id="street" type="text" name="street" value="${customer.street}" required/>
    <br>

    <label for="streetnumber">Streetnumber:</label>
    <input class="inputs" id="streetnumber" type="number" min="1" name="streetnumber" value="${customer.streetnumber}" required/>
    <br>
    
    <label for="postalcode">Postal Code:</label>
    <input class="inputs" id="postalcode" type="number" min="1" name="postalcode" value="${customer.postalcode}" required/>
    <br>
    
    <br>
    <br>
       </c:if>

    </div>

</div>


       </sec:authorize>



<div class="deliveryButtonsContainer">

    <a href="${pageContext.request.contextPath}/cart/index" class= "deliveryOptionsLink" >Back to Cart</a> or

    <button type="submit" class="deliveryOptionsButton">Submit and Proceed to Checkout</button>
</div>
    

        
</form:form>


    </div>

</div>

</body>


<%@include file="footer.jspf" %>

</html>
