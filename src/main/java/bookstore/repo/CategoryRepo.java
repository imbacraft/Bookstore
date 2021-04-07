/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bookstore.repo;

import bookstore.entity.Category;
import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

/**
 *
 * @author Σταθης Καράμπελας
 */
@Repository
public interface CategoryRepo extends JpaRepository<Category,Integer> {

   @Override
   public List<Category> findAll();
   
   @Query(value="select category.* from category,book,joinedbookcategory where joinedbookcategory.bookid=?1"
            + " and joinedbookcategory.category=category.categoryid;",nativeQuery = true)
    List<Category>findByBook(int bookid);
} 
    

