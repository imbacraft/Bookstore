<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="/resources/bookpage.css">
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <title>JSP Page</title>
        <script>
            function myFunction() {
                document.getElementById("myDropdown").classList.toggle("show");
            }
            window.onclick = function(event) {
                if (!event.target.matches('.dropbtn')) {
                    var dropdowns = document.getElementsByClassName("dropdown-content");
                    var i;
                    for (i = 0; i < dropdowns.length; i++) {
                        var openDropdown = dropdowns[i];
                        if (openDropdown.classList.contains('show')) {
                        openDropdown.classList.remove('show');
            } } } 
    </script> 
        <style>
        body {
            
        }
        .header { grid-area: header; }
        .frontcover { grid-area: frontcover; }
        .bookDetails { grid-area: bookDetails; }
        .cartBox { grid-area: cartBox; }
        .relatedBooks { grid-area: relatedBooks; }
        #footer { grid-area: footer; }

        .grid-container {
        display: grid;
        grid-template-areas: 
            'header header header'
            'frontcover bookDetails cartBox'
            'relatedBooks relatedBooks relatedBooks'
            'footer footer footer';
            margin: 0 8%;
        }  

        .grid-container>div {
            text-align: left;
            padding: 25px 25px;
        }

        .header {
            height: 170px;
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
        }

        .dropbtn {
            background-color: white;
            color: grey;
            padding: 5px;
            font-size: 14px;
            border: none;
            cursor: pointer;
        }
  

        .dropbtn:hover, .dropbtn:focus {
            background-color:yellow;
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

        .blockTitle {
            text-align: center;
            background-color:yellow;
        }
  
        .authorPage {
            display: inline-block;
    }
    
    .info {
        font-style: italic;
    }
    
    .description {
        font-family: arial,sans-serif;
    }
    
    .stock {
            font-color: green;
    }
        
        #footer {
        display: flex;
        position: relative;
        width: auto;
        flex-wrap: wrap;
    }

    .footerBlock {
        position: relative;
        width: auto;
        line-height: 2;
        align-content: center;
        flex-grow: 1;
    }

    #whoweare {
        position: relative;
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
        display: block;
        background-color: #e0e0e0;
    }
    </style>
  </head>
<body>
    <div class="grid-container">
        <div class="header">
           
        </div>

        <div class="frontcover">
            <img class=frontcover src="${book.frontcover}"
            alt="frontcover not found">
        </div>

        <div class="bookDetails">
            <span class=title>${book.title}</span>
            <span class="booktype-dropdown">
                <button onclick="myFunction()" class="dropbtn">booktype</button>
                <div id="myDropdown" class="dropdown-content">
                  <a href="#">Link 1</a>
                  <a href="#">Link 2</a>
                  <a href="#">Link 3</a>
                </div>
            </span>
            <br>
            <c:forEach items= "${authorsByBook}" var="author">
                    <a class=authorPage href="specificAuthor">
                        <h3><span>by</span>${author.firstname} ${author.lastname}</h3>
                    </a>
            </c:forEach>
            <br>
            <div class="stock">&check;  ${book.count} in stock</div>
            <br>
            <br>
            <br>
            <h3 class="secTitle">Description <hr></h3>
            <p class=description>${book.description}
            </p>
            <br>
            <h3 class="secTitle">Information<hr></h3>
            <ul class=specificInfos>
                <li>categories:  </li>
                <br>
                <li>publisher:   <span class="info">${book.publisher}</span></li>
                <br>
                <li>publication date:   <span class="info">${book.publicationdate}</span></li>
                <br>
                <li>edition:   <span class="info">${book.edition}</span></li>
                <br>
                <li>language:   <span class="info">${book.language}</span></li>
                <br>
                <li>pages:   <span class="info">${book.pages}</span></li>
                <br>
                <li>booktype:   <span class="info">${book.booktype.name}</span></li>
                <br>
                <li>isbn10:  <span class="info">${book.isbn10}</span></li>
                <br>
                <li>isbn13:  <span class="info">${book.isbn13}</span></li>
            </ul>
        </div>

        <div class=cartBox>
            <div>Price: ${book.price}</div>
            <div>Delivery costs:</div>
            <br>
            <a href="bookstore/cart">Add to basket</a>
        </div>
        <div class=relatedBooks>
            <h3 class=blockTitle>Also by the same author</h3>
            <a href="bookstore/relatedBooks">Miky<img src="fake" alt="not found"></a>
            <a href="bookstore/relatedBooks">Doland<img src="fake" alt="not found"></a>
        </div>

    <footer>
        <hr style="height: 1px; border-width: 0; color: #2794ad; background-color: #2794ad;"/>  

        <div id="footer">

            <div style="text-align: center;" id="whoweare" class="footerBlock">
                <p>Who we are</p>
            </div>
            
            <div id="helpfulLinks" class="footerBlock">
                <span style="text-align: center;">Helpful links</span>
                <ul>
                    <li><a href="/bookstore/login">Sign in / Register</a></li>
                    <li><a href="#">My Account</a></li>
                    <li><a href="#">Contact us</a></li>
                    <li><a href="#">FAQs</a></li>
                    <li><a href="#">Log out</a></li>
                </ul>
            </div>
            
            <div id="socialLinks" class="footerBlock">
                <ul         style="float: left; left: 17%;">
                    <li><img src="f_logo_RGB-Blue_128.png" width="24" height="24" alt="Facebook logo"/><span style="margin-bottom:  150px">Facebook</span></li>
                    <li><img src="2021 Twitter logo - blue-128.png" width="24" height="24" alt="Twitter logo"/>Twitter</li>
                    <li><img src="pinterest-logo-128.png" alt="Pinterest logo" width="24" height="24"/>Pinterest</li>
                    <li><img src="yt_logo_rgb_light-128.png" alt="YouTube logo"  height="16"/></li>
                </ul>
            </div>
        </div>
    </footer>
</body>
</html>