
package bookstore.controller;

import bookstore.entity.Author;
import bookstore.entity.Book;
import bookstore.repo.AuthorRepo;
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
    BookService bookService;
    
     @GetMapping("/authors/{lastname}")
   public String showSpecificAuthor(@PathVariable("lastname") String lastname , Model model){
         Author author=authorRepo.findByLastname(lastname);
         model.addAttribute("author",author);
         
         List <Book> booksFromSameAuthor=authorRepo.findBooksFromSameAuthor(author.getAuthorid());
         model.addAttribute("booksFromSameAuthor",booksFromSameAuthor);
         
         return "specificAuthor";  
   }
}
