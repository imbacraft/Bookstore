<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        >
        <title>JSP Page</title>
        <style>
            * {
        font-size: 16px;
        font-family: arial,sans-serif;
        text-decoration: none;
}
body {
        margin: 0 8%; 
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

        .header {
            height: 300px;
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
    <script>
/* When the user clicks on the button, 
toggle between hiding and showing the dropdown content */
function myFunction() {
  document.getElementById("myDropdown").classList.toggle("show");
}

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
}
</script>
        </head>
 <body>
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
  <button onclick="myFunction()" class="dropbtn">${detailsByBookAndFormatId.format.name}</button>
  <div id="myDropdown" class="dropdown-content">
      <c:forEach items= "${book.bookdetailsList}" var="bookDetail">
    <a href="${pageContext.request.contextPath}/books/search/${book.bookid}?formatid=${bookDetail.format.formatid}">${bookDetail.format.name}</a>
    </c:forEach>
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
             <div class="book">
                        <c:forEach items="${booksFromSameAuthor}" var="bookAuthor">
      <div class="row specific-row">
        
        
        <div class="col-3">
            <img class="image" src="${bookAuthor.bookdetailsList.toArray()[0].frontcover}" alt="bookImage" >
        </div>
        <div class="col-5">
 
          <h5 class="mainContent"><a href="${pageContext.request.contextPath}/books/search/${bookAuthor.bookid}">${book.title}</a></h5>
          <c:forEach items="${bookAuthor.authorList}" var="author">
          <h5> by <a href="${pageContext.request.contextPath}/authors/${author.authorid}"> ${author.firstname}${" "}${author.lastname}</a></h5>
        </c:forEach>
          <br>
          
            <c:forEach items="${bookAuthor.bookdetailsList}"  var="bookDetail">   
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
                  
                  <form:form action="${pageContext.request.contextPath}/cart/buy/${bookAuthor.bookid}" method="GET">
                      <c:forEach items="${bookAuthor.bookdetailsList}"  var="bookDetail">
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
            <footer class="footer"></footer>
      </body>
        </html>