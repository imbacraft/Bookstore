<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Create/Update Cart</title>

    </head>
    <body>

        <h3>Create/Update Cart form</h3>

        <p>${successMessage}</p>

        <br>
        
        <form:form  action="${pageContext.request.contextPath}/service/carts/update" method="POST" modelAttribute = "cartToEdit">

            <label for="cartid">Cart ID</label>
            <form:input path="cartid" id="cartid"  value="${cartToEdit.cartid}" readonly="true"/>

            <label for="customerid">Customer ID</label>

            <form:input path="customer.customerid" id="customerid"  placeholder="Enter Customer first name" value="${cartToEdit.customer.customerid}"/>

            <br>

            <label for="visitorid">Visitor ID</label>

            <form:input path="visitor.visitorid" id="visitorid"  placeholder="Enter Visitor ID"  value="${cartToEdit.visitor.visitorid}"/>

            <br>

            <label for="datetime" >Datetime</label>

            <form:input type="datetime-local" path="datetime" id="datetime"  placeholder="Enter DateTime"  value="${cartToEdit.datetime}"/>

            <br>
            
            <label for="payment">Payment</label>

            <form:input path="payment" id="payment"  placeholder="Enter Payment" value="${cartToEdit.payment}"/>

            <br>
            
            <label for="quantity">Quantity</label>

            <form:input path="quantity" id="quantity"  placeholder="Enter Quantity" value="${cartToEdit.quantity}"/>

            <br>

            <label for="pricebeforetax">Price before tax</label>

            <form:input path="pricebeforetax" id="pricebeforetax"  placeholder="Enter Price before Tax" value="${cartToEdit.pricebeforetax}"/>

            <br>

            <label for="shippingcost">Shipping Cost</label>

            <form:input path="shippingcost" id="shippingcost"  placeholder="Enter shipping cost" value="${cartToEdit.shippingcost}"/>


            <br>

            <label for="tax">Tax</label>

            <form:input path="tax" id="tax"  placeholder="Enter tax" value="${cartToEdit.tax}" />

            <br>


            <label for="totalprice">Total Price</label>

            <form:input path="totalprice" id="totalprice"  placeholder="Enter Total Price" value="${cartToEdit.totalprice}"/>



            
            <input type="submit" value="Create/Update Cart"/>


        </form:form>


    </body>
</html>
