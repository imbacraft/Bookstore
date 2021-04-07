
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
    
<<<<<<< HEAD
    @Query(value="select author.* from author,book,joinedbookauthor where author.authorid=joinedbookauthor.authorid"
            + " and book.bookid=joinedbookauthor.bookid and book.bookid=?1 ",nativeQuery = true)
    List<Author> findByBook(int bookid);
=======
    @Query(value="select * from author where lastname='Bryant';",nativeQuery=true)
    public Author findSpecificByLastName();//specific
   
    //necessary in BooksPerCategory, where you have to show specific book's author
   @Query(value="select * from author,book,joinedbookauthor where author.authorid=joinedbookauthor.authorid and book.bookid=joinedbookauthor.bookid and book.bookid=?1",nativeQuery=true)
   public Author findByBookId(int bookid);
    
    
>>>>>>> stathis-branch
}


