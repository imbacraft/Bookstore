package bookstore.controller;

import bookstore.ResponseTag;
import bookstore.entity.Author;
import bookstore.entity.Book;
import bookstore.entity.Category;
import bookstore.repo.AuthorRepo;
import bookstore.repo.BookRepo;
import bookstore.repo.BookdetailsRepo;
import bookstore.repo.FormatRepo;
import bookstore.repo.CategoryRepo;
import bookstore.service.BookService;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/login")
public class LoginController {

    @Autowired
    CategoryRepo categoryRepo;

    @Autowired
    BookRepo bookRepo;
    
    @Autowired
    BookdetailsRepo bookdetailsRepo;

    @Autowired
    AuthorRepo authorRepo;

    @Autowired
    FormatRepo formatRepo;

    @Autowired
    BookService bookService;

    //*****all categories in homepage as options in select tag in 
    @GetMapping
    public String showLogin(Model model) {
        //all categories--for menu
        List<Category> categories = categoryRepo.findAll();
        
        //all authors-- for menu
        List<Author> allAuthors = authorRepo.findAll();
        
        //upcoming books--for multiple itemsPerSlide carousel
        List<Book> upcomingBooks=bookRepo.findUpcomingBooks();


        //TODO: define logic to pick author of the Month. Right now it is arbitrarily id 17.
        Author authorOfTheMonth=authorRepo.findById(17);//thelw specifically ton slott, g auto to bazw etsi

        //BookOfTheMonth--dialeksa to pio akrivo
        Book bookOfTheMonth=bookRepo.findBookOfTheMonth();
        
        
        
        model.addAttribute("categories", categories);
        model.addAttribute("authors", allAuthors);
        model.addAttribute("upcomingBooks",upcomingBooks);
        model.addAttribute("authorOfTheMonth", authorOfTheMonth);
        model.addAttribute("bookOfTheMonth", bookOfTheMonth);
      


        return "login";

    }

    
    //  ****Books PerCategory --in model --sent in jsp select --as options
    @GetMapping("/books/{categoryName}")
    public String showBooksPerCategory(@PathVariable("categoryName") String categoryName, Model model) {

        //menu tabs
        List<Category> categories = categoryRepo.findAll();
        List<Author> allAuthors = authorRepo.findAll();
        
       // bring all books where category=categoryName
        List<Book> booksPerCategory = bookRepo.findByCategory(categoryName);

 
        
        //model.addbooks
        model.addAttribute("booksPerCategory", booksPerCategory);
        model.addAttribute("categories", categories);
        model.addAttribute("authors", allAuthors);

        return "BooksPerCategory";
    }
    //****Get the specific book of one category****

  

   
    @GetMapping("/bestsellers")
    public String getBestsellers(Model model){
        //find bestsellers
        
        List<Book> bestsellers=bookRepo.findTop5();//agiogdutes, ta piasame  me thn timh
        
        //all categories--for menu
        List<Category> categories = categoryRepo.findAll();
        
        //all authors-- for menu
        List<Author> allAuthors = authorRepo.findAll();
        
        
        //send through model to the right jsp
        model.addAttribute("bestsellers",bestsellers);
        model.addAttribute("categories", categories);
        model.addAttribute("authors", allAuthors);
       
        return "bestsellers";
    }
    @GetMapping("/booksAutocomplete")
   @ResponseBody 
    public List<String> booksAutocomplete(@RequestParam( value="term",required=false,defaultValue="")String term){
         
        //books autocompleted depends on bookDetails
      List<Book> autoBooks_BookDetails=bookRepo.findFirst5ByTitleContainingIgnoreCase(term);
      List<String> suggestions=new ArrayList(); 
      
      for(Book b:autoBooks_BookDetails){
          suggestions.add(b.getTitle());
      }
//      
//      List<Author> authorsAutoComplete=authorRepo.findByLastnameContainingIgnoreCase(term);
//      
//     // List<Author> authorsAutoCompleteFirstName=authorRepo.findByFirstnameContainingIgnoreCase(term);
//      
//      Format format=formatRepo.findByNameContainingIgnoreCase(term);
//      
//      List<Category> categoryAutoComplete=categoryRepo.findByNameContainingIgnoreCase(term);
//  
//         for(Author author:authorsAutoComplete){
//            
//            suggestions.put("author",);
//        }
//         
////         for(Author author:authorsAutoCompleteFirstName){
////             suggestions.put("author"author.getFirstname()+" "+author.getLastname());
////         }
//         
//       suggestions.put("format",format.getName());
//         
//         for(Category category:categoryAutoComplete){
//             suggestions.put("category",category.getName());     
//         }
//            List<ResponseTag> responseTags=new ArrayList();
//           for(int i=0;i<autoBooks_BookDetails.size();i++ ){
//               ResponseTag tagi=new ResponseTag();
//               tagi.setBookName(autoBooks_BookDetails.get(i).getTitle());
//               tagi.setUrl("/books/search/"+autoBooks_BookDetails.get(i).getBookid());
//               responseTags.add(tagi);
//           }
//           System.out.println(responseTags.toString());
//        //h metatroph se json ginetai automata ap to spring 
       
        return suggestions;//twra tha paw sto front page kai tha looparw ta values tou map, analogws me to an einai
        //book, format h category key, kai tha parapempei sta antistoixa link
    }

    
    
    
}
