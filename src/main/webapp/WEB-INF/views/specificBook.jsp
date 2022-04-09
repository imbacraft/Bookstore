<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
        <title>${book.title}e</title>

        <%@include file="library-dependencies.jspf"%>  
    
    </head>


 <body>


<div id="bodyContainer">

    <!-- Header -->
    <%@include file="header.jspf"%>  
                 
        <section id="booksPer">

                      <div class="specific-row">
                      
                              <div class="col-3">
                                  <img class="frontcover" src="${detailsByBookAndFormatId.frontcover}" alt="frontcover not found">
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
                                                    <h6 id="warningLowStock">⚠ Only  ${bookDetail.count} left in stock! </h6>
                                              </c:when>

                                            <c:otherwise>
                                                    <h6 id="inStock"> ✔ In Stock - Usually dispatched within 48 hours  </h6>
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


                    
              


        <div class="secTitle">Description
          <hr style="height: 1px; border-width: 0; color: #e0e0e0; background-color: #e0e0e0;"/>


        </div>



        <p class=description>${book.description}</p>



        <br>


          <div class="secTitle">Book Information
            <hr style="height: 1px; border-width: 0; color: #e0e0e0; background-color: #e0e0e0;"/>
          </div>



                <ul class=specificInfos>
                      <li><p class="specificInfoTitle">Categories:</p>    <c:forEach items="${categByBook}" var="categ">${categ.name}${"  "}</c:forEach></li>
                      <br>
                      <li><p class="specificInfoTitle">Publisher:</p>   <span class="info">${detailsByBookAndFormatId.publisher}</span></li>
                      <br>
                      <li><p class="specificInfoTitle">Publication date:</p>   <span class="info">${detailsByBookAndFormatId.publicationdate}</span></li>
                      <br>
                      <li><p class="specificInfoTitle">Edition:</p>   <span class="info">${detailsByBookAndFormatId.edition}</span></li>
                      <br>
                      <li><p class="specificInfoTitle">Language:</p>   <span class="info">${detailsByBookAndFormatId.language}</span></li>
                      <br>
                      <li><p class="specificInfoTitle">Pages:</p>   <span class="info">${detailsByBookAndFormatId.pages}</span></li>
                      <br>
                      <li><p class="specificInfoTitle">ISBN10:</p>  <span class="info">${detailsByBookAndFormatId.isbn10}</span></li>
                      <br>
                      <li><p class="specificInfoTitle">ISBN13:</p>  <span class="info">${detailsByBookAndFormatId.isbn13}</span></li>
                </ul>
        <hr style="height: 1px; border-width: 0; color: #e0e0e0; background-color: #e0e0e0;"/>

    
        <c:choose>
          <c:when test="${book.authorList.toArray()[0].bookList[1] != null}">
            <div class="blockTitle">Also by the same author:
        
              <hr style="height: 1px; border-width: 0; color: #e0e0e0; background-color: #e0e0e0;"/>
    
            </div>
    
    
          <div class="otherBooksCarousel">
    
                  <c:forEach items="${book.authorList.toArray()[0].bookList}"  var="book" begin="1"><!--kakws exoume many to many ton author,g auto ton proseggizw me [0] -->
                    <div class="row">
                              <div class="col-2">
                                  <a  href="${pageContext.request.contextPath}/books/search/${book.bookid}"><img src="${book.bookdetailsList.toArray()[0].frontcover}"/></a>
                              </div>
                    </div>
                  </c:forEach>
                  
          </div>
          </c:when>

    
      </c:choose>       

       
            
            
    </section>
  
            
            
</div>
           
               



<script type="text/javascript">
    $(document).ready(function(){
      $('.otherBooksCarousel').slick({
        dots: true,
        infinite: true,
        slidesToShow: 3,
        slidesToScroll: 1,
        autoplay: true,
        autoplaySpeed: 5000,
      });
    });
</script>

</div>


</body>


   <!-- Footer -->
   <%@include file="footer.jspf"%>

</html>