
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
    
    @Query(value="select author.* from author,book,joinedbookauthor where author.authorid=joinedbookauthor.authorid"
            + " and book.bookid=joinedbookauthor.bookid and book.bookid=?1 ",nativeQuery = true)
    List<Author> findByBook(int bookid);
    
    
    public List<Author> findByLastnameContainingIgnoreCase(String term);//ta Column names prepei
    //na einai akrivws opws sthn bash-java class..px me LastName skaei!!

    public List<Author> findByFirstnameContainingIgnoreCase(String term);
   
    
    

}


