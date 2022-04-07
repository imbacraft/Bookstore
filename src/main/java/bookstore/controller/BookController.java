/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bookstore.controller;

import bookstore.entity.Author;
import bookstore.entity.Book;
import bookstore.entity.Bookdetails;
import bookstore.entity.Category;
import bookstore.repo.AuthorRepo;
import bookstore.repo.BookRepo;
import bookstore.repo.BookdetailsRepo;
import bookstore.repo.CategoryRepo;
import bookstore.service.BookService;
import java.util.List;
import java.util.Objects;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class BookController {
    
    @Autowired
    BookRepo bookRepo;
    
    @Autowired
    BookdetailsRepo bookdetailsRepo;
    
    @Autowired
    BookService bookService;
    
    @Autowired
    AuthorRepo authorRepo;
    
    @Autowired
    CategoryRepo categoryRepo;
    
    
    @GetMapping("/books/search/{bookid}")
    public String getSpecificBook(@PathVariable("bookid") int bookid,@RequestParam(value="formatid", required= false, defaultValue="0") Integer formatid, Model model) {
        formatid=bookService.findAFormatOfABook(bookid, formatid);
        Bookdetails detailsByBookAndFormatId = bookdetailsRepo.findByBookidandFormatid(bookid,formatid);
        model.addAttribute("detailsByBookAndFormatId", detailsByBookAndFormatId);
        
        Book book= bookRepo.findByBookid(bookid);
        model.addAttribute("book", book);

//         List<Book> booksFromSameAuthor= bookService.findBooksFromSameAuthor(bookid);
//         model.addAttribute("booksFromSameAuthor",booksFromSameAuthor);
         
         List<Category> categByBook=categoryRepo.findByBook(bookid);
         model.addAttribute("categByBook",categByBook);
         
          List<Category> categories = categoryRepo.findAll();
        
        //all authors-- for menu
        List<Author> allAuthors = authorRepo.findAll();
        
        
        model.addAttribute("categories", categories);
        model.addAttribute("authors", allAuthors);

         return "specificBook";
    }
    
    


}
    