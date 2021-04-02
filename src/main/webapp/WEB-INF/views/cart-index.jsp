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
        <h1>Shopping Cart</h1>

        <hr/>

        <sec:authorize access="hasRole('ADMIN')">
            <a href="${pageContext.request.contextPath}/admin">Administrator Home</a>
        </sec:authorize>

        <sec:authorize access="hasRole('SERVICEAGENT')">
            <a href="${pageContext.request.contextPath}/service">Service Agent Home</a>
        </sec:authorize>

        <br>

        <table cellpadding="2" cellspacing="2" border="1">
            <tr>
                <th>Product</th>
                <th>Title</th>
                <th>Format</th>
                 <th>Quantity</th>
                 <th>Price</th>
            </tr>
            <c:set var="total" value="0"></c:set>
            <c:forEach var="bookpercart" items="${sessionScope.cart}">
                <tr>
                    <td><img src="${bookpercart.book.frontcover}" width="50"></td>
                    <td>${bookpercart.book.title}</td>
                    <td>${bookpercart.book.booktype.name}</td>
                    <td>${bookpercart.quantity }</td>
                    <td>${bookpercart.book.price }</td>
                    
                </tr>
            </c:forEach>
        </table>

        <a href="${pageContext.request.contextPath}/home">Continue shopping</a>
        <a href="${pageContext.request.contextPath}/cart/checkout">Checkout</a>
        
        
    </body>


</html>
