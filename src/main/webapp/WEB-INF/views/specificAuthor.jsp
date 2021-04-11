<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Document</title>
    <style>   * {
        font-size: 16px;
        font-family: arial,sans-serif;

}
body {
    margin:0% 8%;
    
}


.container>div {
    text-align: left;
    padding:25px 25px;
}

div.header {
   height: 170px;
}


div.img1 {
    width:218px;
    height: 330px;
    
}
img.img1 {
    width:218px;
    height: 330px;
    border:solid yellow;
}
div.text1 {
    width: 70%;
    position:relative;
    left: 270px;
    bottom: 340px;
}

div.img2 {
    width: 200px;
    height:300px;
    position:relative;
    bottom:180px;
}

div.text2 {
    width: 70%;
    position:relative;
    left: 300px;
    bottom: 610px;
    
}

    

div.footer {
    height:300px;
}

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

p {
    line-height: 200%;
    font-size: 16px;
    font-family: Arial, Helvetica, sans-serif;
}


.books>div {
    float:left;
    padding: 1.5%;
    position:relative;
    bottom: 550px;
}
.title {
    font-size: 23px;
}

a{
    background-color: yellow;
}

 .cartBtn { 
  background-color: blue;
  color: white;
  border-radius: 12px;
  }
  
 
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



      

</style>
     </head>
        <body>
            <div class="container">
        <div class="header">
        </div>
        <div class="img1">
            <img class=img1 src="${author.portrait}" alt="not found">
        </div>
        <div class="text1">
            <div class=title>${author.firstname}  ${author.lastname}</div>
            <p class="text1">${author.biography}</p>
        </div>
        <section id="BooksFromSameAuthor">
    <div class="container">
        <div>Books from ${author.firstname}${" "}${author.lastname}  </div>
        <c:forEach items="${booksFromSameAuthor}" var="book">
          
      <div class="row specific-row">
        
        
        <div class="col-3">
            <img class="image" src="${book.bookdetailsList.toArray()[0].frontcover}" alt="bookImage" > 
        </div>
        <div class="col-5">
 
          <h5 class="mainContent"><a href="${pageContext.request.contextPath}/books/search/${book.bookid}">${book.title}</a></h5>
          
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
                
              
                  
                  
                      
     <input class="cartBtn" type="submit" value="Add to Cart" class="addToBasketBtn">
                      
                      
                  </form:form>  
              
              </div>
      </div>
   </div>
          </c:forEach>
            
       
    </div>

  </section>
        <div class="footer"></div>

        </body>
    </html>
</f:view>
