package bookstore.controller;

import bookstore.entity.Book;
import bookstore.entity.Customer;
import bookstore.entity.Cart;
import bookstore.repo.BookRepo;
import bookstore.repo.CustomerRepo;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import bookstore.repo.CartRepo;

@RequestMapping("/admin")
@Controller
public class AdminController {
    
    @Autowired
    BookRepo bookRepo;
    
    @Autowired
    CustomerRepo customerRepo;
    
    @Autowired
    CartRepo cartRepo;
    
    
    @GetMapping
    public String adminHome(){
        return "admin-home";
    }
    
    @GetMapping("/books")
    public String manageBooks(Model model){
    List<Book> books = bookRepo.findAll();
    
    model.addAttribute("listOfBooks", books);
        
    return "manage-books";
    }
    
    @GetMapping("/customers")
    public String manageCustomers(Model model){
    List<Customer> customers = customerRepo.findAll();
    List<Cart> carts = cartRepo.findAll();
    
    model.addAttribute("listOfCustomers", customers);
    model.addAttribute("listOfCarts", carts);
    
       carts.forEach(System.out::println);
        
    return "manage-customers";
    }
    
}
