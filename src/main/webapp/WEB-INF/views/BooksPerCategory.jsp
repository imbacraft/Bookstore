<%-- 
    Document   : newjsp
    Created on : Mar 30, 2021, 1:01:45 PM
    Author     : Σταθης Καράμπελας
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Document</title>
    

     <!-- bootstrap 4.0.0 -->
     <link
     rel="stylesheet"
     href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
     integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
     crossorigin="anonymous"
   />
     
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
        <ul class="navbar-nav ml-auto">
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
            <img src="./images/bookLogo1.jpg" alt="bookLogo" id="bookLogo" />
          </div>
          <div class="col-6 TitleText">
            <a href=""><span>Books are Treasure</span></a>
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
<<<<<<< HEAD
       <table border="1">
            <tr>
                <th>BookID</th>
                <th>Title</th>
                <th>BookType</th>
                <th>Category 1</th>
                <th>Price</th>
                <th>Publisher</th>
                <th>Publication Date</th>
                <th>Edition</th>
                <th>Pages</th>
                <th>Language</th>
                <th>Front Cover</th>
                <th>Back Cover</th>
                <th>Count</th>
                <th>ISBN-10</th>
                <th>ISBN-13</th>
                <th>Buy</th>
               
            </tr>   

            <c:forEach items="${booksPerCategory}" var="book"> 

                <c:forEach begin="0" end="${books.length}" var="counter">

                    <tr>

                        <td>${book.bookid}</td>
                        <td>${book.title}</td>
                        <td>${book.booktype.name}</td>
                        <td>${book.categoryList[pageContext.getAttribute("counter")].name}</td>
                        <td>${book.price}</td>
                        <td>${book.publisher}</td>
                        <td>${book.publicationdate}</td>
                        <td>${book.edition}</td>
                        <td>${book.pages}</td>
                        <td>${book.language}</td>
                        <td>${book.frontcover}</td>
                        <td>${book.backcover}</td>
                        <td>${book.count}</td>
                        <td>${book.isbn10}</td>
                        <td>${book.isbn13}</td>
                        <td>
                            <a href="${pageContext.request.contextPath}/cart/buy/${book.bookid}">Buy now</a>
                        </td>


                    </tr>
                </c:forEach>

            </c:forEach>


        </table>
 
        <a href="${pageContext.request.contextPath}/cart/index">Show cart</a>
        
    </body>
=======
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
<hr>
 <!-- Menu -->

    <section class="section" >
      
         <nav onchange="location=this.value">
      <header><b>Books</b></header>
     
      <c:forEach items="${categories}" var="category">
     <div>   <b><a href="${pageContext.request.contextPath}/books/${category.name}">${category.name}</a></b>

     </div> </c:forEach>
    </nav>
      
        
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
 
  <hr>

  <div id="path"><a href="">Home/</a><a href="">Books/</a><a href="">Medicine</a></div>

  <section id="booksPerCategory">
    <div class="container">
        <c:forEach items="${booksPerCategory}" var="book">  
                  <div class="row specific-row" >
        
        <div class="col-3"  >
            <img class="image" src="${book.frontcover}" alt="image"  onclick="location='${pageContext.request.contextPath}/books/search/${book.bookid}'" >
        </div>
        <div class="col-7 ">
         
          <h5 class="mainContent"><a href="${pageContext.request.contextPath}/books/search/${book.bookid}">${book.title}</a></h5>
          <c:forEach items="${authorPerBook.keySet().toArray()}"  var="i">
          <c:if test="${i==book.bookid}">
          <h5 ><a style="color:black;" href="${pageContext.request.contextPath}/authors/${authorPerBook[i].lastname}"> ${authorPerBook[i].firstname}${" "}${authorPerBook[i].lastname}  </a> </h5>
          </c:if>
        </c:forEach>
          
          <c:choose>
              <c:when test="${book.count>20}">
          <h3> <span id="inStock"> ✔️ In Stock </span><span class="despatched">  Usually despatched in 4 days</span>  </h3>
              </c:when>
              <c:when test="${book.count<5}">
              <h3> <span id="OutOfStock">${book.count}${" "} more available</span><span class="despatched"> Get it now  </span>  </h3>
              </c:when>
              <c:otherwise>
              <h3> <span id="RunningOut">${book.count}${" "} left</span><span class="despatched"> Get it now  </span>  </h3>
              </c:otherwise>    
          </c:choose>
              <c:forEach items="${bookBooktypes.keySet().toArray()}" var="i">
                  <c:if test="${i.bookid==book.bookid}">
                      <c:forEach items="${bookBooktypes[i]}" var="j">
                          <span>${j.name}</span>
                      </c:forEach>
                  </c:if>
          </c:forEach>
        </div>
        <div class="col-2">
          <div class="addToBasket">
            <h4 class="addToBasketPrice">${book.price}$</h4>
            <button class="addCartBtn" >Add To Cart </button>
          </div>
        </div>
      </div>
            <hr>
        </c:forEach>
    
      </div>
  </section>
  
   <style>
          #partWithLogo {
  /* background-color: cornsilk; */
  height: 200px;
  margin-left: 90px;
  margin-right: 90px;
}
.col-lg-3 {
  background-color: red;
}
#bookLogo {
  position: relative;
  border-radius: 50%;
  height: 180px;
  margin-left: 50px;
}

.TitleText {
  font-family: sans-serif;
  justify-content: center;
  width: inherit;
  margin-left: 4rem;
}
#searchText {
  position: relative;
  width: 300px;
  top: 50px;
  height: 30px;
  right: 30px;
}
#form {
  position: relative;
  top: 40px;
  right: 60px;
}

