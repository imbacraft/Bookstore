/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bookstore.service;

import bookstore.entity.Author;
import bookstore.entity.Book;
import bookstore.entity.Booktype;
import bookstore.repo.AuthorRepo;
import bookstore.repo.BookRepo;
import bookstore.repo.BooktypeRepo;
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
    
    @Autowired
    BooktypeRepo booktypeRepo;
    
    
    public Book getRandomBookOfTheMonth(){
    List<Book> allBooks=bookRepo.findAll();
    Random random=new Random();
    Book book=allBooks.get(random.nextInt(allBooks.size()));
    
    return book;
    
}
    //na diorthwthei otan exoume orderss!!
    public HashMap<Author,List<Book>> authorPerMonthDetails(){
        HashMap<Author,List<Book>>  monthAuthorBooksMap=new HashMap();
        Author monthAuthor=authorRepo.findSpecificByLastName();
        List<Book> monthAuthorBooks=bookRepo.findByAuthorLastName(monthAuthor.getLastname());
        monthAuthorBooksMap.put(monthAuthor, monthAuthorBooks);
        return monthAuthorBooksMap;
 }
    
    public HashMap<Integer, Author> findAuthorPerBook(){
        HashMap<Integer,Author> authorsPerBookId=new HashMap();
        List<Book> allBooks=bookRepo.findAll();
       for(Book book:allBooks){
           Author author=authorRepo.findByBookId(book.getBookid());
           authorsPerBookId.put(book.getBookid(), author);
       }
       return authorsPerBookId;
    }
    
    //egine sto front end
//    public HashMap<Book,String> MessageDependsOnStock(){
//        String outOfStock="Remaining";
//        String RunningOut="Running out...";
//        String InStock="In Stock";
//        
//        HashMap<Book,String> messageDependsOnStock=new HashMap();
//        List<Book> books=bookRepo.findAll();
//        for(Book book:books){
//           String message=(book.getCount()<5) ? book.getCount()+outOfStock:(book.getCount()>20 ?InStock : RunningOut);
//           messageDependsOnStock.put(book, message);
//        }
//        return messageDependsOnStock;
//    }
    
        public HashMap<Book,List<Booktype>> fetchBookPossibleBookTypes(){
            HashMap<Book,List<Booktype>> bookPossibleBooktypes=new HashMap();
            List<Book> books=bookRepo.findAll();
            for(Book book:books){
                List<Booktype> bookTypes=booktypeRepo.findBookPossibleBookTypes(book.getTitle());
//                bookPossibleBooktypes.put(book,bookTypes);
            book.setBooktypes(bookTypes);
            }
         return bookPossibleBooktypes;   
        }
    
    
    
}
