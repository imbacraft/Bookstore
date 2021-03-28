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
        <h1>Welcome to Administrator Home Page</h1>
        <p>
            User: <sec:authentication property="principal.username"/>
            <br/>
            Role(s):<sec:authentication property="principal.authorities"/>
        </p>
        <hr/>
        <h1> Administrator Book Management Page </h1>

        <table border="1">
            <tr>
                <th>BookID</th>
                <th>Title</th>
                <th>BookType</th>
                <th>Category 1</th>
                <th>Category 2</th>
                <th>Price</th>
                <th>Publisher</th>
                <th>Publication Date</th>
                <th>Edition</th>
                <th>Pages</th>
                <th>Language</th>
                <th>Front Cover</th>
                <th>Back Cover</th>
                <th>Count</th>
                <th>ISBN-10</th>
                <th>ISBN-13</th>
                <th>Update</th>
                <th>Delete</th>
            </tr>   

            <c:set var="counter" value="0" scope="page"/>

            <c:forEach items="${listOfBooks}" var="book"> 

                <c:forEach begin="0" end="${books.length}" var="counter">

                    <tr>

                        <td>${book.bookid}</td>
                        <td>${book.title}</td>
                        <td>${book.booktype.name}</td>
                        <td>${book.categoryList[pageContext.getAttribute("counter")].name}</td>
                        <td>${book.categoryList[pageContext.getAttribute("counter")+1].name}</td>
                        <td>${book.price}</td>
                        <td>${book.publisher}</td>
                        <td>${book.publicationdate}</td>
                        <td>${book.edition}</td>
                        <td>${book.pages}</td>
                        <td>${book.language}</td>
                        <td>${book.frontcover}</td>
                        <td>${book.backcover}</td>
                        <td>${book.count}</td>
                        <td>${book.isbn10}</td>
                        <td>${book.isbn13}</td>

                        <td>      
                            <a href="${pageContext.request.contextPath}/admin/books/update/${book.bookid}">Update</a>
                        </td>
                        <td>
                            <a href="${pageContext.request.contextPath}/admin/books/delete?id=${book.bookid}">Delete</a>
                        </td>


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
