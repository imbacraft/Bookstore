<%-- 
    Document   : home
    Created on : Feb 18, 2021, 8:46:36 PM
    Author     : user
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Bookstore Home</title>
        <link rel="stylesheet" href="./css/styles.css" />
        <link rel="stylesheet" href="./css/styles2.css" />
        <link rel="stylesheet" href="./css/multipleItemsCarousel.css"/>
        <link
      rel="stylesheet"
      href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
      integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
      crossorigin="anonymous"
    />
        
         <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
      <!-- Latest compiled and minified CSS -->
      <link
        rel="stylesheet"
        href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
        integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
        crossorigin="anonymous"
      />

      <!-- Optional theme -->
      <link
        rel="stylesheet"
        href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css"
        integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp"
        crossorigin="anonymous"
      />

      <!-- Latest compiled and minified JavaScript -->
      <script
        src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"
        integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
        crossorigin="anonymous"
      ></script>

        
         <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
 
        
   
    </head>
    <body>
        
   
    <nav class="navbar navbar-expand-lg navbar-dark bg-info">
      <!-- bazw brand an thelw -->
      <span id="topSpan">
        <a class="navbar-brand" href="">Supporting your high street</a>
        <a class="navbar-brand" href="http://www.google.com" target="_blank"
          >Find out how</a
        >
      </span>

      <button
        class="navbar-toggler"
        type="button"
        data-toggle="collapse"
        data-target="#navbarTogglerDemo02"
        aria-controls="navbarTogglerDemo02"
        aria-expanded="false"
        aria-label="Toggle navigation"
      >
        <span class="navbar-toggler-icon"></span>
      </button>

      <div class="collapse navbar-collapse" id="navbarTogglerDemo02">
        <!-- an thelw to menu st aristera arkei na metaferw to ul
      opote prosthetw mia klash=ml-auto -->
        <!-- toggler, an thelw na mikrainei h othoni kai na sumparasurei to menu -->
        <ul class="navbar-nav navbar-right">
          <li class="nav-item">
            <a class="nav-link" href="">Welcome,user</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="">Account</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="">Reviews</a>
          </li>
          <li class="nav-item">
            <a href="" class="nav-link">Συχνές ερωτήσεις</a>
          </li>
          <li class="nav-item">
            <a href="" class="nav-link">Contact</a>
          </li>
        </ul>
      </div>
    </nav>

    <!-- Logo-Login-Basket -->
    <section id="partWithLogo">
 <div class="row">
        <!-- 3 sthles/row sto megalo viewport, 2 sto mikrotero, kai 1 otan mikrunei teleiws -->
        <div class="col-lg-4 col-md-6">
          <!-- bazw sto 1/3 ths sthlhs 2 boxes->ara div, ara to ena katw ap to allo
          titlos +logia -->
          <div class="col-6">
            <img src="" alt="bookLogo" id="bookLogo" />
          </div>
          <div class="col-6 TitleText">
            <a href="">BOOKS ARE TREASURE</a>
          </div>
        </div>
        <div class="col-lg-4 col-md-6">
          <form action="" id="form">
            <input type="text" placeholder="Search..." id="searchText" />
            <select id="searchSelect">
              <option value="1">Medicine</option>
              <option value="2">Sports</option>
            </select>
            <input type="button" value="" id="searchButton" />
          </form>
        </div>
        <div class="col-lg-4 col-md-6">
          <div class="row LoginRow">
            <div class="col-lg-6 Login">
              <div class="col-6">
                <h6 id="LoginText">Click Here to Login</h6>
              </div>
              <div class="col-6">
                <a href="http://www.google.com">Login</a>
              </div>
              <div class="col-6">
                <hr id="hr" />
              </div>
            </div>
            <div class="col-lg-6">
              <img
                src="./images/shoppingIcon.png"
                alt="basket"
                id="basketIcon"
              />
              <span id="number">0</span>
              <div class="col-6">
                <a href="">Basket</a>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
    
    <section class="section">

    
        <nav onchange="location=this.value">
      <header><b>Books</b></header>
     
      <c:forEach items="${categories}" var="category">
     <div>   <b><a href="${pageContext.request.contextPath}/books/${category.name}">${category.name}</a></b>

     </div> </c:forEach>
    </nav>
      
        <a href="${pageContext.request.contextPath}/cart/index">Cart</a>
        ${sessionScope.cart.size()}
        
        <br>
        

        <button>Books</button>
        
