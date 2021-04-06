/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bookstore.repo;

import bookstore.entity.Author;
import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

/**
 *
 * @author Σταθης Καράμπελας
 */
@Repository
public interface AuthorRepo extends JpaRepository<Author, Integer> {
   
    @Override
    public List<Author> findAll();
    
    @Query(value="select * from author where lastname='Bryant';",nativeQuery=true)
    public Author findSpecificByLastName();//specific
   
    //necessary in BooksPerCategory, where you have to show specific book's author
   @Query(value="select * from author,book,joinedbookauthor where author.authorid=joinedbookauthor.authorid and book.bookid=joinedbookauthor.bookid and book.bookid=?1",nativeQuery=true)
   public Author findByBookId(int bookid);
    
    
}
