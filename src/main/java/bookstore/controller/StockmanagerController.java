/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bookstore.controller;

import bookstore.entity.Book;
import bookstore.repo.BookRepo;
import bookstore.repo.CartRepo;
import bookstore.repo.CustomerRepo;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

/**
 *
 * @author Dell
 */
@RequestMapping("/stock")
@Controller
public class StockmanagerController {
    
    @Autowired
    BookRepo bookRepo;
    
    @Autowired
    CustomerRepo customerRepo;
    
    @Autowired
    CartRepo cartRepo;
    
    @GetMapping
    public String showStockHome(){
    return "stockManagerHome";
    }
    
    
    //click manage books-->show the list
    @GetMapping("/books")
    public String manageBooks(Model model){
    List<Book> books = bookRepo.findAll();
    
    model.addAttribute("booksList", books);
        
    return "stock-management";
    }
    
    @RequestMapping(value = "/books/create", method = RequestMethod.GET)
    public String showBookForm(@ModelAttribute("bookToEdit")Book book,BindingResult result){
        
        return "CreateUpdateBookForm";
    }
    
      @RequestMapping(value = "/books/create", method = RequestMethod.POST)
    public String create(Book book, RedirectAttributes attributes){
        bookRepo.save(book);
        String minima = "book "+  book.getTitle()+ " successfully created!!";
        attributes.addFlashAttribute("message", minima);//na thumithw na balw edw pou tha mpei to mhnuma
        return "redirect:/stock/books";//Redirect instructs client to sent a new GET request to /customer
    }
    
    @GetMapping("/books/delete")
    public String delete(@RequestParam("id") int id, RedirectAttributes attributes){
        Book book=bookRepo.findById(id).get();
        bookRepo.delete(book);
        String minima = "Book "+book.getTitle()+book.getCategoryList()+" successfully deleted!!";
        attributes.addFlashAttribute("message", minima);
        return "redirect:/stock/books";
    }
    
    
    //*******Updatee********
     @GetMapping("/books/update")
    public String showFormUpdate(@RequestParam("id") int id, Model model){
        Book book = bookRepo.findById(id).get();
        model.addAttribute("bookToEdit", book);
        return "CreateUpdateBookForm";//einai h idia forma me pio panw
    }
    
    @RequestMapping(value="/books/update", method=RequestMethod.POST)
    public String update(Book book, RedirectAttributes attributes){
        bookRepo.save(book);
        String minima = "Book updated successfully!!";
        attributes.addFlashAttribute("message", minima);
        return "redirect:/stock/books";
    }
    
    
    

//    //add stock
//    @PutMapping("/books/{bookid}")
//    public ResponseEntity<Book> updateBookStock(@RequestBody Book bookDetails,
//            @PathVariable int bookid){
//        Book book=bookRepo.findById(bookid).get();//to get kanei to optional Book , book
//        book.setCount(bookDetails.getCount()+20);//slightly Random increase in stock account
//        book=bookRepo.save(book);
//        return ResponseEntity.status(HttpStatus.OK).body(book);
//        
//   }
    
    
}
