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

        Cart  Details
        <table cellpadding="2" cellspacing="2" border="1">

            <% double total = 0.0; %>
            
            <c:forEach var="bookpercart" items="${sessionScope.cart}">
                <c:set var="subtotal" value="${bookpercart.book.price * bookpercart.quantity}"></c:set>
              
                <% total = total + (double) pageContext.getAttribute("subtotal");  %>
                
                <tr>
                    <td><a href="${pageContext.request.contextPath}/books/search/${bookpercart.book.bookid}"><img src="${bookpercart.book.frontcover}" width="100"></a>
                        
                    ${bookpercart.book.title}
                    
                    ${bookpercart.book.booktype.name}

                    <br>
                    
                    Quantity: ${bookpercart.quantity }

                            </td>
                    <td>${subtotal} &euro;</td>
                     
                   
                    
                </tr>
            </c:forEach>
                
                <tr>
                    <td colspan="6">
                        Total: <%=total%> &euro;
                    </td>
                    
                </tr>
     
                
        </table>
           

        <a href="${pageContext.request.contextPath}/cart/index">Back to Basket</a>
        
        <a href="${pageContext.request.contextPath}/cart/payment">Procceed to Payment</a>
        
        
    </body>


</html>
