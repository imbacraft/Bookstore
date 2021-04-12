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
        
           
        <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css"
    />
    <link
      rel="stylesheet"
      href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
    />
        

        
         <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
 
        
   
    </head>
    <body>
        
        
   
       
          
        
 <section id="partWithLogo">
 <div class="row">
        <!-- 3 sthles/row sto megalo viewport, 2 sto mikrotero, kai 1 otan mikrunei teleiws -->
        <div class="col-lg-4">
          <!-- bazw sto 1/3 ths sthlhs 2 boxes->ara div, ara to ena katw ap to allo
          titlos +logia -->
          
            <img src="bookaporta-logo.png" alt="bookLogo" id="bookLogo" />
        
        </div>
        <div class="col-lg-1"></div>
        <div class="col-lg-3">
          <form action="" id="form">
               
            <input type="text" placeholder="Search..." id="searchText" />
            <input type="button" value="" id="searchButton" />
          </form>
            <div id="suggestions" hidden="false">${suggestions} aaaa</div>
        </div>
        <div class="col-lg-2">
      
            <div id="Myaccount"><sec:authorize access="!isAuthenticated()">
                <!-- if user is not authenticated, show this link. Otherwise, it stays hidden.--> 

                <h3><a class="nav-link" href="${pageContext.request.contextPath}/login">Account</a></h3>
            </sec:authorize> 
            <sec:authorize access="hasRole('ADMIN')">
                 <p>Welcome, <sec:authentication property="principal.username"/>!</p>
                <input type="button"  onclick="toggleModal()" id="account-checkbox" value="Μy Account"/>       
            </sec:authorize>
            <sec:authorize access="hasRole('CUSTOMER')">
                <p>Welcome, <sec:authentication property="principal.username" />!</p>
                <input type="button"  onclick="toggleModal()" id="account-checkbox" value="Μy Account"/>
            </sec:authorize>
            <sec:authorize access="hasRole('SERVICEAGENT')">
                <p>Welcome, <sec:authentication property="principal.username" />!</p>
                <input type="button"  onclick="toggleModal()" id="account-checkbox" value="Μy Account"/>            
            </sec:authorize>   
            <sec:authorize access="hasRole('STOCKMANAGER')">   
                <p>Welcome, <sec:authentication property="principal.username" />!</p>
                <input type="button"  onclick="toggleModal()" id="account-checkbox" value="Μy Account"/>
            </sec:authorize>    </div>
            
            
        </div>
        <div class="col-lg-2">
            <div id="cart" style="margin-top:40%;">
             <% int cartAmount = 0; %>
              <c:forEach var="cartitem" items="${sessionScope.cart}">
                  
                       <c:set var="item" value="${cartitem.quantity}"></c:set>

                <% cartAmount = cartAmount + (int) pageContext.getAttribute("item");  %>
                  
              </c:forEach>
              
             <div id="number"><%=cartAmount%></div>
             <div class="clickable">
            <a id="cart-img" href="${pageContext.request.contextPath}/cart/index">
                <img  id="basketIcon" src="https://peoplecertproject.s3.eu-central-1.amazonaws.com/UI/basket.optimized.svg" alt="basketIcon">
            </a>
            </div> 
        </div> 
        </div>
            
             
            
          
        </div>
                
      

        <!--autes einai oi epiloges pou tha exei o user/admin klp otan kanei login ,sxetika me to profile tou-->
    
        <div id="login-modal" style="background-color:white;   width:200px; margin-left:65%; ">
            <div >
                <ul id="my-account-menu"   >
                    <sec:authorize access="hasRole('ADMIN')">
                        <li>
                            Role(s):<sec:authentication property="principal.authorities"/>
                        </li>
                        <li>
                            <a href="${pageContext.request.contextPath}/admin">Administrator Management Page</a>
                        </li>
                        <li>
                            <form:form action="${pageContext.request.contextPath}/logout" method="POST">
                                <input type="submit" value="Logout">
                            </form:form>
                        </li>
                    </sec:authorize>
                    <sec:authorize access="hasRole('CUSTOMER')">
                        <li>
                            <a href="${pageContext.request.contextPath}/customer">Account Details</a>
                        </li>
                        <li>
                            <form:form action="${pageContext.request.contextPath}/logout" method="POST">
                                <input type="submit" value="Logout">
                            </form:form>
                        </li>
                    </sec:authorize>
                    <sec:authorize access="hasRole('SERVICEAGENT')">
                        <li>
                            <a href="${pageContext.request.contextPath}/service">Go to Customer Service Agent Management Page</a>        
                        </li>
                        <li>
                            <form:form action="${pageContext.request.contextPath}/logout" method="POST">
                                <input type="submit" value="Logout">
                            </form:form>
                        </li>
                    </sec:authorize>
                    <sec:authorize access="hasRole('STOCKMANAGER')">
                        <li>
                            Role(s):<sec:authentication property="principal.authorities"/>
                        </li>
                        <li>
                            <a href="${pageContext.request.contextPath}/stock">Go to Stock Management Page</a>
                        </li>
                        <li>
                            <form:form action="${pageContext.request.contextPath}/logout" method="POST">
                                <input type="submit" value="Logout">
                            </form:form>                            
                        </li>
                    </sec:authorize>
                </ul>
            </div>
        </div> 
        </section>
               
 
                 <hr>
                
                <!--edw teleiwnei to basiko header -->


  <!--edw ksekinaei to menu -->
  
    
    <section class="section">
        <div class="container" >
  <div class="row" >
      
    <div class="col-3" >
        <div class="dropdown">
    
  <a class="dropbtn" style="color:black;  font-size: 1.5em">BOOKS</a>
  <div class="dropdown-content">
    
         <div class="row ">
            
             <div class="col-6">
          <c:forEach items="${categories}" var="category" begin="0" end="4" ><!--edw mpainei karfwto -->
            <a href="${pageContext.request.contextPath}/books/${category.name}">${category.name}</a>
          </c:forEach>  
             </div>
      <div class="col-6">
           <c:forEach items="${categories}" var="category" begin="5" end="9" ><!--edw mpainei karfwto -->
               <a href="${pageContext.request.contextPath}/books/${category.name}">${category.name}</a>
          </c:forEach>
      </div> 
         </div><!--edw kleinei to endiameso row -->
  </div>
        </div>
        
        
    </div>
    <div class="col-3">
       <div class="dropdown">
    
   <a class="dropbtn" style="color:black; font-size: 1.5em">AUTHORS</a>
  <div class="dropdown-content">
    
         <div class="row ">
            
             <div class="col-4">
          <c:forEach items="${authors}" var="author" begin="0" end="6" ><!--edw mpainei karfwto -->
            <a href="${pageContext.request.contextPath}/authors/${author.lastname}">${author.lastname}</a>
          </c:forEach>  
             </div>
      <div class="col-4">
           <c:forEach items="${authors}" var="author" begin="7" end="13" ><!--edw mpainei karfwto -->
               <a href="${pageContext.request.contextPath}/authors/${author.lastname}">${author.lastname}</a>
          </c:forEach>
      </div> 
          <div class="col-4">
           <c:forEach items="${authors}" var="author" begin="14" end="20" ><!--edw mpainei karfwto -->
               <a href="${pageContext.request.contextPath}/authors/${author.lastname}">${author.lastname}</a>
          </c:forEach>
      </div> 
         </div><!--edw kleinei to endiameso row -->
  </div>
        </div>
    </div>
    <div class="col-1">
        <a class="dropbtn" style="color:black; font-size: 1.5em" href="${pageContext.request.contextPath}/bestsellers">BESTSELLERS</a>
    </div>
      <div class="col-2"></div>
      <div class="col-3" id="freeHomeDelivery">
          <h5 id="freeHomeDeliveryText">JEFF BEZOS ΓΑΤΑΚΙ,ΕΡΧΟΜΑΣΤΕ</h5>
      </div>
  </div>
