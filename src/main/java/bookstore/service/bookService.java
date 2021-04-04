/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bookstore.service;

import bookstore.entity.Author;
import bookstore.entity.Book;
import bookstore.repo.AuthorRepo;
import bookstore.repo.BookRepo;
import java.util.HashMap;
import java.util.List;
import java.util.Random;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author Σταθης Καράμπελας
 */
@Service
public class bookService {
    
    @Autowired
    BookRepo bookRepo;
    
    @Autowired
    AuthorRepo authorRepo;
    
    
    public Book getRandomBookOfTheMonth(){
    List<Book> allBooks=bookRepo.findAll();
    Random random=new Random();
    Book book=allBooks.get(random.nextInt(allBooks.size()));
    
    return book;
    
}
    
    public HashMap<Author,List<Book>> authorPerMonthDetails(){
        HashMap<Author,List<Book>>  monthAuthorBooksMap=new HashMap();
        Author monthAuthor=authorRepo.findByLastName();
        List<Book> monthAuthorBooks=bookRepo.findByAuthorLastName(monthAuthor.getLastname());
        monthAuthorBooksMap.put(monthAuthor, monthAuthorBooks);
        return monthAuthorBooksMap;
        
        
    }
    
    
    
}
