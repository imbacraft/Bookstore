<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  

<!DOCTYPE html>
<html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <title>Bookstore Home</title>

        <link rel="stylesheet" href="./css/footer.css" />
        <link rel="stylesheet" href="./css/body.css" />
        <link rel="stylesheet" href="./css/multipleItemsCarousel.css"/>

        <%-- Libraries --%>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css"/>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"/>
        
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

</head>


<body>

<div id="bodyContainer">

    <%@include file="header.jspf"%>

      
    <section>
        <!-- Carousel with 3 categories -->
        <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
          <ol class="carousel-indicators">
            <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
            <li data-target="#carouselExampleIndicators" data-slide-to="1" class=""></li>
            <li data-target="#carouselExampleIndicators" data-slide-to="2" class=""></li>
          </ol>
          <div class="carousel-inner">
            <div class="carousel-item active">
                <a href="${pageContext.request.contextPath}/books/Medicine">
              <img class="d-block w-100" src="./images/Batman-etc.jpg" alt="First slide">
                </a>
            </div>
            <div class="carousel-item">
                <a href="${pageContext.request.contextPath}/books/Comic">
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
    
    </section>
          
 
     
        
     <!-- book of the month -->
    <section id="bookOfTheMonth">

        <div id="bookMonthDiv">

          <div class="row">

              <div class="col-4"><a href="${pageContext.request.contextPath}/books/search/${bookOfTheMonth.bookid}">

              <img id="monthBookImage" src="${bookOfTheMonth.bookdetailsList.toArray()[0].frontcover}" alt="bookOfTheMonthImage">
                  </a>
              </div>

            <div class="col-7 bookMonthCol" >
                <h1>Book Of The Month</h1>  
              <h2>${bookOfTheMonth.title}</h2>
              <h3><a href="${pageContext.request.contextPath}/authors/${bookOfTheMonth.authorList.toArray()[0].lastname}">${bookOfTheMonth.authorList.toArray()[0].firstname} ${bookOfTheMonth.authorList.toArray()[0].lastname}</a>
              </h3>

              <p id="bookMonthColText"> 
                  ${bookOfTheMonth.description}
              </p>

              <div>
                  <a href="${pageContext.request.contextPath}/books/search/${bookOfTheMonth.bookid}">Find Out More >></a>
              </div>
            </div>
          </div>
        </div>
    </section>
        
     
     
     

         
    

    
    
    
    
    <!--author of the month-->
    <section id="authorOfTheMonth">

        <div id="authorMonthDiv">

            <div class="row">

                <div class="col-4">
                  <img  id="monthauthorImage" src="${authorOfTheMonth.portrait}" alt="aaa">
                </div>

        <section class="col-7 authorMonthCol">
         <h2><a href="${pageContext.request.contextPath}/authors/${authorOfTheMonth.lastname}">${authorOfTheMonth.firstname} ${authorOfTheMonth.lastname}</a></h2>
       <h6>  </h6>

       <p id="authorMonthColText">${authorOfTheMonth.biography}</p>
        <div class="container">
            <a href="${pageContext.request.contextPath}/authors/${authorOfTheMonth.lastname}">Find Out More about ${authorOfTheMonth.firstname} >></a>
            <div class="row" >
        
        <div class="col-md-12">
          <div class="carousel slide multi-item-carousel" id="theCarousel2">
            <div class="carousel-inner">
              <div class="item active">
                <div class="col-xs-4">
                  <a href="${pageContext.request.contextPath}/books/search/${authorOfTheMonth.bookList.toArray()[0].bookid}"
                    ><img
                      src="${authorOfTheMonth.bookList.toArray()[0].bookdetailsList.toArray()[0].frontcover}"
                      class="img-responsive"
                  /></a>
                </div>
              </div><!--εδώ κλείνει το item active  -->  
             <c:forEach items="${authorOfTheMonth.bookList}" var="book" begin="1" end="${authorOfTheMonth.bookList.size()-1}">
                 <div class="item">
                      <div class="col-xs-4">
                          <a href="${pageContext.request.contextPath}/books/search/${book.bookid}">
                              <img src="${book.bookdetailsList.toArray()[0].frontcover}" class="img-responsive"/>
                          </a>
                      </div>
                 </div>
             </c:forEach>
              
            </div>
            <a
              class="left carousel-control"
              href="#theCarousel2"
              data-slide="prev"
              ><i class="glyphicon glyphicon-chevron-left"></i
            ></a>
            <a
              class="right carousel-control"
              href="#theCarousel2"
              data-slide="next"
              ><i class="glyphicon glyphicon-chevron-right"></i
            ></a>
          </div>
        </div>
      
          </div>
      </div>
    </section>
     
      

  

    <%@include file="footer.jspf" %>
 

    <script src="./javascript/javascript1.js"></script>
      <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.2.2/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
          
          <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script> 
          <link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/themes/smoothness/jquery-ui.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>

            <script>
        let loginModal = document.getElementById("login-modal");
        function toggleModal()
        {
            if (loginModal.style.display !== "inline-block") loginModal.style.display = "inline-block";
            else loginModal.style.display = "none";
        } 
    </script>  



  <%-- bodyContainer closing tag --%>
</div>

    </body>

</html>
