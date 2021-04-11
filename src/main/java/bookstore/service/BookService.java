package bookstore.service;

import bookstore.entity.Author;
import bookstore.entity.Book;
import bookstore.repo.AuthorRepo;
import bookstore.repo.BookRepo;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Random;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class BookService {
    
    @Autowired
    BookRepo bookRepo;
    
    @Autowired
    AuthorRepo authorRepo;
    
 public List<Book> findBooksFromSameAuthor(int bookid) {
        List <Author> authors=authorRepo.findByBook(bookid);
        List<Book> books= new ArrayList<>();
        for (int i=0; i<authors.size(); i++)  {
            List<Book> b=bookRepo.findBooksFromSameAuthor(i,bookid);
            books.addAll(b);
        }
        return books;
    }
 
 public Integer findAFormatOfABook(int bookid,int formatid) {
     if (formatid==0) {
        Book book= bookRepo.findByBookid(bookid);
        formatid=book.getBookdetailsList().get(0).getFormat().getFormatid();
     }
     return formatid;
   
        }
 
}
 
    
  
 
        
        
    
    
    

