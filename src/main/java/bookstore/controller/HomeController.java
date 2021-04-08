package bookstore.controller;

import bookstore.entity.Author;
import bookstore.entity.Book;
import bookstore.entity.Bookdetails;
import bookstore.entity.Format;
import bookstore.entity.Category;
import bookstore.repo.AuthorRepo;
import bookstore.repo.BookRepo;
import bookstore.repo.BookdetailsRepo;
import bookstore.repo.FormatRepo;
import bookstore.repo.CategoryRepo;
import bookstore.service.BookService;
import bookstore.service.BookService;
import java.util.HashMap;
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
    BookdetailsRepo bookdetailsRepo;

    @Autowired
    AuthorRepo authorRepo;

    @Autowired
    FormatRepo formatRepo;

    @Autowired
    BookService bookService;

    //*****all categories in homepage as options in select tag in 
    @RequestMapping
    public String showHome(Model model) {
        //all categories--for menu
        List<Category> categories = categoryRepo.findAll();
        
        //all authors-- for menu
        List<Author> allAuthors = authorRepo.findAll();
        
        //upcoming books--for multiple itemsPerSlide carousel
        List<Book> upcomingBooks=bookRepo.findUpcomingBooks();

        //authorOfTheMonth-->pairnw karfwta enan pou exei polla biblia gia tis anagkes tou front
        Author authorOfTheMonth=authorRepo.findById(17).get();
        System.out.println(authorOfTheMonth.getBookList().get(0).getTitle());
        
        
        Book bookOfTheMonth=bookRepo.findMostExpensiveBook();
        
        
        //add BookOfTheMonth--dialeksa to pio akrivo
        
        model.addAttribute("categories", categories);
        model.addAttribute("authors", allAuthors);
        model.addAttribute("upcomingBooks",upcomingBooks);
        model.addAttribute("authorOfTheMonth",authorOfTheMonth);
        model.addAttribute("bookOfTheMonth", bookOfTheMonth);


        return "main";

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

    @GetMapping("books/search/{bookid}")
    public String getSpecificBook(@PathVariable("bookid") int id, Model model) {
        Book book = bookRepo.findById(id).get();
        model.addAttribute("book", book);

        List<Author> authorsByBook = authorRepo.findByBook(id);
        model.addAttribute("authorsByBook", authorsByBook);

//       List<Book> booksFromSameAuthor= bookService.findBooksFromSameAuthor(id);
//       model.addAttribute("booksFromSameAuthor",booksFromSameAuthor);
        
        


        return "specificBook";
    }

    //*******BooksPerAuthor--in model--sent in jsp select --as options
    @GetMapping("authors/{authorName}")
    public String showBooksPerAuthor(@PathVariable("authorName") String authorLastName, Model model) {
        //bring all books with a specific lastname-->sugkekrimenopoeitai sto BookRepo
        List<Book> booksPerAuthor = bookRepo.findByAuthorLastName(authorLastName);
        //sent it to model as attribute
        model.addAttribute("booksPerAuthor", booksPerAuthor);
        return "bookPerAuthor";
    }
    
    @GetMapping("/bestsellers")
    public String getBestsellers(Model model){
        //find bestsellers
        
        List<Book> bestsellers=bookRepo.findTop5();//agiogdutes, ta piasame  me thn timh
        
        
        //send through model to the right jsp
        model.addAttribute("bestsellers",bestsellers);
        return "bestsellers";
    }

    
    
    
}
