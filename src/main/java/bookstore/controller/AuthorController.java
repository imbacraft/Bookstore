
package bookstore.controller;

import bookstore.entity.Author;
import bookstore.entity.Book;
import bookstore.entity.Category;
import bookstore.repo.AuthorRepo;
import bookstore.repo.BookRepo;
import bookstore.repo.CategoryRepo;
import bookstore.service.BookService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

@Controller
public class AuthorController {
    
    @Autowired
    AuthorRepo authorRepo;
    
    @Autowired
    CategoryRepo categoryRepo;
    
    @Autowired
    BookRepo bookRepo;
    
    @Autowired
    BookService bookService;
    
     @GetMapping("/authors/{lastname}")
   public String showSpecificAuthor(@PathVariable("lastname") String lastname , Model model){
         Author author=authorRepo.findByLastname(lastname);
          //menu tabs
        List<Category> categories = categoryRepo.findAll();
        List<Author> allAuthors = authorRepo.findAll();
         model.addAttribute("author",author);
         
     //    List <Book> booksFromSameAuthor=authorRepo.findBooksFromSameAuthor(author.getAuthorid());
     List<Book> booksFromSameAuthor=bookRepo.findByAuthorLastName(lastname);
         model.addAttribute("booksFromSameAuthor",booksFromSameAuthor);
         model.addAttribute("categories", categories);
        model.addAttribute("authors", allAuthors);
         
         return "bookPerAuthor";  
   }

}
