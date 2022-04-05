<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  

<!DOCTYPE html>
<html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <title>Bookaporta Home</title>

        <link rel="stylesheet" href="./css/footer.css" />
        <link rel="stylesheet" href="./css/body.css" />
       

</head>


<body>

<div id="bodyContainer">

      <!-- Header -->
      <%@include file="header.jspf"%>

      
        <!-- Carousel with 3 example books -->
        <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
          <ol class="carousel-indicators">
            <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
            <li data-target="#carouselExampleIndicators" data-slide-to="1" class=""></li>
            <li data-target="#carouselExampleIndicators" data-slide-to="2" class=""></li>
          </ol>
          <div class="carousel-inner">
            <!-- TODO: Define logic to pick category images. Right now its arbitrary -->
              <div class="carousel-item active">
                <a href="${pageContext.request.contextPath}/books/Comic">
                    <img class="d-block w-100" src="./images/Batman-etc.jpg" alt="First slide">
                </a>
              </div>
              <div class="carousel-item">
                <a href="${pageContext.request.contextPath}/books/Psychology">
                <img class="d-block w-100" src="./images/MentalHealth.jpg" alt="Second slide">
                </a>
              </div>
              <div class="carousel-item">
                <a href="${pageContext.request.contextPath}/books/Sports&Outdoors">
                <img class="d-block w-100" src="./images/SportsAndOutdoor.jpg" alt="Third slide">
              </a>
              </div>
          </div>
          <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="sr-only">Previous</span>
          </a>
          <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="sr-only">Next</span>
          </a>
        </div> 
    
          
     <!-- book of the month -->
    <section id="bookOfTheMonth">

        <hr style="height: 1px; border-width: 0; color: #e0e0e0; background-color: #e0e0e0;"/>
        <h1>Book Of The Month</h1>  
        <hr style="height: 1px; border-width: 0; color: #e0e0e0; background-color: #e0e0e0;"/>

        <div id="bookOfTheMonthContainer">


                <a href="${pageContext.request.contextPath}/books/search/${bookOfTheMonth.bookid}">
                    <img id="bookOfTheMonthImage" src="${bookOfTheMonth.bookdetailsList.toArray()[0].frontcover}" alt="bookOfTheMonthImage">
                </a>


              <div id="bookOfTheMonthDetails">
                <a href="${pageContext.request.contextPath}/books/search/${bookOfTheMonth.bookid}"><h2>${bookOfTheMonth.title}</h2></a>
                <h3><a href="${pageContext.request.contextPath}/authors/${bookOfTheMonth.authorList.toArray()[0].lastname}">${bookOfTheMonth.authorList.toArray()[0].firstname} ${bookOfTheMonth.authorList.toArray()[0].lastname}</a></h3>
                <p id="bookMonthColText"> 
                    ${bookOfTheMonth.description}
                </p>
                
                <a href="${pageContext.request.contextPath}/books/search/${bookOfTheMonth.bookid}">Find Out More >></a>
              </div>
        
        </div>
    </section>
        
     
     
     

         
    

    
    
    
    
    <!--author of the month-->
    <section id="authorOfTheMonth">

        <hr style="height: 1px; border-width: 0; color: #e0e0e0; background-color: #e0e0e0;"/>
        <h1 id="authorOfTheMonthTitle">Author of the Month</h1>
        <hr style="height: 1px; border-width: 0; color: #e0e0e0; background-color: #e0e0e0;"/>
      
        <div id="authorMonthContainer">

          <a href="${pageContext.request.contextPath}/authors/${authorOfTheMonth.lastname}"><img  id="authorOfTheMonthImage" src="${authorOfTheMonth.portrait}" alt="authorOfTheMonth"></a>

          <div id="authorOfTheMonthNameAndBio">
              <h2><a href="${pageContext.request.contextPath}/authors/${authorOfTheMonth.lastname}">${authorOfTheMonth.firstname} ${authorOfTheMonth.lastname}</a></h2>
              <p id="authorMonthColText">${authorOfTheMonth.biography}</p>
              <a id="authorOfTheMonthFindMore" href="${pageContext.request.contextPath}/authors/${authorOfTheMonth.lastname}">Explore books from ${authorOfTheMonth.firstname} >></a>
          </div>

        </div>
           
        
        <hr style="height: 1px; border-width: 0; color: #e0e0e0; background-color: #e0e0e0;"/>
        <h1 id="authorOfTheMonthTitle">Books from ${authorOfTheMonth.firstname} ${authorOfTheMonth.lastname}</h1>
        <hr style="height: 1px; border-width: 0; color: #e0e0e0; background-color: #e0e0e0;"/>

       
        <div class="bookCarousel">
          <div>
            <a href="${pageContext.request.contextPath}/books/search/${authorOfTheMonth.bookList.toArray()[0].bookid}"
                    ><img
                      src="${authorOfTheMonth.bookList.toArray()[0].bookdetailsList.toArray()[0].frontcover}"
                      class="img-responsive"
                  /></a>
          </div>
          <c:forEach items="${authorOfTheMonth.bookList}" var="book" begin="1" end="${authorOfTheMonth.bookList.size()-1}">
                <div>
                          <a href="${pageContext.request.contextPath}/books/search/${book.bookid}">
                              <img src="${book.bookdetailsList.toArray()[0].frontcover}" class="img-responsive"/>
                          </a>
                </div>
            </c:forEach>
            
        </div>
       
        
    
    </section>
     
      


</div>



  <script type="text/javascript">
    $(document).ready(function(){
      $('.bookCarousel').slick({
        dots: true,
        infinite: true,
        slidesToShow: 3,
        slidesToScroll: 1,
        autoplay: true,
        autoplaySpeed: 5000,
      });
    });
  </script>

</body>

 
<!-- Footer -->
<%@include file="footer.jspf" %>

</html>
