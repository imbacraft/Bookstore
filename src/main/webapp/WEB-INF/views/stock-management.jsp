<%-- 
    Document   : customer-home
    Created on : 27-Mar-2021, 23:05:19
    Author     : Dell
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>This is Stock Management Homepage</h1>
        
         
        <p>
            User: <sec:authentication property="principal.username"/>
            <br/>
            Role(s):<sec:authentication property="principal.authorities"/>
        </p>
        <hr/>
        <h1> Book Management Page </h1>
        
         <sec:authorize access="hasRole('STOCKMANAGER')">
        <a href="${pageContext.request.contextPath}/stock">StockManager Home</a>
         </sec:authorize>

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


            <c:forEach items="${booksList}" var="book"> 

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
                            <a href="${pageContext.request.contextPath}/stock/books/update/${book.bookid}">Update</a>
                        </td>
                        <td>
                            <a href="${pageContext.request.contextPath}/stock/books/delete?id=${book.bookid}">Delete</a>
                        </td>
                      


                    </tr>
                </c:forEach>

            </c:forEach>


        </table>
    </body>
</html>