=======
         <nav onchange="location=this.value">
      <header><b>Authors</b></header>
      <c:forEach items="${authors}" var="author">
      <div>
        <b><a href="${pageContext.request.contextPath}/authors/${author.lastname}">${author.lastname}</a></b>
      </div>
      </c:forEach>
      
    </nav>

       
          <nav onchange="location=this.value">
      <header><b>Bestsellers</b></header>
      <c:forEach items="${bestSellers}" var="book">
      <div>
        <b><a href="${pageContext.request.contextPath}/books/search/${book.bookid}">${book.title}</a></b>
     </div>
       </c:forEach>
          </nav>
         
        </section>
    
    
    
    <!-- Carousel with 3 categories -->
    <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
      <ol class="carousel-indicators">
        <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
        <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
        <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
      </ol>
      <div class="carousel-inner">
        <div class="carousel-item active">
          <img class="d-block w-100" src="./images/Batman-etc.jpg" alt="First slide">
        </div>
        <div class="carousel-item">
          <img class="d-block w-100" src="./images/MentalHealth.jpg" alt="Second slide">
        </div>
        <div class="carousel-item">
          <img class="d-block w-100" src="./images/SportsAndOutdoor.jpg" alt="Third slide">
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
    <hr>
    
     <!-- book of the month -->
 <section id="bookOfTheMonth">
   <div id="bookMonthDiv">
    <div class="row">
      <div class="col-4">
        <img id="monthBookImage" src="${bookOfMonth.frontcover}" alt="aaa">
      </div>
      <div class="col-7 bookMonthCol">
        <h2>book of the month</h2>
        <h6>${bookOfMonth.title}</h6>

        <p id="bookMonthColText"> ${bookOfMonth.description}
        </p>

        <div>
            <a href="${pageContext.request.contextPath}/books/search/${bookOfMonth.bookid}">Find Out More>></a>
        </div>
      </div>
    </div>
   </div>
     </section>
     
     
     <!-- Readers choice New and Upcoming -->
<section id="ReadersChoice">
  <div class="row">
    <div class="col-4">
      <hr>
    </div>
    <div class="col-4">
      <span>Reader's choice:New and Upcoming</span><span id="verticalLine"></span> <a href="" >See all</a>
    </div>
    <div class="col-4">
      <hr>
    </div>
  </div>

</section>
     
     
     
     <!-- new books and upcoming -->
     <section id="upcomingBooks">
  <div class="container">
    <div class="row">
      <div class="col-md-12">
        <div class="carousel slide multi-item-carousel" id="theCarousel">
          <div class="carousel-inner">
            <div class="item active">
              <div class="col-xs-4">
                <a href="#1"
                  ><img
                    src="./images/MentalHealth.jpg"
                    class="img-responsive"
                /></a>
              </div>
            </div>
            <div class="item">
              <div class="col-xs-4">
                <a href="#1"
                  ><img
                    src="./images/NewBooks.jpg"
                    class="img-responsive"
                /></a>
              </div>
            </div>
            <div class="item">
              <div class="col-xs-4">
                <a href="#1"
                  ><img
                    src="./images/SportsAndOutdoor.jpg"
                    class="img-responsive"
                /></a>
              </div>
            </div>
            <div class="item">
              <div class="col-xs-4">
                <a href="#1"
                  ><img
                    src="http://placehold.it/300/673ab7/000000"
                    class="img-responsive"
                /></a>
              </div>
            </div>
            <div class="item">
              <div class="col-xs-4">
                <a href="#1"
                  ><img
                    src="http://placehold.it/300/4caf50/000000"
                    class="img-responsive"
                /></a>
              </div>
            </div>
            <div class="item">
              <div class="col-xs-4">
                <a href="#1"
                  ><img
                    src="http://placehold.it/300/8bc34a/000000"
                    class="img-responsive"
                /></a>
              </div>
            </div>
            <!-- add  more items here -->
            <!-- Example item start:  -->

            <div class="item">
              <div class="col-xs-4">
                <a href="#1"
                  ><img
                    src="http://placehold.it/300/8bc34a/000000"
                    class="img-responsive"
                /></a>
              </div>
            </div>

            <!--  Example item end -->
          </div>
          <a
            class="left carousel-control"
            href="#theCarousel"
            data-slide="prev"
            ><i class="glyphicon glyphicon-chevron-left"></i
          ></a>
          <a
            class="right carousel-control"
            href="#theCarousel"
            data-slide="next"
            ><i class="glyphicon glyphicon-chevron-right"></i
          ></a>
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
       <img id="monthauthorImage" src="./images/bookLogo.png" alt="aaa">
     </div>
     <div class="col-7 authorMonthCol">
       <h2>author of the month</h2>
       <h6>${monthAuthorMap.keySet().toArray()[0].firstname}${" "} ${monthAuthorMap.keySet().toArray()[0].lastname}</h6>

       <p id="authorMonthColText">Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.
         It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).
       </p>
        <div>
            <a href="${pageContext.request.contextPath}/authors/${monthAuthorMap.keySet().toArray()[0].lastname}">Find Out More about ${monthAuthorMap.keySet().toArray()[0].firstname}>></a>
        </div>
     
      

