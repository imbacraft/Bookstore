<%-- 
    Document   : home
    Created on : Feb 18, 2021, 8:46:36 PM
    Author     : user
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        
    </head>
    <body>
        <h3>${message}</h3>

        <c:if test = "${ebooks.size() != 0}">
            Download your new Ebook(s) from the following download URLs:
            <table cellpadding="2" cellspacing="2" border="1">
                <tr>
                    <th>Book</th>
                    <th>Title</th>
                    <th>Download URL</th>
                </tr>

                <tr>
                    <c:forEach var="ebook" items="${ebooks}">
                        <td>
                            <img src="${ebook.key.bookdetails.frontcover}" width="100" alt="ebookimg" />            
                        </td>
                        <td>
                             <c:out value="${ebook.key.bookdetails.book.title}"/>
                        </td>
                        <td>
                           <a href="${ebook.value}" download="${ebook.key.bookdetails.book.title}" >Download link</a>
                        </td>
                        
                    </c:forEach>

                </tr>

            </table>

        </c:if>

            <br>

        <c:if test = "${fn:contains(message, 'Success')}">
            Cart Details
            <table cellpadding="2" cellspacing="2" border="1">
                <tr>
                    <th>Book</th>
                    <th>Title</th>
                    <th>Format</th>
                    <th>Quantity</th>
                    <th>Subtotal</th>
                </tr>



                <% double total = 0.0; %>

                <c:forEach var="cartitem" items="${sessionScope.cart}">


                    <c:set var="subtotal" value="${cartitem.bookdetails.price * cartitem.quantity}"></c:set>


                        <tr>
                            <td><a href="${pageContext.request.contextPath}/books/search/${cartitem.bookdetails.book.bookid}"><img src="${cartitem.bookdetails.frontcover}" width="100"></a></td>
                        <td>${cartitem.bookdetails.book.title}</td>
                        <td>${cartitem.bookdetails.format.name}</td>
                        <td> ${cartitem.quantity } </td>
                        <td> <fmt:formatNumber value="${subtotal}" maxFractionDigits="3"/>&euro;</td>

                        <% total = total + (double) pageContext.getAttribute("subtotal"); %>
                    </tr>
                </c:forEach>




                <tr>
                    <td colspan="6">
                        Shipping cost: <fmt:formatNumber value="${shippingCost}" maxFractionDigits="3"/>&euro;
                    </td>

                    <% total = total + (double) request.getAttribute("shippingCost"); %>
                    <% pageContext.setAttribute("total", total); %>

                <tr>
                    <td colspan="6">
                        Total: <fmt:formatNumber value="${total}" maxFractionDigits="3"/>&euro;
                    </td>

                </tr>


            </table>

            <br>

            <table cellpadding="2" cellspacing="2" border="1">
                <tr>
                    <th>First name</th>
                    <th>Last name</th>
                    <th>Email</th>
                    <th>Phone</th>

                </tr>

                <tr>
                    <td>${customer.firstname} ${visitor.firstname}</td>
                    <td>${customer.lastname} ${visitor.lastname}</td>
                    <td>${customer.email} ${visitor.email}</td>
                    <td>
                        <c:choose>

                            <c:when test = "${customer.firstname==null}">
                                ${visitor.phone}
                            </c:when>

                            <c:otherwise>
                                ${customer.phone}
                            </c:otherwise>
                        </c:choose>


                    </td>

                </tr>

            </table>

            <br>

            Delivery Address
            <table cellpadding="2" cellspacing="2" border="1">
                <tr>
                    <th>Country</th>
                    <th>City</th>
                    <th>Street</th>
                    <th>Street number</th>
                    <th>Postal Code</th>
                </tr>

                <tr>
                    <td>${customer.country.name} ${visitor.country.name}</td>
                    <td>${customer.city} ${visitor.city}</td>
                    <td>${customer.street} ${visitor.street}</td>
                    <td>
                        <c:choose>

                            <c:when test = "${customer.firstname==null}">
                                ${visitor.streetnumber}
                            </c:when>

                            <c:otherwise>
                                ${customer.streetnumber}
                            </c:otherwise>
                        </c:choose>

                    </td>
                    <td>
                        <c:choose>

                            <c:when test = "${customer.firstname==null}">
                                ${visitor.postalcode}
                            </c:when>

                            <c:otherwise>
                                ${customer.postalcode}    
                            </c:otherwise>
                        </c:choose>
                    </td>

                </tr>


            </table>

        </c:if>


            <a href="${pageContext.request.contextPath}/home">Back to home</a>






    </body>


</html>
