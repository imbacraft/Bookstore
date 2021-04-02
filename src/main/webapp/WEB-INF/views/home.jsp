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
        <link
      rel="stylesheet"
      href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
      integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
      crossorigin="anonymous"
    />
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
            <img src="/static.images/bookLogo1.jpg" alt="bookLogo" id="bookLogo" />
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
     +</div>
       </c:forEach>
          </nav>
        
        
        
        
        </section>
      
       
      
    
        
    
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




    </body>



</html>