</div>

    
         
        </section>
    
    
    
    <section style="margin-top:20px;" >
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
          <img class="d-block w-100" src="./images/Batman-etc.jpg" style="height:550px;" alt="First slide">
            </a>
        </div>
        <div class="carousel-item">
            <a href="${pageContext.request.contextPath}/books/Comic">
          <img class="d-block w-100" src="./images/MentalHealth.jpg" style="height:550px;" alt="Second slide">
          </a>
        </div>
          <div class="carousel-item">
              <a href="${pageContext.request.contextPath}/books/Sports&Outdoors">
          <img class="d-block w-100" src="./images/SportsAndOutdoor.jpg" style="height:550px;" alt="Third slide">
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
          
             <!-- Readers choice New and Upcoming -->
<section id="ReadersChoice">
  <div class="row">
    <div class="col-4">
      <hr style="border: 1px solid grey">
    </div>
    <div class="col-4 UpcomingText">
     <span style="font-size:1.2em;">Reader's choice: New and Upcoming</span><span id="verticalLine"></span> <a href="">See all</a>
    </div>
    <div class="col-4">
      <hr style="border: 1px solid grey">
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
                      src="${upcomingBooks.toArray()[0].bookdetailsList.toArray()[0].frontcover}"
                      class="img-responsive1"
                  /></a>
                </div>
              </div><!--εδώ κλείνει το item active  -->  
             <c:forEach items="${upcomingBooks}" var="book" begin="1" end="${upcomingBooks.size()-1}">
                 <div class="item">
                 <div class="col-xs-4">
                     <a href="#1">
                         <img src="${book.bookdetailsList.toArray()[0].frontcover}" class="img-responsive1"/>
                     </a>
                 </div>
                 </div>
             </c:forEach>
              
            </div>
            <a
              class="left carousel-control"
              href="#theCarousel"
              data-slide="prev"
              ><i class="glyphicon glyphicon-chevron-left"></i
            ></a>
            <a
              class="right carousel-control" style="margin-right:30px;"
              href="#theCarousel"
              data-slide="next"
              ><i class="glyphicon glyphicon-chevron-right"></i
            ></a>
          </div>
        </div>
      </div>
    </div>
                      
  </section>
                      
          
          
  
    
     <!-- book of the month -->
     <section style="background-color:lightblue;">
 <section id="bookOfTheMonth" style="margin-top:20px;">
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

        <p id="bookMonthColText" style="text-align:left; line-height:32px; letter-spacing: -1px; "> 
            ${bookOfTheMonth.description}
        </p>

        <div>
            <a href="${pageContext.request.contextPath}/books/search/${bookOfTheMonth.bookid}">Find Out More >></a>
        </div>
      </div>
    </div>
   </div>
     </section>
        
    </section>
     
     
     

         
    

    
    
    
    
  <!--author of the month-->
   <section id="authorOfTheMonth">
  <div id="authorMonthDiv">
   <div class="row">
     <div class="col-4">
       <img  id="monthauthorImage" src="${authorOfTheMonth.portrait}" alt="aaa">
     </div>
     <div class="col-7 authorMonthCol">
         <h2><a href="${pageContext.request.contextPath}/authors/${authorOfTheMonth.lastname}">${authorOfTheMonth.firstname} ${authorOfTheMonth.lastname}</a></h2>
       <h6>  </h6>

       <p id="authorMonthColText" style="text-align:left; line-height:32px; letter-spacing: -1px; ">${authorOfTheMonth.biography}</p>
        <div>
            <a href="${pageContext.request.contextPath}/authors/${authorOfTheMonth.lastname}">Find Out More about ${authorOfTheMonth.firstname} >></a>
        </div>
        <div class="container" >
      <div class="row" >
        <div class="col-md-12">
          <div class="carousel slide multi-item-carousel" id="theCarousel2" style="width:500px;">
            <div class="carousel-inner" style="margin-left: 13px; ">
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
              class="left carousel-control" style="margin-left:23px;"
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

    </body>



</html>
