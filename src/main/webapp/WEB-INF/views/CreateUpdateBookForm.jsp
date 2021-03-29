<%-- 
    Document   : CreateUpdateBookForm
    Created on : Mar 29, 2021, 2:45:37 PM
    Author     : Σταθης Καράμπελας
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
            <h1>Create your trainer</h1>
        
    <c:if test="${bookToEdit==null}">
        <c:url value="/books/create" var="link"/>
    </c:if>
    <c:if test="${booksToEdit!=null}">
        <c:url  value="/books/update" var="link"/>
    </c:if>
    
     <form:form  action="${link}" method="POST" modelAttribute = "bookToEdit">
            Code:<input path="bookid" type="number" name="id" readonly value="${bookToEdit.bookid}"/>
        <br/>
      
     title:<input path="title" type="text" name="title" value="${bookToEdit.title}"/>
        <br/>
       
       description: <input path="description" type="text" name="description" value="${bookToEdit.description}"/>
        <br/>
         
        price: <input path="price" type="number" name="price" value="${bookToEdit.price}"/>
        <br/>
        
         publisher : <input path="publisher" type="text" name="publisher" value="${bookToEdit.publisher}"   />
        <br/>
        
        publication date:<input path="publication date" type="date" name="publication date" value="${bookToEdit.publicationdate}"/>
        <br/>
       
       edition: <input path="edition" type="number" name="edition" value="${bookToEdit.edition}"/>
        <br/>
         
       pages: <input path="pages"  type="number" name="pages" value="${bookToEdit.pages}"/>
        <br/>
        
         language: <input path="language" type="text" name="language" value="${bookToEdit.language}"/>
        <br/>
         
        frontCover: <input path="frontcover" type="text" name="frontCover" value="${bookToEdit.frontcover}"/>
        <br/>
        
         backCover : <input path="backcover"  type="text" name="backCover" value="${bookToEdit.backcover}"   />
        <br/>
        
       count:<input type="number" name="count" value="${bookToEdit.count}"/>
        <br/>
       
       isbn10 <input type="text" name="isbn10" value="${bookToEdit.isbn10}"/>
        <br/>
         
       isbn13: <input  type="text" name="isbn13" value="${bookToEdit.isbn13}"/>
        <br/>
        
        
        
        <input type="submit" value="Submit"/>
     </form:form>
        
        
    </body>
</html>
