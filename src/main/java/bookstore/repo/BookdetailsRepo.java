/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bookstore.repo;

import bookstore.entity.Bookdetails;
import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

/**
 *
 * @author Dell
 */
@Repository
public interface BookdetailsRepo extends JpaRepository<Bookdetails,Integer> {
    
    
    @Query(value="select book.*, bookdetails.* from book, bookdetails where book.bookid = bookdetails.bookid and book.bookid =?1", nativeQuery = true)
    List<Bookdetails> findSameBooksDifFormat( int bookid, String booktitle);
    
     @Query(value="select bookdetails.* from book, bookdetails, format where book.bookid = bookdetails.bookid and format.formatid = bookdetails.formatid and book.bookid =?1 and format.formatid=?2", nativeQuery = true)
    Bookdetails findByBookidandFormatid(int bookid, int formatid);  
    
}
