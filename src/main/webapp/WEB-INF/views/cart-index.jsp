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
                <th>Book</th>
                <th>Title</th>
                <th>Format</th>
                 <th>Quantity</th>
                 <th>Subtotal</th>
                 <th>Remove</th>
            </tr>
            
            <% double total = 0.0; %>
            
            <c:forEach var="bookpercart" items="${sessionScope.cart}">
                <c:set var="subtotal" value="${bookpercart.book.price * bookpercart.quantity}"></c:set>
              
                <% total = total + (double) pageContext.getAttribute("subtotal");  %>
                
                <tr>
                    <td><a href="${pageContext.request.contextPath}/books/search/${bookpercart.book.bookid}"><img src="${bookpercart.book.frontcover}" width="100"></a></td>
                    <td>${bookpercart.book.title}</td>
                    <td>${bookpercart.book.booktype.name}</td>
                            <td>
                                <form action = "${pageContext.request.contextPath}/cart/index" method="post">
                                    <input name="bookid" value="${bookpercart.book.bookid}" hidden>
                                    <input type= "number" name ="quantity" min=1 placeholder = "${bookpercart.quantity }">
                                    <button type="submit"> Update</button>
                            </form>
                            </td>
                    <td>${subtotal} &euro;</td>
                    <td><a href="${pageContext.request.contextPath}/cart/remove/${bookpercart.book.bookid}">Remove</a></td>
                     
                   
                    
                </tr>
            </c:forEach>
                
                <tr>
                    <td colspan="6">
                        Total: <%=total%> &euro;
                    </td>
                    
                </tr>
     
                
        </table>
           

        <a href="${pageContext.request.contextPath}/home">Continue shopping</a>
        <a href="${pageContext.request.contextPath}/cart/checkout">Checkout</a>
        
        
    </body>


</html>
