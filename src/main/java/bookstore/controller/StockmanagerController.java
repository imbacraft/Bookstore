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
import java.util.Optional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

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
    
    //delete book
    @DeleteMapping("/books{bookid}")
    public ResponseEntity<String> deleteBook(@PathVariable int bookid){
        //find book with id=bookid
        Optional<Book> book=bookRepo.findById(bookid);
        if(!book.isPresent()){
            return ResponseEntity.notFound().build();
        }else{
            bookRepo.delete(book.get());
            return ResponseEntity.ok("Succesfully deleted!!!!!");
        }
    }
    
    
    //add stock
    @PutMapping("/books/{bookid}")
    public ResponseEntity<Book> updateBookStock(@RequestBody Book bookDetails,
            @PathVariable int bookid){
        Book book=bookRepo.findById(bookid).get();//to get kanei to optional Book , book
        book.setCount(bookDetails.getCount()+20);//slightly Random increase in stock account
        book=bookRepo.save(book);
        return ResponseEntity.status(HttpStatus.OK).body(book);
        
   }
    
    
}
