<%-- 
    Document   : customer-home
    Created on : 27-Mar-2021, 23:05:19
    Author     : Dell
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>

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
            
            <br>
        
        <h1> Book Management Page </h1>
        
          <h1>List of books</h1>
        <div>
            <h3>Books</h3>
            <p>
                ${message}
            </p>
            <a href="${pageContext.request.contextPath}/stock/books/create">Add a book to the database</a>
        
         <sec:authorize access="hasRole('STOCKMANAGER')">
        <a href="${pageContext.request.contextPath}/stock">StockManager Home</a>
         </sec:authorize>

        <table border="1">
            <tr>
                <th>BookID</th>
                <th>Title</th>
                <th>Format</th>
                <th>Price</th>
                <th>Publisher</th>
                <th>Publication Date</th>
                <th>Edition</th>
                <th>Pages</th>
                <th>Language</th>
                <th>Front Cover</th>
                <th>Count</th>
                <th>ISBN-10</th>
                <th>ISBN-13</th>
                <th>Update</th>
                <th>Delete</th>
                
            </tr>   


            <c:forEach items="${booksList}" var="book"> 

                <c:forEach begin="0" end="${books.length}" var="counter">

                    <tr>

                        <td>${book.bookid}</td>
                        <td>${book.title}</td>
                        <td>${book.bookdetailsList[0].format.name}  </td>
                        <td>${book.bookdetailsList[0].price}</td>
                        <td>${book.bookdetailsList[0].publisher}</td>
                        <td>${book.bookdetailsList[0].publicationdate}</td>
                        <td>${book.bookdetailsList[0].edition}</td>
                        <td>${book.bookdetailsList[0].pages}</td>
                        <td>${book.bookdetailsList[0].language}</td>
                        <td>${book.bookdetailsList[0].frontcover}</td>
                        <td>${book.bookdetailsList[0].count}</td>
                        <td>${book.bookdetailsList[0].isbn10}</td>
                        <td>${book.bookdetailsList[0].isbn13}</td>

                        <td>      
                            <a href="${pageContext.request.contextPath}/stock/books/update/${book.bookid}/${book.bookdetailsList[pageContext.getAttribute("counter")].format.formatid} ">Update</a>
                        </td>
                        <td>
                            <a href="${pageContext.request.contextPath}/stock/books/delete?id=${book.bookid}">Delete</a>
                        </td>
                      


                    </tr>
                </c:forEach>

            </c:forEach>


        </table>
        
        <br>
        <form:form action="${pageContext.request.contextPath}/logout" method="POST">
            <input type="submit" value="Logout">
        </form:form>
    </body>
</html>
