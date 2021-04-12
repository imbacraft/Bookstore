/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bookstore.controller;

import bookstore.entity.Book;
import bookstore.entity.Bookdetails;
import bookstore.entity.Format;
import bookstore.entity.Category;
import bookstore.repo.BookRepo;
import bookstore.repo.BookdetailsRepo;
import bookstore.repo.CartRepo;
import bookstore.repo.CustomerRepo;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import bookstore.repo.FormatRepo;
import bookstore.repo.CategoryRepo;
import java.time.LocalDate;
import java.util.ArrayList;

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
    
    @Autowired
    FormatRepo formatRepo;
    
    @Autowired
    CategoryRepo categoryRepo;
    
    @Autowired
    BookdetailsRepo bookdetailsRepo;
    
    @GetMapping
    public String showStockHome(){
    return "stockManagerHome";
    }
    
    
    //click manage books-->show the list
    @GetMapping("/books")
    public String showAllBooks(Model model){
    List<Book> books = bookRepo.findAll();
    
    model.addAttribute("booksList", books);
        
    return "stock-management";
    }
    
    @RequestMapping(value = "/books/create", method = RequestMethod.GET)
    public String showBookForm(@ModelAttribute("bookToEdit")Book book,BindingResult result, Model model){
        
        List<Format> formats = formatRepo.findAll();
        List<Category> categories = categoryRepo.findAll();
        
        model.addAttribute("formats", formats);
        model.addAttribute("categories", categories);
        
        return "CreateUpdateBookForm";
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
     @GetMapping("/books/update/{id}/{formatid}")
    public String showFormUpdate(@PathVariable("id") int id,@PathVariable("formatid") int formatid, Model model){
        
        
        Book book = bookRepo.findById(id).get();
        Bookdetails bookdetails = bookdetailsRepo.findByBookidandFormatid(id, formatid);
        
        List<Format> formats = formatRepo.findAll();
        List<Category> categories = categoryRepo.findAll();
        
        model.addAttribute("formats", formats);
        model.addAttribute("categories", categories);
        
        model.addAttribute("bookToEdit", book);
        model.addAttribute("bookdetails", bookdetails);
        return "CreateUpdateBookForm";//einai h idia forma me pio panw
    }
    
    @PostMapping(value="/books/update")
    public String update(@RequestParam("id")String id, @RequestParam("title")String title,@RequestParam("description")String description, @RequestParam("category")String category, 
            @RequestParam("format")String format, @RequestParam("publisher")String publisher, @RequestParam("publicationdate")String publicationdate, @RequestParam("edition")String edition, 
            @RequestParam("isbn10")String isbn10, @RequestParam("isbn13")String isbn13, @RequestParam("count")String count,  @RequestParam("pages")String pages, @RequestParam("price")String price, @RequestParam("language")String language,
             @RequestParam("frontcover")String frontcover, RedirectAttributes attributes){
        
        int bookid= Integer.parseInt(id);
        int categoryid = Integer.parseInt(category);
        Category categoryAdd = categoryRepo.getOne(categoryid);
        List<Category> categoryList = new ArrayList<>();
        categoryList.add(categoryAdd);
        int formatid = Integer.parseInt(format);
        Format formatAdd = formatRepo.getOne(formatid);
        LocalDate publicdate = LocalDate.parse(publicationdate);
        int editionid = Integer.parseInt(edition);
        int countid = Integer.parseInt(count);
        double bookprice = Double.parseDouble(price);
        int pagesAdd = Integer.parseInt(pages);

        Book book = new Book(title, description, bookid, categoryList);
        Bookdetails bookdetails = new Bookdetails(bookprice, publisher, publicdate, language, frontcover, isbn10, isbn13, editionid, pagesAdd, countid, book, formatAdd);
        
        bookRepo.save(book);
        bookdetailsRepo.save(bookdetails);
        
        
        String minima = "Book created/updated successfully!!";
        attributes.addFlashAttribute("message", minima);
        return "redirect:/stock/books";
    }
    
     }
    
    

