<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Books per Category</title>
  

    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/booksPerCategory.css" />

    <%@include file="library-dependencies.jspf"%>  
    

</head>
  
<body>
    
<div id="bodyContainer">

      <!-- Header -->
      <%@include file="header.jspf"%>  
                   
          <section id="booksPerCategory">

                <c:forEach items="${booksPerCategory}" var="book">
                      
                        <div class="row specific-row">
                        
                                <div class="col-3">
                                  <a href="${pageContext.request.contextPath}/books/search/${book.bookid}"><img class="image" src="${book.bookdetailsList.toArray()[0].frontcover}" alt="bookImage" ></a><!--to frontcover tha nai se kathe biblio to idio, opote pairnw to [0] -->
                                </div>
                
                                <div class="col-5">
          
                                    <h4 class="mainContent"><a href="${pageContext.request.contextPath}/books/search/${book.bookid}">${book.title}</a></h4>

                                    <c:forEach items="${book.authorList}" var="author">
                                        <h4> by <a href="${pageContext.request.contextPath}/authors/${author.lastname}"> ${author.firstname}${" "}${author.lastname}</a></h4>
                                    </c:forEach>

                                    <br>
                                    
                                      <c:forEach items="${book.bookdetailsList}"  var="bookDetail">   
                                          <h5>${bookDetail.format.name}</h5>
                                          <h5>&euro; ${bookDetail.price}</h5>
                                            <c:choose>
                                                <c:when test="${bookDetail.count<30}">
                                                      <h6>⚠ Only  ${bookDetail.count} left in stock! </h6>
                                                </c:when>

                                              <c:otherwise>
                                                      <h6> ✔ In Stock - Usually dispatched within 48 hours  </h6>
                                              </c:otherwise>
                                            </c:choose>        
                                    
                                          <hr class="hr">
                                      </c:forEach>
                                  </div>
                    
                              <div class="col-4" >
                                    <div class="row add-basket">
                                  
                                      <form:form action="${pageContext.request.contextPath}/cart/buy/${book.bookid}" method="GET">
                                          <c:forEach items="${book.bookdetailsList}"  var="bookDetail">
                                          <div class="formatsBasket">
                                              <input type="radio" id="format" name="format" required value="${bookDetail.format.formatid}">
                                          <label for="format">${bookDetail.format.name}</label>
                                          </div>
                                      </c:forEach>
                                      
                                      <input class="addCartBtn" type="submit" value="Add to Cart" class="addToBasketBtn">

                                      </form:form>  
                              
                                     </div>
                                </div>
                        </div>

                        <br>
              </c:forEach>
                      
                
            </section>

</div>
  
</body>


 <!-- Footer -->
 <%@include file="footer.jspf" %>

</html>
