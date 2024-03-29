/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bookstore.repo;

import bookstore.entity.Visitor;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

/**
 *
 * @author Dell
 */
@Repository
public interface VisitorRepo extends JpaRepository<Visitor,Integer> {
    
    @Query(value="select visitor.* from bookstore.visitor where email = ?1" ,nativeQuery = true)
    Visitor findVisitorByEmail(String email);
    
}
