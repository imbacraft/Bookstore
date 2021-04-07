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
        
        List<Category> categories = categoryRepo.findAll();
        List<Author> allAuthors = authorRepo.findAll();
//        Book bookOfMonth = bookService.getRandomBookOfTheMonth();
//        HashMap<Author, List<Book>> monthAuthorDetails = bookService.authorPerMonthDetails();
//        
        
        model.addAttribute("categories", categories);
        model.addAttribute("authors", allAuthors);
//        model.addAttribute("bestSellers", bestSellers);
//        model.addAttribute("bookOfMonth", bookOfMonth);
//        model.addAttribute("monthAuthorMap", monthAuthorDetails);

        return "home";

    }

    
    //  ****Books PerCategory --in model --sent in jsp select --as options
    @GetMapping("/books/{categoryName}")
    public String showBooksPerCategory(@PathVariable("categoryName") String categoryName, Model model) {
        //menu tabs
        List<Category> categories = categoryRepo.findAll();
        List<Author> allAuthors = authorRepo.findAll();
        
        //bring all books where category=categoryName
//        List<Book> booksPerCategory = bookRepo.findByCategory(categoryName);

        //find author Per Book
//        HashMap<Integer, Author> authorPerBook = bookService.findAuthorPerBook();

        //fetch BookTypes Per Book
        //model.addbooks
//        model.addAttribute("booksPerCategory", booksPerCategory);
        model.addAttribute("categories", categories);
        model.addAttribute("authors", allAuthors);
//        model.addAttribute("authorPerBook", authorPerBook);
//         model.addAttribute("bookBooktypes", bookBooktypes);

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
        String bookTitle = book.getTitle();
        
        List<Bookdetails> SameBooksDifFormat = bookdetailsRepo.findSameBooksDifFormat(id, bookTitle);
        model.addAttribute("SameBooksDifFormat", SameBooksDifFormat);

        List<Category> categByBook = categoryRepo.findByBook(id);
        model.addAttribute("categByBook", categByBook);

        return "specificBook";
    }

    //*******BooksPerAuthor--in model--sent in jsp select --as options
    @GetMapping("/authors/{authorName}")
    public String showBooksPerAuthor(@PathVariable("authorName") String authorLastName, Model model) {
        //bring all books with a specific lastname-->sugkekrimenopoeitai sto BookRepo
        List<Book> booksPerAuthor = bookRepo.findByAuthorLastName(authorLastName);
        //sent it to model as attribute
        model.addAttribute("booksPerAuthor", booksPerAuthor);
        return "bookPerAuthor";
    }

    //*******BestSeller Specific****
    
    
}
