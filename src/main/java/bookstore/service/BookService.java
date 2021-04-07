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
import java.util.ArrayList;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class BookService {
    
@Autowired
AuthorRepo authorRepo;    

@Autowired
BookRepo bookRepo;    
    
    public List<Book> findBooksFromSameAuthor (int bookid)  {
        List <Author> authorsByBook =authorRepo.findByBook(bookid);
        List<Book> booksFromSameAuthor=new ArrayList();
        for(int i=0; i<authorsByBook.size(); i++)  {
            int authorid= authorsByBook.get(i).getAuthorid();
            booksFromSameAuthor.addAll( bookRepo.findBooksFromSameAuthor(authorid, bookid) );       
        }
            return booksFromSameAuthor;
        }
   
}
