package bookstore.controller;

import bookstore.entity.Author;
import bookstore.entity.Book;
import bookstore.entity.Booktype;
import bookstore.entity.Category;
import bookstore.repo.AuthorRepo;
import bookstore.repo.BookRepo;
import bookstore.repo.BooktypeRepo;
import bookstore.repo.CategoryRepo;
import bookstore.service.BookService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping({"/home", "/"})
public class HomeController {
    
    @Autowired
    CategoryRepo categoryRepo;
    
    @Autowired
    BookRepo bookRepo;
    
    @Autowired
    AuthorRepo authorRepo;
    
    @Autowired
    BooktypeRepo booktypeRepo;
    
    @Autowired
    BookService bookService;
    

    //*****all categories in homepage as options in select tag in 
     @RequestMapping
    public String getCategories(Model model){
        List<Category> categories= categoryRepo.findAll();
        List<Author> allAuthors=authorRepo.findAll();
        List<Book> bestSellers=bookRepo.findTop5();
       model.addAttribute("categories",categories);
    model.addAttribute("authors", allAuthors);
    model.addAttribute("bestSellers", bestSellers);
       return "main";
   }
  
    
    
  //  ****Books PerCategory --in model --sent in jsp select --as options
   @GetMapping("/books/{categoryName}")
   public String showBooksPerCategory(@PathVariable("categoryName") String categoryName,Model model){
       //bring all books where category=categoryName
       List<Book> booksPerCategory=bookRepo.findByCategory(categoryName);
       
       //model.addbooks
       model.addAttribute("booksPerCategory",booksPerCategory);
       
     return "BooksPerCategory";  
   }
   //****Get the specific book of one category****
   @GetMapping("books/search/{bookid}")
   public String getSpecificBook(@PathVariable("bookid") int id,Model model){
       Book book=bookRepo.findById(id).get();
       model.addAttribute("book",book);
       
       List<Author> authorsByBook= authorRepo.findByBook(id);
       model.addAttribute("authorsByBook",authorsByBook);
       
       List<Book> booksFromSameAuthor= bookService.findBooksFromSameAuthor(id);
       model.addAttribute("booksFromSameAuthor",booksFromSameAuthor);
       String bookTitle= book.getTitle();
       List<Book> SameBooksDifFormat= bookRepo.findSameBooksDifFormat ( id, bookTitle );
       model.addAttribute( "SameBooksDifFormat", SameBooksDifFormat);
       
        List <Category> categByBook=categoryRepo.findByBook(id);
        model.addAttribute("categByBook", categByBook);
        
       return "specificBook";
    }
   
   
   
   
   
  
   //*******BooksPerAuthor--in model--sent in jsp select --as options
   @GetMapping("/authors/{authorName}")
   public String showBooksPerAuthor(@PathVariable("authorName")String authorLastName,Model model){
       //bring all books with a specific lastname-->sugkekrimenopoeitai sto BookRepo
       List<Book> booksPerAuthor=bookRepo.findByAuthorLastName(authorLastName);
    //sent it to model as attribute
       model.addAttribute("booksPerAuthor", booksPerAuthor);      
       return "bookPerAuthor";
   }
   
   
   
   
     
  }
   
   
  

