package bookstore.repo;

import bookstore.entity.Bookdetails;
import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;


@Repository
public interface BookdetailsRepo extends JpaRepository<Bookdetails,Integer> {
    
    
    @Query(value="select book.*, bookdetails.* from book, bookdetails where book.bookid = bookdetails.bookid and book.bookid =?1", nativeQuery = true)
    List<Bookdetails> findSameBooksDifFormat( int bookid, String booktitle);
    
     @Query(value="select bookdetails.* from book, bookdetails, format where bookdetails.bookid=?1 and bookdetails.formatid=?2", nativeQuery = true)
    Bookdetails findByBookidandFormatid(int bookid, int formatid);  
    
    
}
