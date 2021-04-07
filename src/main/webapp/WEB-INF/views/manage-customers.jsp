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
        <h1>Welcome to Customer Management Page</h1>
        <p>
            User: <sec:authentication property="principal.username"/>
            <br/>
            Role(s):<sec:authentication property="principal.authorities"/>
        </p>
        <hr/>

        <sec:authorize access="hasRole('ADMIN')">
            <a href="${pageContext.request.contextPath}/admin">Administrator Home</a>
        </sec:authorize>

        <sec:authorize access="hasRole('SERVICEAGENT')">
            <a href="${pageContext.request.contextPath}/service">Service Agent Home</a>
        </sec:authorize>

        <p>${successMessage}</p>
        
        <br>
        
        <a href="${pageContext.request.contextPath}/admin/customers/create">Create customer</a>
        
        <h2> Customer account details list </h2>
        <table border="1">
            <tr>
                <th>CustomerID</th>
                <th>First Name</th>
                <th>Last Name</th>
                <th>Email</th>
                <th>Phone</th>
                <th>Username</th>

                <sec:authorize access="hasRole('ADMIN')">

                    <th>Password</th>

                </sec:authorize>

                <th>Country</th>
                <th>Street</th>
                <th>Streetnumber</th>
                <th>Date of Birth</th>
                <th>Discount Coupon</th>

                <sec:authorize access="hasRole('ADMIN')">
                    <th>Update</th>
                    <th>Delete</th>

                </sec:authorize>


            </tr>   


            <c:forEach items="${listOfCustomers}" var="customer"> 

                <c:forEach begin="0" end="${customers.length}" var="counter">


                    <tr>

                        <td>${customer.customerid}</td>
                        <td>${customer.firstname}</td>
                        <td>${customer.lastname}</td>
                        <td>${customer.email}</td>
                        <td>${customer.phone}</td>
                        <td>${customer.username}</td>

                        <sec:authorize access="hasRole('ADMIN')">

                            <td>${customer.password}</td>

                        </sec:authorize>



                        <td>${customer.country.name}</td>
                        <td>${customer.street}</td>
                        <td>${customer.streetnumber}</td>
                        <td>${customer.dateofbirth}</td>
                        <td>${customer.discountcoupon}</td>


                        <sec:authorize access="hasRole('ADMIN')">
                            <td>      
                                <a href="${pageContext.request.contextPath}/admin/customers/update?id=${customer.customerid}">Update</a>
                            </td>
                            <td>
                                <a href="${pageContext.request.contextPath}/admin/customers/delete?id=${customer.customerid}">Delete</a>
                            </td>

                        </sec:authorize>


                    </tr>
                </c:forEach>

            </c:forEach>


        </table>

        <br/>

        <form:form action="${pageContext.request.contextPath}/logout" method="POST">
            <input type="submit" value="Logout">
        </form:form>
    </body>


</html>
