<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <title>Your Cart</title>

        <%@include file="library-dependencies.jspf"%>  

    </head>
    <body>

    <div id="bodyContainer">

        <!-- Header -->
        <%@include file="header.jspf"%>
        
        <div id="empty-error-page">
            <h3>Your cart is currently empty.</h3>
            <br><br>
            <a id="continue-shopping" href="${pageContext.request.contextPath}/home">Buy yourself something first!</a>
        </div>
        
        
        
            
            <div id="cart-contents">   
                        
                            <sec:authorize access="hasRole('ADMIN')">
                                <a href="${pageContext.request.contextPath}/admin">Administrator Home</a>
                            </sec:authorize>
                    
                            <sec:authorize access="hasRole('SERVICEAGENT')">
                                <a href="${pageContext.request.contextPath}/service">Service Agent Home</a>
                            </sec:authorize>
                    
                    
                    <% double total = 0.0; %>
                            
                    <c:forEach var="cartitem" items="${sessionScope.cart}">

                    
                    <div class="bookItem">



                            
                            <table class="bookTitle">
                        
                    
                                    <c:set var="subtotal" value="${cartitem.bookdetails.price * cartitem.quantity}"></c:set>
                    
                    
                    
                                    <% total = total + (double) pageContext.getAttribute("subtotal");  %>
                    
                                    <tr>
                                        <td><a href="${pageContext.request.contextPath}/books/search/${cartitem.bookdetails.book.bookid}"><img src="${cartitem.bookdetails.frontcover}"></a></td>
                                        <td>
                                            <p id="table-title">${cartitem.bookdetails.book.title}</p>
                                            <p id="table-format">${cartitem.bookdetails.format.name}</p>
                                        </td>
                                        
                    
                                    </tr> 
                            </table>                   
                                        
                                        
                                        
                                        
                                        
                            <table class="quantityAndSubtotal">
                                <tr>
                    
                                    <th>Quantity</th>
                                    <th>Subtotal</th>
                                </tr>                
                                        
                                        <td>
                                            <c:choose>
                                                <c:when test = "${cartitem.bookdetails.format.formatid != 4}">
                                                    <form:form action = "${pageContext.request.contextPath}/cart/index" method="post">
                                                        <input name="bookid" id="bookid" value="${cartitem.bookdetails.book.bookid}" hidden>
                                                        <input name="formatid" id="formatid" value="${cartitem.bookdetails.format.formatid}" hidden>
                                                        <input type= "number" id="quantity" name ="quantity" value = ${cartitem.quantity } min="1" placeholder = "${cartitem.quantity }">
                                                
                                                        <button type="submit" class="updateQuantityButton">Update</button>
                                        
                                                    </form:form>
                                                </c:when>
                    
                                                <c:otherwise>
                                                    ${cartitem.quantity }
                                                </c:otherwise>
                                            </c:choose>
                    
                                        </td>
                                        <td> <fmt:formatNumber value="${subtotal}" maxFractionDigits="3"/> &euro;</td>
                                        <td><a class="removeButton" href="${pageContext.request.contextPath}/cart/remove/${cartitem.bookdetails.book.bookid}/${cartitem.bookdetails.format.formatid}">Remove</a></td>
                    
                    
                    
                                    </tr> 
                            </table>

                        </div>

                </c:forEach>

                    
            </div>
                 


            <div class="next-step">

                <a id="continue-shopping" href="${pageContext.request.contextPath}/home">Continue shopping</a>


                <div class="proccedToCheckoutContainer">
                    <% pageContext.setAttribute("total", total); %>
                    <a class="ultimateTotalLink" href="${pageContext.request.contextPath}/cart/address"><p class="ultimateTotal">Books Total: <fmt:formatNumber value="${total}" maxFractionDigits="3"/> &euro;</p></a>
                    <a id="proceed-checkout"  href="${pageContext.request.contextPath}/cart/address">Proceed to Delivery Options</a>
                </div>
             
            </div>
        
           <br>



    </div>

        <script>
            if (<%=cartAmount%> === 0 ) {
                document.getElementById("cart-contents").style.display = "none";
                document.querySelector(".next-step").style.display = "none"
                document.getElementById("empty-error-page").style.display = "block";
            };
        </script>
    </body>

    <%@include file="footer.jspf" %>

</html>