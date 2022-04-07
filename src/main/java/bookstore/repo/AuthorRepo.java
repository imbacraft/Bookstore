
package bookstore.repo;

import bookstore.entity.Author;
import bookstore.entity.Book;
import bookstore.entity.Bookdetails;
import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

@Repository
public interface AuthorRepo extends JpaRepository<Author, Integer> {

    
   
    @Query(value="select book.* from author,book,joinedbookauthor where book.bookid=joinedbookauthor.bookid"
            + " and author.authorid=joinedbookauthor.authorid and author.authorid=?1",nativeQuery = true)
            List<Book> findBooksFromSameAuthor(int id);
    
    
    @Override
    public List<Author> findAll();
    
   @Query(value="select author.* from author where author.authorid=?1",nativeQuery = true)
    Author findById(int id);
    
    
    @Query(value="select author.* from author,book,joinedbookauthor where author.authorid=joinedbookauthor.authorid"
            + " and book.bookid=joinedbookauthor.bookid and book.bookid=?1",nativeQuery = true)
    List<Author> findByBook(int bookid);
    
    
    public List<Author> findByLastnameContainingIgnoreCase(String term);//ta Column names prepei
    //na einai akrivws opws sthn bash-java class..px me LastName skaei!!


    public List<Author> findByFirstnameContainingIgnoreCase(String term);

    public List<Author> findByLastnameStartingWithIgnoreCaseOrderByLastname(String term);
   

    @Query(value="select author.* from author where author.lastname=?1",nativeQuery=true)
   Author findByLastname(String lastname);
      


    
//    There is a Named Query in Author entity for this
    
//    @Query(value="select * from author where lastname='Bryant';",nativeQuery=true)
//    public Author findSpecificByLastName();//specific
   
    //necessary in BooksPerCategory, where you have to show specific book's author
   @Query(value="select * from author,book,joinedbookauthor where author.authorid=joinedbookauthor.authorid and book.bookid=joinedbookauthor.bookid and book.bookid=?1",nativeQuery=true)
   public Author findByBookId(int bookid);

    
    


}


