<%-- 
    Document   : newjsp
    Created on : Mar 30, 2021, 1:01:45 PM
    Author     : Σταθης Καράμπελας
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

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
    <section id="partWithLogo">
 <div class="row">
        <!-- 3 sthles/row sto megalo viewport, 2 sto mikrotero, kai 1 otan mikrunei teleiws -->
        <div class="col-lg-4">
          <!-- bazw sto 1/3 ths sthlhs 2 boxes->ara div, ara to ena katw ap to allo
          titlos +logia -->
          <a href="${pageContext.request.contextPath}">
            <img src="https://peoplecertproject.s3.eu-central-1.amazonaws.com/UI/bookaporta-logo.png" alt="bookLogo" id="bookLogo" />
        </a>
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
 <section id="booksPerCategory">
    <div class="container">
        <c:forEach items="${booksPerCategory}" var="book">
      <div class="row specific-row">
        
        
        <div class="col-3">
            <img class="image" src="${book.bookdetailsList.toArray()[0].frontcover}" alt="bookImage" ><!--to frontcover tha nai se kathe biblio to idio, opote pairnw to [0] -->
        </div>
        <div class="col-5">
 
          <h5 class="mainContent"><a href="${pageContext.request.contextPath}/books/search/${book.bookid}">${book.title}</a></h5>
          <c:forEach items="${book.authorList}" var="author">
          <h5> by <a href="${pageContext.request.contextPath}/authors/${author.lastname}"> ${author.firstname}${" "}${author.lastname}</a></h5>
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
            <h6> ✔ In Stock - Usually despatched within 48 hours  </h6>
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
          </c:forEach>
            
       
    </div>

  </section>
  
         <footer>
      <div id="footer">
          <div style="text-align: center;" id="whoWeAre" class="footerBlock">
              <p>Who we are</p>
          </div>
          <div id="helpfulLinks" class="footerBlock">
              <span style="text-align: center;">Helpful links</span>
              <ul>
                  <li><a href="${pageContext.request.contextPath}/login">Sign in / Register</a></li>
                  <li href="#">My Account</li>
                  <li href="#">Contact us</li>
                  <li href="#">FAQs</li>
                  <li href="#">Log out</li>
              </ul>
          </div>
          <div id="socialLinks" class="footerBlock">
              <ul         style="float: left;
              left: 17%;">
                  <li>
                      <a href="http://www.facebook.com"><img src="https://peoplecertproject.s3.eu-central-1.amazonaws.com/UI/f_logo_RGB-Blue_128.png" width="24" height="24" alt="Facebook logo"/><span style="margin-bottom:  150px">Facebook</span></a></li>
                  
                  <li><a href="http://www.twitter.com">
                          <img src="https://peoplecertproject.s3.eu-central-1.amazonaws.com/UI/2021+Twitter+logo+-+blue-128.png" width="24" height="24" alt="Twitter logo"/>Twitter</a></li>
                  
                          <li><a href="http://www.pinterest.com">
                                  <img src="https://peoplecertproject.s3.eu-central-1.amazonaws.com/UI/pinterest-logo-128.png" alt="Pinterest logo" width="24" height="24"/>Pinterest</a></li>
                                  <li><a href="http://www.youtube.coms">
                                          <img src="https://peoplecertproject.s3.eu-central-1.amazonaws.com/UI/yt_logo_rgb_light-128.png" alt="YouTube logo"  height="16"/></a></li>
                  
                  
              </ul>
          </div>
               
          
      </div>
                  
      </footer>
  
  
      
      
  
   <style>
  #partWithLogo {
  /* background-color: cornsilk; */
  height: auto;
  margin-top:1%;
  margin-left: 13%;
  margin-right: 13%;
}

#bookLogo{
    height:110px;
    width:320px;
}



#searchText {
  position: relative;
  width: 290px;
  top: 25px;
  height: 40px;
  right: 50px;
}


#form {
  position: relative;
  top: 40px;
  right: 60px;
}


#searchButton {
  top: 25px;
  right: 1px;
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
  height: 40px;
  width: 30px;
  position: absolute;
}
#Login {
  position: relative;
  top: 45%;
}

#Myaccount {
    /*! display: flex; */
    /*! position: absolute; */
    /*! height: 50px; */
    margin-top: 40%;
}

