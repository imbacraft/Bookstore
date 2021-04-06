/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bookstore.repo;

import bookstore.entity.Booktype;
import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

/**
 *
 * @author Σταθης Καράμπελας
 */
public interface BooktypeRepo extends JpaRepository<Booktype, Integer> {
    
    @Query(value="SELECT booktype.* from book, booktype where book.booktype=booktype.booktypeid and book.title=?1",nativeQuery=true)
    public List<Booktype> findBookPossibleBookTypes(String bookTitle);
}
