/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bookstore.repo;

import bookstore.entity.Book;
import java.util.List;
import java.util.Optional;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

/**
 *
 * @author Dell
 */
@Repository
public interface BookRepo extends JpaRepository<Book, Integer> {
    Optional<Book> findById(int bookId);
    
    @Query(value="select book.* from book,category,joinedbookcategory where book.bookid=joinedbookcategory.bookid"
            + " and category.categoryid=joinedbookcategory.categoryid and category.name=?1 ", nativeQuery = true)
    List<Book> findByCategory(String categoryName);
    
    @Query(value="select book.* from book,author,joinedbookauthor where book.bookid=joinedbookauthor.bookid \n" +
"and author.authorid=joinedbookauthor.authorid  and author.lastname=?1;",nativeQuery=true)
    List<Book> findByAuthorLastName(String lastName);
    
    
//    @Query(value="Select book.* from book order by book.price desc limit 0,5",nativeQuery=true)
//    List<Book> findTop5();
    
    
    
    @Query(value="select book.* from book,joinedbookauthor where joinedbookauthor.authorid=?1 and joinedbookauthor.bookid !=book.bookid", nativeQuery= true)
    List<Book> findBooksFromSameAuthor(int authorid,int bookid);
    
    
}
