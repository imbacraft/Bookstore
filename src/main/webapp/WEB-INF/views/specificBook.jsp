<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
        <title>JSP Page</title>
         <link
     rel="stylesheet"
     href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
     integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
     crossorigin="anonymous"
   />
        <style>
            * {
        font-size: 16px;
        font-family: arial,sans-serif;
        text-decoration: none;
  
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
.dropdown1 {
  position: relative;
  display: inline-block;
  
 }
 .dropbtn1{
     width:8em;
 }

/* Dropdown Content (Hidden by Default) */
.dropdown-content1 {
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
.dropdown-content1 a {
  color: black;
  padding: 12px 16px;
  text-decoration: none;
  display: block;
}

/* Change color of dropdown links on hover */
.dropdown-content1 a:hover {sbackground-color: #ddd;}

/* Show the dropdown menu on hover */
.dropdown1:hover .dropdown-content1 {display: block;}

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

body {
        margin: 0; 
        }
        .header { grid-area: header; }
        .frontcover { grid-area: frontcover; }
        .bookDetails { grid-area: bookDetails; }
        .cartBox { grid-area: cartBox; }
        .relatedBooks { grid-area: relatedBooks; }
        .otherBooks { grid-area: otherBooks; }
        .footer { grid-area: footer; }
        
        .grid-container {
        display: grid;
        grid-template-areas: 
            'header header header'
            'frontcover bookDetails cartBox'
            'relatedBooks relatedBooks relatedBooks'
            'otherBooks otherBooks otherBooks'
            'footer footer footer';
            
        }  

        .grid-container {
            text-align: left;
            padding: 25px 25px;
        }

        

        .frontcover {
            height: 333px;
            width: 218px;
        }

        .bookDetails {
            width: 500px;
        }

        .cartBox {
            width: 218px;
            height:70px;
            padding-top: 45px;
            padding-bottom: 45px;
            background-color: gainsboro;
            text-align: center;
            border-radius: 12px;
            
        }

        .dropbtn {
            background-color: black;
            color: #ffd04d;
            padding: 5px;
            font-size: 14px;
            border: none;
            cursor: pointer;
        }
  

        .dropbtn:hover, .dropbtn:focus {
            background-color:#FFD04D;
        }
  
        .dropdown-content {
            display: none;
            position: absolute;
            background-color: #f1f1f1;
            min-width: 160px;
            z-index: 1;
        }
  
        .dropdown-content a {
            color: black;
            padding: 12px 16px;
            text-decoration: none;
            display: block;
        }
  
        .dropdown-content a:hover {background-color: #ddd}
  
        .show {display:block;}

        .title {
            font-size: 21px;
            font-family: Georgia, 'Times New Roman', Times, serif;
        }
        secTitle {
            font-size: 19px;
        }

        .blockTitle {
            text-align: center;
            background-color:yellow;
            width: 100%;
        }
  
        .authorPage {
            display: inline-block;
    }
    
    .info {
        font-style: italic;
    }   
    
    ul {
        list-style: none;
    }

    .cartBtn { 
  background-color: blue;
  color: white;
  border-radius: 12px;
  }
  
  .otherBooks>div {
    float:left;
    padding: 1.5%;
    }
 
    .dropbtn {
  background-color: yellow;
  color: black;
  padding: 4px;
  font-size: 12px;
  border: solid 2px black;
  border-radius: 12px;
  cursor: pointer;
  
}

.dropbtn:hover, .dropbtn:focus {
  background-color: black;
  color:yellow;
}

.dropdown {
  position: relative;
  display: inline-block;
}

.dropdown-content {
  display: none;
  position: absolute;
  background-color: #f1f1f1;
  min-width: 160px;
  overflow: auto;
  box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
  z-index: 1;
}

.dropdown-content a {
  color: black;
  padding: 12px 16px;
  text-decoration: none;
  display: block;
}

.dropdown a:hover {background-color: #ddd;}

.show {display: block;}
    </style>
    
        </head>
 <body>
     
      <section id="partWithLogo">
 <div class="row">
        <!-- 3 sthles/row sto megalo viewport, 2 sto mikrotero, kai 1 otan mikrunei teleiws -->
        <div class="col-lg-4">
          <!-- bazw sto 1/3 ths sthlhs 2 boxes->ara div, ara to ena katw ap to allo
          titlos +logia -->
          
            <img src="https://peoplecertproject.s3.eu-central-1.amazonaws.com/UI/bookaporta-logo.png" alt="bookLogo" id="bookLogo" />
        
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
           <section class="section">
        <div class="container" >
  <div class="row" >
      
    <div class="col-3" >
        <div class="dropdown1">
    
  <a class="dropbtn1" style="color:black;  font-size: 1.5em">BOOKS</a>
  <div class="dropdown-content1">
    
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
       <div class="dropdown1">
    
   <a class="dropbtn1" style="color:black; font-size: 1.5em">AUTHORS</a>
  <div class="dropdown-content1">
    
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
        <a class="dropbtn1" style="color:black; font-size: 1.5em" href="${pageContext.request.contextPath}/bestsellers">BESTSELLERS</a>
    </div>
      <div class="col-2"></div>
      <div class="col-3" id="freeHomeDelivery">
          <h5 id="freeHomeDeliveryText">JEFF BEZOS ΓΑΤΑΚΙ,ΕΡΧΟΜΑΣΤΕ</h5>
      </div>
  </div>
</div>

    
         
        </section>
    <hr>
     
     
     
     
    
    
    
     <section style="margin-left:8%;">
    <div class="grid-container">
        <header class="header">
        </header>
       <div class="frontcover">
        <img class="frontcover" src="${detailsByBookAndFormatId.frontcover}"
        alt="frontcover not found">
        </div>
      <div class="bookDetails">
        <span class=title>${book.title}</span>
        <span class="dropdown">
        <div class="dropdown1">
  <div style="border:solid black 2px;" class="dropbtn1">${detailsByBookAndFormatId.format.name}</div>
  <div class="dropdown-content1">
    <c:forEach items= "${book.bookdetailsList}" var="bookDetail">
    <a href="${pageContext.request.contextPath}/books/search/${book.bookid}?formatid=${bookDetail.format.formatid}">${bookDetail.format.name}</a>
    </c:forEach>
  </div>
</div>
</span>
        <br>
        <c:forEach items="${book.authorList}" var="author">
          <div> by <a class="secTitle" href="${pageContext.request.contextPath}/authors/${author.lastname}"> ${author.firstname}${" "}${author.lastname}</a></div>
        </c:forEach>
          <br>
          <br>
          <br>
           <c:choose>
	<c:when test="${detailsByBookAndFormatId.count<30}">
            <div><span style="color:yellow;">⚠ </span>Only  ${bookDetail.count} left in stock! </div>
	</c:when>
	<c:otherwise>
            <div><span style="color:green;"> ✔ </span>In Stock - Usually despatched within 48 hours  </div>
	</c:otherwise>
</c:choose>        
          
              <hr class="hr">
        <br>
        <br>
        <br>
        <div class="secTitle">Description <hr></div>
        <p class=description>${book.description}
        </p>
                <br>
                <div class="secTitle">Information<hr></div>
        <ul class=specificInfos>
        <li>categories:   <c:forEach items="${categByBook}" var="categ">${categ.name}${"  "}</c:forEach></li>
        <br>
        <li>publisher:   <span class="info">${detailsByBookAndFormatId.publisher}</span></li>
        <br>
        <li>publication date:   <span class="info">${detailsByBookAndFormatId.publicationdate}</span></li>
        <br>
        <li>edition:   <span class="info">${detailsByBookAndFormatId.edition}</span></li>
        <br>
        <li>language:   <span class="info">${detailsByBookAndFormatId.language}</span></li>
        <br>
        <li>pages:   <span class="info">${detailsByBookAndFormatId.pages}</span></li>
        <br>
        <li>isbn10:  <span class="info">${detailsByBookAndFormatId.isbn10}</span></li>
        <br>
        <li>isbn13:  <span class="info">${detailsByBookAndFormatId.isbn13}</span></li>
                </ul>
                </div>
        
        <div class=cartBox>
            <div>Price:  ${detailsByBookAndFormatId.price} &euro;</div>
            <br>
                      <form:form action="${pageContext.request.contextPath}/cart/buy/${book.bookid}" method="GET">
                      <input type="hidden" id="format" name="format" value="${detailsByBookAndFormatId.format.formatid}">
                     <input class="cartBtn" type="submit" value="Add to Cart" >
          </form:form>  
        </div>
            <div class="otherBooks">
                <div class="blockTitle">Also by the same author</div>
            <br>
            <br>
            <br>
            <div class="container">
  <div class="row">
      <c:forEach items="${book.authorList.toArray()[0].bookList}"  var="book"><!--kakws exoume many to many ton author,g auto ton proseggizw me [0] -->
    <div class="col-2">
        <a  href="${pageContext.request.contextPath}/books/search/${book.bookid}"><img style="width:200px; height:200px; padding-left:30px;" src="${book.bookdetailsList.toArray()[0].frontcover}"  </a>
    </div>
        </c:forEach>
  </div>
            </div>
            </div>
            
            
            
            
                </div>
           
            </section >
           <%@include file="footer.jspf"%>
           
            <script>
     /* When the user clicks on the button, 
toggle between hiding and showing the dropdown content */
    
function myFunction() {
  document.getElementById("myDropdown").classList.toggle("show");
  })
};

// Close the dropdown if the user clicks outside of it
window.onclick = function(event) {
  if (!event.target.matches('.dropbtn')) {
    var dropdowns = document.getElementsByClassName("dropdown-content");
    var i;
    for (i = 0; i < dropdowns.length; i++) {
      var openDropdown = dropdowns[i];
      if (openDropdown.classList.contains('show')) {
        openDropdown.classList.remove('show');
      }
    }
  }
}; 

let loginModal = document.getElementById("login-modal");
    function toggleModal()
    {
        if (loginModal.style.display !== "inline-block") loginModal.style.display = "inline-block";
        else loginModal.style.display = "none";
    }
</script>
      </body>
        </html>