#cart {
	position: relative;
	display: block;
	color: black;
	/*! top: 18px; */
	cursor: pointer;
	/* margin-left: 40px; */
	height: 80px;
	width: 80px;
	flex: 1 1 max-content;
	left: 30px;
	bottom: 20px;
        margin-top:30%;
}

#cart-img {
	
	background-size: 130px 110px;
	background-repeat: no-repeat;
	width: 130px;
	height: 110px;
	/*! top: 20px; */
	position: relative;
}

#cart-amount {        
    position: relative;
    top: 34px;
    left: 31px;
    width: min-content;
    z-index: 2;
}
        
#cart a {
	/*! bottom: 200px; */
        /*! left: 36px; */
	position: relative;
        text-decoration: none;
        color: black;
        display: block;
	width: 111px;
	height: 65px;
}   
    
.clickable {
 height: 80px;
 width: 80px;
 right: 50px;
 position: relative;
}

#basketIcon {
    margin-top:14%;
 margin-left: 50px;
  color: #ffd04d;
  height: 40px;
  width: 40px;
}
#cart-img {
	background-image: url("basket.optimized.svg");
	background-size: 130px 110px;
	background-repeat: no-repeat;
	width: 130px;
	height: 110px;
	/*! top: 20px; */
	position: relative;
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
  left: 40px;

  top: 10%;
  font-family: proxima-nova, arial, sans-serif;
}

/*edw ksekinaei to hovermenu  kai to  text*/
/* The container <div> - needed to position the dropdown content */
.section{
    margin-top:0;
    height:auto;
}
.dropdown {
  position: relative;
  display: inline-block;
  
 }
 .dropbtn{
     width:8em;
 }

/* Dropdown Content (Hidden by Default) */
.dropdown-content {
  display: none;
  position: absolute;
  text-align:center;
  width:300px;
  background-color: #f1f1f1;
  min-width: 200px;
  box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
  z-index: 1;
  
}

/* Links inside the dropdown */
.dropdown-content a {
  color: black;
  padding: 12px 16px;
  text-decoration: none;
  display: block;
}

/* Change color of dropdown links on hover */
.dropdown-content a:hover {sbackground-color: #ddd;}

/* Show the dropdown menu on hover */
.dropdown:hover .dropdown-content {display: block;}

/* Change the background color of the dropdown button when the dropdown content is shown */
/*.dropdown:hover .dropbtn {background-color: #3e8e41;}*/




/* inherit property, tha klhronomhsei to property tou section, tou parent element */
#freeHomeDelivery {
  height:inherit ;
  width: auto;
  /* me ton sunduasmo position absolute kai margin-right(right)=0, mou phgainei to element terma deksia */
  position: relative;
  
  
 
  border: solid 1px grey;
  background-color: aquamarine;
}

#freeHomeDeliveryText {
  margin: 0;
  position: absolute;
  font-size:1em ;
  left:30px;
  top: 50%;
  -ms-transform: translateY(-50%);
  transform: translateY(-50%);
}

#booksPerCategory {
  margin: 0 15%;
  height: auto;
  
}
.specific-row {
  margin-left: 8%;
}
.image {
  height: 310px;
  width: 200px;
  margin: 10% 0 10% 0;
}
.despatched {
  font-size: small;
  position:relative;
  margin-left: 10%;
}
.addToBasket {
  position: absolute;
  top: 38%;
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
.OutOfStock{
     border-radius:10%; 
    height: auto;
    width: auto;
    background-color: grey;
  -webkit-animation-name: blackWhite;
  /* -webkit-animation-name: blackWhiteFade; */
  -webkit-animation-iteration-count: infinite;  
  -webkit-animation-duration: 1s; 
}
.formats{
    position:absolute;
}
.add-basket{
    margin-top: 40%;
}
.hr{
    margin-right: 30%;
}
/*    footer*/
#footer {
  display: flex;
  position: relative;
  width: auto;
  flex-wrap: wrap;
}

.footerBlock {
  position: relative;

  display: inline-flex;

  width: auto;
  line-height: 2;
  align-content: center;
  flex-grow: 1;
}

#whoWeAre {
  background-color: #ededed;
  display: block;
}

#helpfulLinks {
  text-align: center;
  background-color: #ededed;
  border-left: 1px solid #cccccc;
  border-right: 1px solid #cccccc;
  display: block;
}
#helpfulLinks ul {
  text-align: start;
}
#socialLinks {
  background-color: #e0e0e0;
}


      </style>
  
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
