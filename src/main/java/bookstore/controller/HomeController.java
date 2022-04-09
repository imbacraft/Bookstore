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
@RequestMapping({ "/home", "/" })
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

    // *****all categories in homepage as options in select tag in
    @RequestMapping
    public String showHome(Model model) {
        // all categories--for menu
        List<Category> categories = categoryRepo.findAll();

        // all authors-- for menu
        List<Author> allAuthors = authorRepo.findAllByOrderByLastname();

        // upcoming books--for multiple itemsPerSlide carousel
        List<Book> upcomingBooks = bookRepo.findUpcomingBooks();

        // TODO: define logic to pick author of the Month. Right now it is arbitrarily author with id 17 (Dan Slott).
        Author authorOfTheMonth = authorRepo.findById(17);// thelw specifically ton slott, g auto to bazw etsi

        // BookOfTheMonth--dialeksa to pio akrivo
        Book bookOfTheMonth = bookRepo.findBookOfTheMonth();

        model.addAttribute("categories", categories);
        model.addAttribute("authors", allAuthors);
        model.addAttribute("upcomingBooks", upcomingBooks);
        model.addAttribute("authorOfTheMonth", authorOfTheMonth);
        model.addAttribute("bookOfTheMonth", bookOfTheMonth);

        return "home";

    }

    // ****Books PerCategory --in model --sent in jsp select --as options
    @GetMapping("/books/{categoryName}")
    public String showBooksPerCategory(@PathVariable("categoryName") String categoryName, Model model) {

        // menu tabs
        List<Category> categories = categoryRepo.findAll();
        List<Author> allAuthors = authorRepo.findAllByOrderByLastname();


        // bring all books where category=categoryName
        List<Book> booksPerCategory = bookRepo.findByCategory(categoryName);

        // model.addbooks
        model.addAttribute("booksPerCategory", booksPerCategory);
        model.addAttribute("categories", categories);
        model.addAttribute("authors", allAuthors);

        return "BooksPerCategory";
    }

    @GetMapping("/bestsellers")
    public String getBestsellers(Model model) {

        // find bestsellers
        List<Book> bestsellers = bookRepo.findTop5();// agiogdutes, ta piasame me thn timh

        // all categories--for menu
        List<Category> categories = categoryRepo.findAll();

        // all authors-- for menu
        List<Author> allAuthors = authorRepo.findAllByOrderByLastname();

        // send through model to the right jsp
        model.addAttribute("bestsellers", bestsellers);
        model.addAttribute("categories", categories);
        model.addAttribute("authors", allAuthors);

        return "bestsellers";
    }

}