#searchSelect {
  position: relative;
  top: 50px;
  right: 4px;
  height: 30px;
  right: 36px;
  width: 120px;
}
#searchButton {
  top: 50px;
  right: 14px;
  background-color: yellow;
  color: #ffd04d;
  background-image: url(https://www.hive.co.uk//Content/StoreFront/assets/CSS/images/search.png);
  /* to xeraki */
  cursor: pointer;
  background-repeat: no-repeat;
  background-position: center center;
  background-size: 18px;
  border-style: solid;
  border-width: 1px;
  border-color: #ffd04d;
  border-radius: 0 3px 3px 0;
  display: flex;
  height: 30px;
  width: 30px;
  position: absolute;
}
.LoginRow {
  position: relative;
  top: 50px;
}

#LoginText {
  font-size: x-small;
}

#basketIcon {
  border-radius: 50%;
  background-color: yellow;
  color: #ffd04d;
  height: 40px;
  width: 40px;
}

#number {
  background-color: #ffd04d;
  color: #3a3a3a;
  padding-top: 3px;
  position: absolute;

  color: #fff;
  width: 20px;
  height: 20px;
  border-radius: 100%;
  padding-top: 1px;
  text-align: center;

  top: 0px;
  font-family: proxima-nova, arial, sans-serif;
}

/* inherit property, tha klhronomhsei to property tou section, tou parent element */
#freeHomeDelivery {
  height: inherit;
  width: 200px;
  /* me ton sunduasmo position absolute kai margin-right(right)=0, mou phgainei to element terma deksia */
  position: absolute;
  right: 70px;
  border: solid 1px grey;
  background-color: aquamarine;
}

#freeHomeDeliveryText {
  margin: 0;
  position: absolute;
  top: 50%;
  -ms-transform: translateY(-50%);
  transform: translateY(-50%);
}

@keyframes item-fade-in {
  0% {
    opacity: 0;
  }
  100% {
    flex: 1;
    opacity: 1;
  }
}

/* menu */
.section {
  margin-top: 0;
  margin-left: 90px;
  margin-right: 90px;
  height: 40px;
  position: relative;
  display: flex;
  flex-flow: row nowrap;
  align-items: center;
  justify-content: start;
  font-family: "Gill Sans", "Gill Sans MT", Calibri, "Trebuchet MS", sans-serif;
}

nav {
  /* to z-index fernei mprosta ta options, enw antitheta tha krubontousan apo pisw */
  z-index: 1;
  height: 40px;
  margin-left: 15px;
  background-color: cornsilk;
  border-radius: 10px;
  display: flex;
  /* menei opwsdhpote to flex-flow, an to bgalw ginontai orizontia */
  flex-flow: column nowrap;
  justify-content: stretch;
  transition: 120ms height linear, 120ms width linear,
    120ms background-color linear;
}

nav > header {
  display: flex;
  height: 30px;
  align-items: center;
  justify-content: start;
  transition: 180ms font-size linear;
  cursor: pointer;
}

nav > header > b {
  font-size: 2rem;
}

nav:hover {
  background-color: cornflowwhiteerblue;
  transition: 120ms background-color linear;
}

nav:hover > header {
  transition: 180ms font-size linear;
  font-size: 1.2em;
}

/* ousiastika auto krubei ta options, kai otan kaneis hover fainontai */
nav > div {
  height: 20px;
  opacity: 0;
  display: flex;
  justify-content: center;
  align-items: center;
  transition: 240ms background-color linear;
  font-size: 1.2em;
  cursor: pointer;
}

nav:hover > div {
  animation: 240ms item-fade-in linear forwards;
  animation-delay: 120ms;
  transition: 120ms background-color linear;
}

nav:nth-child(1):hover > div:hover,
nav:nth-child(2):hover > div:hover {
  background-color: blueviolet;
  transition: 120ms background-color linear;
}

nav:nth-child(2) > div {
  justify-content: center;
}

nav:nth-child(2) > div > header {
  display: flex;
  align-items: center;
  justify-content: center;
}
/* path */
#path {
  margin: 0 100px;
}

#booksPerCategory {
  margin: 0 20%;
  height: auto;
  
}

.specific-row {
  margin-left: 8%;
}

.image {
  height: 160px;
  width: 140px;
  margin: 10% 0 10% 13%;
}

.despatched {
  font-size: small;
  position:relative;
  margin-left: 10%;
}

.addToBasket {
  position: absolute;
  top: 24%;
  right: 20px;
}
.mainContent {
  margin-top: 5%;
}

.addToBasketPrice {
  text-align: center;
}

.addCartBtn {
  background: #3498db;
  background-image: -webkit-linear-gradient(top, #3498db, #2980b9);
  background-image: -moz-linear-gradient(top, #3498db, #2980b9);
  background-image: -ms-linear-gradient(top, #3498db, #2980b9);
  background-image: -o-linear-gradient(top, #3498db, #2980b9);
  background-image: linear-gradient(to bottom, #3498db, #2980b9);
  /* -webkit-border-radius: 28;
  -moz-border-radius: 28; */
  border-radius: 28px;
  font-family: Arial;
  color: #ffffff;
  font-size: 18px;
  /* padding: 10px 20px 10px 20px; */
  text-decoration: none;
}


@-webkit-keyframes blackWhite {  
  0% { background-color: white; }
  50% { background-color: white; }
  51% { background-color: grey; }
  100% { background-color: grey; }
}
#OutOfStock{
     border-radius:10%; 
    height: 100px;
    background-color: grey;
  -webkit-animation-name: blackWhite;
  /* -webkit-animation-name: blackWhiteFade; */
  -webkit-animation-iteration-count: infinite;  
  -webkit-animation-duration: 1s; 
}


      </style>
  
  
  
  </body>
>>>>>>> stathis-branch
</html>
