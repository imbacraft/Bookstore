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


        <form:form  action="${pageContext.request.contextPath}/stock/books/update" method="POST" modelAttribute = "bookToEdit">
            Code: <form:input path="bookid" name="id" readonly="true" value="${bookToEdit.bookid}"/>
            <br/>

            title:<form:input path="title" name="title" value="${bookToEdit.title}"/>
            <br/>

            description: <form:input path="description" name="description" value="${bookToEdit.description}"/>

            <br/>

            Booktype:
            <form:select path = "booktype.booktypeid">

                <form:option value=""> --Select Booktype--</form:option>

                <c:forEach var = "booktype" items = "${booktypes}">
                    <form:option value="${booktype.booktypeid}"> ${booktype.name}</form:option>                 
                </c:forEach>

            </form:select>


            <br/>

            Category 1:
            <form:select path = "categoryList">

                <form:option value=""> --Select Category 1--</form:option>

                <c:forEach var = "category" items = "${categories}">
                    <form:option value="${category.categid}"> ${category.name}</form:option>                 
                </c:forEach>

            </form:select>

            <br>

            Category 2:
            <form:select path = "categoryList">

                <form:option value=""> --Select Category 2--</form:option>

                <c:forEach var = "category" items = "${categories}">
                    <form:option value="${category.categid}"> ${category.name}</form:option>                 
                </c:forEach>

            </form:select>
            <br>

            price: <form:input path="price" name="price" value="${bookToEdit.price}"/>
            <br/>

            publisher : <form:input path="publisher"  name="publisher" value="${bookToEdit.publisher}"   />
            <br/>

            publication date:<form:input path="publicationdate" name="publicationdate" value="${bookToEdit.publicationdate}"/>
            <br/>

            edition: <form:input path="edition" name="edition" value="${bookToEdit.edition}"/>
            <br/>

            pages: <form:input path="pages" name="pages" value="${bookToEdit.pages}"/>
            <br/>

            language: <form:input path="language" name="language" value="${bookToEdit.language}"/>
            <br/>

            frontCover: <form:input path="frontcover" name="frontCover" value="${bookToEdit.frontcover}"/>
            <br/>

            backCover : <form:input path="backcover"   name="backCover" value="${bookToEdit.backcover}"   />
            <br/>

            count:<form:input path="count" name="count" value="${bookToEdit.count}"/>
            <br/>

            isbn10 <form:input path="isbn10"  name="isbn10" value="${bookToEdit.isbn10}"/>
            <br/>

            isbn13: <form:input path="isbn13"  name="isbn13" value="${bookToEdit.isbn13}"/>
            <br/>


            <input type="submit" value="Submit"/>

        </form:form>


    </body>
</html>
