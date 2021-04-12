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

        <h1>Create/Update Book Form</h1>


        <form:form  action="${pageContext.request.contextPath}/stock/books/update" method="POST">
            Code: <input  name="id" readonly value="${bookToEdit.bookid}"/>
            <br/>

            title:<input  name="title" value="${bookToEdit.title}"/>
            <br/>

            description: <input name="description" value="${bookToEdit.description}"/>

            <br/>

            Format:
            <select name="format">

                <option value=""> ${bookdetails.format.name}--</option>

                <c:forEach var = "format" items = "${formats}">
                    <option value="${format.formatid}"> ${format.name}</option>                 
                </c:forEach>

            </select>


            <br/>

            Category:
            <select name="category">

                <option value=""> ${bookToEdit.categoryList[0].name}--</option>

                <c:forEach var = "category" items = "${categories}">
                    <option value="${category.categoryid}"> ${category.name}</option>                 
                </c:forEach>

            </select>

            <br>

 
            price: <input name="price" value="${bookdetails.price}"/>
            <br/>

            publisher : <input   name="publisher" value="${bookdetails.publisher}"   />
            <br/>

            publication date:<input  name="publicationdate" value="${bookdetails.publicationdate}"/>
            <br/>

            edition: <input  name="edition" value="${bookdetails.edition}"/>
            <br/>

            pages: <input name="pages" value="${bookdetails.pages}"/>
            <br/>

            language: <input name="language" value="${bookdetails.language}"/>
            <br/>

            frontCover: <input name="frontcover" value="${bookdetails.frontcover}"/>
            <br/>
 

            count:<input name="count" value="${bookdetails.count}"/>
            <br/>

            isbn10 <input  name="isbn10" value="${bookdetails.isbn10}"/>
            <br/>

            isbn13: <input  name="isbn13" value="${bookdetails.isbn13}"/>
            <br/>


            <input type="submit" value="Submit"/>

        </form:form>


    </body>
</html>