<c:forEach items="${monthAuthorMap}" var="entry">
    <c:forEach items="${entry.value}" var="bookElement">
        <img class="monthAuthorBooksImages" src="${bookElement.frontcover}">
    </c:forEach>
    
</c:forEach>
       
     </div>
   </div>
  </div>
  

</section>

    
    
    
    
    
    
 
 
           <footer>
      <div id="footer">
          <div style="text-align: center;" id="whoWeAre" class="footerBlock">
              <p   >Who we are</p>
          </div>
          <div id="helpfulLinks" class="footerBlock">
              <span style="text-align: center;">Helpful links</span>
              <ul>
                  <li href="#">Sign in / Register</li>
                  <li href="#">My Account</li>
                  <li href="#">Contact us</li>
                  <li href="#">FAQs</li>
                  <li href="#">Log out</li>
              </ul>
          </div>
          <div id="socialLinks" class="footerBlock">
              <ul         style="float: left;
              left: 17%;">
                  <li><img src="f_logo_RGB-Blue_128.png" width="24" height="24" alt="Facebook logo"/><span style="margin-bottom:  150px">Facebook</span></li>
                  
                  <li><img src="2021 Twitter logo - blue-128.png" width="24" height="24" alt="Twitter logo"/>Twitter</li>
                  
                  <li><img src="pinterest-logo-128.png" alt="Pinterest logo" width="24" height="24"/>Pinterest</li>
                  <li><img src="yt_logo_rgb_light-128.png" alt="YouTube logo"  height="16"/></li>
                  
                  
              </ul>
          </div>
               
          
      </div>
                  
      </footer>
 
      
        <script src="./javascript/javascript1.js"></script>
 
    
      
       
      
    
        
    
        <sec:authorize access="!isAuthenticated()">

            <!-- if user is not authenticated, show this link. Otherwise, it stays hidden.--> 
            <a href="${pageContext.request.contextPath}/login">Login with your customer acccount</a>

            <br>
            
            Don't have an account? <a class="underlineHover" href="${pageContext.request.contextPath}/register"> Register</a>

        </sec:authorize>


        <h3>Bestseller books</h3>



        <sec:authorize access="hasRole('ADMIN')">
            <div>
                <a href="${pageContext.request.contextPath}/admin">Administrator Management Page</a>
            </div>

            <p>
                User: <sec:authentication property="principal.username"/>
                <br/>
                Role(s):<sec:authentication property="principal.authorities"/>
            </p>

            <form:form action="${pageContext.request.contextPath}/logout" method="POST">
                <input type="submit" value="Logout">
            </form:form>

        </sec:authorize>

        <br/>

        <sec:authorize access="hasRole('CUSTOMER')">

            <div>
                <h3>Welcome, <sec:authentication property="principal.username" /> !</h3>
            </div>

            <div>
                <a href="${pageContext.request.contextPath}/customer">Account Details</a>
            </div>

            <br>

            <form:form action="${pageContext.request.contextPath}/logout" method="POST">
                <input type="submit" value="Logout">
            </form:form>

        </sec:authorize>



        <sec:authorize access="hasRole('SERVICEAGENT')">
            <div>
                <a href="${pageContext.request.contextPath}/service">Go to Customer Service Agent Management Page</a>
            </div>

            <form:form action="${pageContext.request.contextPath}/logout" method="POST">
                <input type="submit" value="Logout">
            </form:form>

        </sec:authorize>


        <sec:authorize access="hasRole('STOCKMANAGER')">
            <div>
                <a href="${pageContext.request.contextPath}/stock">Go to Stock Management Page</a>
            </div>
            
            <p>
                User: <sec:authentication property="principal.username"/>
                <br/>
                Role(s):<sec:authentication property="principal.authorities"/>
            </p>

            <form:form action="${pageContext.request.contextPath}/logout" method="POST">
                <input type="submit" value="Logout">
            </form:form>

        </sec:authorize>


                
         <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>


    </body>



</html>
