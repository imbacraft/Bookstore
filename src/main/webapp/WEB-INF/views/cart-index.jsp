<%-- 
    Document   : home
    Created on : Feb 18, 2021, 8:46:36 PM
    Author     : user
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
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

            <c:forEach var="cartitem" items="${sessionScope.cart}">


                <c:set var="subtotal" value="${cartitem.bookdetails.price * cartitem.quantity}"></c:set>

              

                <% total = total + (double) pageContext.getAttribute("subtotal");  %>

                <tr>
                    <td><a href="${pageContext.request.contextPath}/books/search/${cartitem.bookdetails.book.bookid}"><img src="${cartitem.bookdetails.frontcover}" width="100"></a></td>
                    <td>${cartitem.bookdetails.book.title}</td>
                    <td>${cartitem.bookdetails.format.name}</td>
                    <td>
                        <form:form action = "${pageContext.request.contextPath}/cart/index" method="post">
                            <input name="bookid" id="bookid" value="${cartitem.bookdetails.book.bookid}" hidden>
                            <input name="formatid" id="formatid" value="${cartitem.bookdetails.format.formatid}" hidden>
                            <input type= "number" id="quantity" name ="quantity" value = ${cartitem.quantity } min=1 placeholder = "${cartitem.quantity }">
                            <button type="submit">Update </button>
                        </form:form>
                    </td>
                    <td> <fmt:formatNumber value="${subtotal}" maxFractionDigits="3"/>&euro;</td>
                    <td><a href="${pageContext.request.contextPath}/cart/remove/${cartitem.bookdetails.book.bookid}/${cartitem.bookdetails.format.formatid}">Remove</a></td>



                </tr>
            </c:forEach>

                <% pageContext.setAttribute("total", total); %>
            <tr>
                <td colspan="6">
                    Total: <fmt:formatNumber value="${total}" maxFractionDigits="3"/>&euro;
                </td>

            </tr>


        </table>


        <a href="${pageContext.request.contextPath}/home">Continue shopping</a>
        <a href="${pageContext.request.contextPath}/payment">Procceed to Delivery Address Options</a>


    </body>


</html>
