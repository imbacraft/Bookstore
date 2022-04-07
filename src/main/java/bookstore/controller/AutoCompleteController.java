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
import java.util.Objects;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class AutoCompleteController {

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

    @GetMapping("/booksAutocomplete")
    @ResponseBody
    public List<String> booksAutocomplete(
            @RequestParam(value = "term", required = false, defaultValue = "") String term) {

        // books autocompleted depends on bookDetails
        List<Book> autoBooks_BookDetails = bookRepo.findFirst5ByTitleStartingWithIgnoreCaseOrderByTitle(term);

        List<Author> autocompleteAuthorLastNames = authorRepo.findByLastnameStartingWithIgnoreCaseOrderByLastname(term);
        List<Author> autocompleteAuthorFirstNames = authorRepo.findByFirstnameStartingWithIgnoreCaseOrderByFirstname(term);

        List<String> suggestions = new ArrayList<>();

        for (Book b : autoBooks_BookDetails) {
            suggestions.add(b.getTitle());
        }

        for (Author a : autocompleteAuthorLastNames) {

            suggestions.add(a.getFirstname()+" "+a.getLastname());
        }

        for (Author a : autocompleteAuthorFirstNames) {

            suggestions.add(a.getFirstname()+" "+a.getLastname());
        }

        return suggestions;// twra tha paw sto front page kai tha looparw ta values tou map, analogws me to
                           // an einai
        // book, format h category key, kai tha parapempei sta antistoixa link
    }

    @PostMapping("/search")
    public String searchByTerm(@RequestParam("title") String title) {
        Book book;
        Author author;

        String[]splitAuthorName = title.split(" ");


        try {
            book = bookRepo.findByTitleIgnoreCase(title);
            author = authorRepo.findByLastname(splitAuthorName[1]);

        } catch (Exception exc) {

            exc.printStackTrace();
            return "redirect:/home";
        }

        if (!Objects.isNull(author)) {

            return "redirect:/authors/" + author.getLastname();

        }

        if (!Objects.isNull(book)) {

            return "redirect:/books/search/" + book.getBookid();

        }

        return "redirect:/home";

    }

}
