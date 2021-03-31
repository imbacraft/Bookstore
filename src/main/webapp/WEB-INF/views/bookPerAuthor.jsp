<%-- 
    Document   : bookPerAuthor
    Created on : Mar 31, 2021, 12:27:55 AM
    Author     : Σταθης Καράμπελας
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        
       
           <div>
        <select name="bookByAuthor" id="bookByAuthor" onchange="location=this.value">
            <option value="">Select book</option>
            <c:forEach items="${booksPerAuthor}" var="book">  
                  <option value="${pageContext.request.contextPath}/books/search/${book.bookid}">${book.title}</option>
        </c:forEach>
        </select>
            </div>
        
         <table border="1">
            <tr>
                <th>BookID</th>
                <th>Title</th>
                <th>BookType</th>
                <th>Category 1</th>
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
               
            </tr>   

            <c:forEach items="${booksPerAuthor}" var="book"> 

                <c:forEach begin="0" end="${books.length}" var="counter">

                    <tr>

                        <td>${book.bookid}</td>
                        <td>${book.title}</td>
                        <td>${book.booktype.name}</td>
                        <td>${book.categoryList[pageContext.getAttribute("counter")].name}</td>
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


                    </tr>
                </c:forEach>

            </c:forEach>


        </table>
        
    </body>
</html>
