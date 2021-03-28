package bookstore.controller;

import bookstore.entity.Book;
import bookstore.repo.BookRepo;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/admin")
@Controller
public class AdminController {
    
    @Autowired
    BookRepo bookRepo;
    
    
    @GetMapping
    public String adminHome(){
        return "admin-home";
    }
    
    @GetMapping("/books")
    public String adminBooks(Model model){
    List<Book> books = bookRepo.findAll();
    
    model.addAttribute("listOfBooks", books);
        
    return "admin-books";
    }
}
