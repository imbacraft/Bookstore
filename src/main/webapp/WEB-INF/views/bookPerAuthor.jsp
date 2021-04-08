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
        
        
    </body>
</html>
