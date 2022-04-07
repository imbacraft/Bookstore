
//jqueryui, autocomplete

var ctx = "http://localhost:8080/bookstore/"

$(function () {
           

            $("#searchText").autocomplete({
                    minLength: 0,
                    source: ctx+"booksAutocomplete",
                    select: function (event, ui) {
                        console.log(ui.item.url);
                        console.log(ui.item.ui);
                    }
                })
            
        });
 
    
 
   
   //list .....data
   //ara ousiastika tha steiloume request("/source..name") ston controller,
   //tha epistrepsoume mia lista ap ton Controller, (booksAutocomplete)
  
   
        
             
           
            
  
  
       
       

          
      
      
  
    
 


