
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Bookaporta</title>
         <link rel="stylesheet" href="./css/styles.css" />
        <link rel="stylesheet" href="./css/styles2.css" />
         <link
      rel="stylesheet"
      href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
      integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
      crossorigin="anonymous"
    />
    </head>
    <body>
        <style>
            html,body{
    margin:0;
    background-color: #f2f4f7; 
}


#partWithLogo {
  /* background-color: cornsilk; */
  height: auto;
  margin-top:1%;
  margin-left: 13%;
  margin-right: 13%;
}

#bookLogo{
    margin-top:20px;
    height:90px;
    width:320px;
}



#searchText {
  position: relative;
  width: 300px;
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
  right: 0px;
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
	background-image: url("basket.optimized.svg");
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
  height: 70px;
  width: 70px;
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

/*edw teleiwse to header*/

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

.inputs{
    width: 30%;
    height:30px;
   font-size: 20px;
   padding: 15px;
   margin: 5px 0 22px 0;
   display: inline-block;
   border: none;
   
}
        </style>
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
            <form:form action="${pageContext.request.contextPath}/search/" id="form" method="POST">
               
            <input type="text" placeholder="Search..." id="searchText" value="" name="title"/>
            <input type="submit" value="" id="searchButton" />
          </form:form>
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
    <main style="margin-left:8%; margin-top:20px;"  class="address">
            
            
           
        <h2>Delivery Options</h2>

          <sec:authorize access="!isAuthenticated()">
              <h5>Recommendation: Order with a registered Customer Account to track your Order and receive Discount Coupons! </h5> <a href="${pageContext.request.contextPath}/login">Login/Register</a>
          </sec:authorize>
        <hr/>

        <sec:authorize access="hasRole('ADMIN')">
            <a href="${pageContext.request.contextPath}/admin">Administrator Home</a>
        </sec:authorize>

        <sec:authorize access="hasRole('SERVICEAGENT')">
            <a href="${pageContext.request.contextPath}/service">Service Agent Home</a>
        </sec:authorize>

        <br>

        <form:form action= "${pageContext.request.contextPath}/cart/address" method="post">


      <c:if test = "${containsOnlyEbook == false}">
                <h3>Choose delivery option:</h3>
                <h6>(Applies to non ebook items)</h6>   
            
                <input type="radio" id="standard" name="delivery" value="standard" required>
                <label for="standard">Standard delivery
                    <br>
                    Ships within 4-8 working days after dispatching
                    <br>
                    Price: 15 &euro;
                </label> 

                <br>

                <input type="radio" id="express" name="delivery" value="express" required>
                <label for="express">Express delivery
                    <br>
                    Ships within 1-3 working days after dispatching
                    <br>
                    Price: 35 &euro;</label>
                </c:if>

            <br>

  
           

 
       <sec:authorize access="!isAuthenticated()">
        <!-- if user is not authenticated-->

       
         
          <div>
               <h3>Personal details</h3> 

            <label for="firstname">First Name:</label>
            <input class="inputs" id="firstname" type="text" name="firstname"  value="${customer.firstname}" required />

            <br>

            <label for="lastname">Last Name:</label>
            <input class="inputs" id="lastname" type="text" name="lastname"  value="${customer.lastname}" required />

            <br>

            <label for="email">e-mail:</label>
            <input class="inputs" id="email" type="email" name="email" value="${customer.email}" required />

            <br>

            <label for="phone">Phone:</label>
            <input class="inputs" id="phone" type="text" name="phone" value="${customer.phone}" required />

            <br>

             </sec:authorize>
            
               <sec:authorize access="!isAuthenticated()">
             <c:if test = "${containsOnlyEbook == false}">
            <h3>Delivery address</h3> 


            <select id="country" name="country" required/>

            <c:choose>
                <c:when test="${customer.firstname != null}">
                <option value="${customer.country.countryid}">  ${customer.country.name}</option>
            </c:when>

            <c:otherwise>
             
                    <option value=""> Select Country </option>                 

            </c:otherwise>
        </c:choose>

        <c:forEach var = "country" items = "${countries}">
            <option value="${country.countryid}"> ${country.name}</option>                 
        </c:forEach>

    </select>

    <br>

    <label for="city">City:</label>
    <input class="inputs" id="city" type="text" name="city" value="${customer.city}" required/>

    <br>

    <label for="street">Street:</label>
    <input class="inputs" id="street" type="text" name="street" value="${customer.street}" required/>
    <br>

    <label for="streetnumber">Streetnumber:</label>
    <input class="inputs" id="streetnumber" type="number" min="1" name="streetnumber" value="${customer.streetnumber}" required/>
    <br>
    
    <label for="postalcode">Postal Code:</label>
    <input class="inputs" id="postalcode" type="number" min="1" name="postalcode" value="${customer.postalcode}" required/>
    <br>
    
    <br>
    <br>
       </c:if>
       </sec:authorize>

          </div>
    
    <button type="submit">Submit and Proceed to Payment via Stripe </button

</form:form>

    <br>
<a href="${pageContext.request.contextPath}/cart/index">Back to Cart</a>

    </main>

</body>


<%@include file="footer.jspf" %>

</html>
