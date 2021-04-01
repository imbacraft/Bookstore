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

        <h3>Create/Update Customer form</h3>

        <p>${successMessage}</p>

        <br>
        
        <form:form  action="${pageContext.request.contextPath}/admin/customers/update" method="POST" modelAttribute = "customerToEdit">

            <label for="customerid">Customer ID</label>
            <form:input path="customerid" id="customerid"  value="${customerToEdit.customerid}" readonly="true"/>

            <label for="firstname">First Name</label>

            <form:input path="firstname" id="firstname"  placeholder="Enter Customer first name" value="${customerToEdit.firstname}"/>

            <br>

            <label for="lastname">Last Name</label>

            <form:input path="lastname" id="lastname"  placeholder="Enter Customer Last Name"  value="${customerToEdit.lastname}"/>

            <br>

            <label for="email" >Your Email</label>

            <form:input type="email" path="email" id="email"  placeholder="Enter Customer Email"  value="${customerToEdit.email}"/>

            <br>

            <label for="phone">Phone</label>

            <form:input path="phone" id="phone"  placeholder="Enter Customer Phone" value="${customerToEdit.phone}"/>

            <br>

            <label for="username">Username</label>

            <form:input path="username" id="username"  placeholder="Enter Customer Username" value="${customerToEdit.username}"/>
            <form:errors path="username"  />

            <br>

            <label for="password">Password</label>

            <form:input path="password" id="password"  placeholder="Enter your Password" value="${customerToEdit.password}"/>


            <br>

            <label for="country">Country</label>
            
            <form:select path = "country.countryid">

                <form:option value=""> --Select Country--</form:option>

                <c:forEach var = "country" items = "${countries}">
                    <form:option value="${country.countryid}"> ${country.name}</form:option>                 
                </c:forEach>

            </form:select>


            <br>


            <label for="street">Address</label>

            <form:input path="street" id="street"  placeholder="Enter Street name" value="${customerToEdit.street}"/>
            <form:input path="streetnumber" id="streetnumber"  placeholder="Enter Street number" value="${customerToEdit.streetnumber}"/>
            <form:input path="postalcode" id="postalcode"  placeholder="Enter Postal Code" value="${customerToEdit.postalcode}"/>

            <br>

            <label for="dateofbirth">Date of Birth</label>

            <form:input type="date" path="dateofbirth" id="dateofbirth"  placeholder="Enter Date of Birth" value="${customerToEdit.dateofbirth}"/>

            <br>

            <label for="paypalaccount">PayPal Account</label>
            <form:input path="paypalaccount" id="paypalaccount"  placeholder="Enter PayPal Account" value="${customerToEdit.paypalaccount}"/>

            <br>

            <label for="discountcoupon">Discount Coupon</label>
            <form:input path="discountcoupon" id="discountcoupon"  placeholder="Enter Discount Coupon" value="${customerToEdit.discountcoupon}"/>

            
            <input type="submit" value="Create/Update Customer"/>


        </form:form>


    </body>
</html>
