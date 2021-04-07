/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bookstore.repo;

<<<<<<< HEAD:src/main/java/bookstore/repo/FormatRepo.java
import bookstore.entity.Format;
=======
import bookstore.entity.Booktype;
import java.util.List;
>>>>>>> 0c01eb5d3b4c93043b7959a8bd71297773efd617:src/main/java/bookstore/repo/BooktypeRepo.java
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

/**
 *
 * @author Dell
 */
@Repository
public interface FormatRepo extends JpaRepository<Format, Integer> {
    
     
}
