<%-- 
    Document   : login.jsp
    Created on : 1 Απρ 2021, 3:47:58 π.μ.
    Author     : george
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <title>BookaPorta bookstore login</title>
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
h3::before, h3::after {
    border-top: 1px solid #cbe8f0;
    content: '';
    display: table-cell;
    position: relative;
    top: 0.5em;
    width: 47%;
}
    
.login-area {
    display: flex;
    flex-flow: wrap;
    justify-content: space-between;
}
.log-reg-box {
    border: 1px solid #2794ad;
    height: 450px;
    display: flex;
    flex: 1 1 400px;
    
    text-align: center;
     align-content: center;
     justify-content: center;
     margin: 10px;
     flex-basis: 200px;
}

.credentials {
     
    position: relative;
    
    margin: 70px;
    height: 50px;
    display: flex;

}
.credentials input {
    font-family: serif;
    font-size: 14pt;
    
}

.login-button input, 
.register-button  button {
    font-family: "Georgia", serif;
    
    right: 30px;
    bottom: 40px;
    text-align: center; 
    width: 80px; 
    height: 40px; 
    background-color: #2794ad; 
    color: white; 
    cursor: pointer;
    border: 2px solid #2794ad; 
    border-radius: 3px;
}

.log-reg-box p {
    font-size: 16pt;
}

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
    height:110px;
    width:320px;
}



#searchText {
  position: relative;
  width: 320px;
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
  right: 54px;
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


</style>
        
        <section id="partWithLogo" style="margin:0 13%;">
 <div class="row">
        <!-- 3 sthles/row sto megalo viewport, 2 sto mikrotero, kai 1 otan mikrunei teleiws -->
        <div class="col-lg-5">
          <!-- bazw sto 1/3 ths sthlhs 2 boxes->ara div, ara to ena katw ap to allo
          titlos +logia -->
          
             <a href="${pageContext.request.contextPath}">
            <img src="https://peoplecertproject.s3.eu-central-1.amazonaws.com/UI/bookaporta-logo.png" alt="bookLogo" id="bookLogo" />
        </a>
        
        </div>
       
        <div class="col-lg-4">
          <form action="" id="form">
            <input type="text" placeholder="Search..." id="searchText" />
            <input type="button" value="" id="searchButton" />
          </form>
        </div>
        <div class="col-lg-1"></div>
        
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
                <img  id="basketIcon" src="basket.png" alt="basketIcon">
            </a>
            </div>  
        </div> 
        </div>
                
            
             
            
          
        </div>
      

        </section>
                 
                 
 <h3 style="position: relative; text-align: center; font-family:  Georgia, serif; font-size: 16pt;">Account login & registration</h3>  
 <div class="login-area">
     <div class="log-reg-box" >
         
        <!-- Login Form --> 
        <form:form action="${pageContext.request.contextPath}/authenticate" method="post">
            
            <p>Are you already a member?</p>
             <div style="margin-top:5%; margin-left:70px;">         
        <c:if test="${param.error != null}">
                    <div class="login-error" style="color:red; background-color: lightgray; width:400px;height:30px;  ">
                      ❌ Invalid username or password.Please try again.
                    </div>
        </c:if> 
            </div>
            
            <div class="credentials">
                <input type="text" id="login" name="username" placeholder="login" size="40" required>
            </div>
            <div class="credentials">
                <input type="password" id="password" name="password" placeholder="password" size="40" required>
            </div>
           
            <div class="login-button">
                <input type="submit" value="Log In">
            </div>
        </form:form>
           
     </div>
            
    
    <div class="log-reg-box">
        <!-- Register -->
        <div>
            <p>Don't have an account?</p>
            <p style="font-size: 12pt; margin: 30px;">Take advantage of having a BookaPorta account and benefit 
                from easier transactions, offers and more...</p>
            
            <div class="register-button">
                <a href="${pageContext.request.contextPath}/register"><Button>Register</button></a>
                
            </div>
        </div>        

        </div>     
     
 </div>
        <div>
            <div>
                
                <!-- Checks for different messages -->
                <c:if test="${param.logout != null}">
                    <div class="logout">
                        <i>You logged out successfully</i>
                    </div>
                </c:if>
                

                
                <c:if test="${requestScope.registered != null}">
                    <div class="registered">
                        <i>Successfully registered. Try to sign in!!!</i>
                    </div>
                </c:if>
  




                
               

            </div>
        </div>
       
        <%@include file="footer.jspf" %>
    </body>
</html>