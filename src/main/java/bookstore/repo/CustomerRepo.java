/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bookstore.repo;

import bookstore.entity.Customer;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

/**
 *
 * @author Dell
 */
@Repository
public interface CustomerRepo extends JpaRepository<Customer,Integer> {
    
    //query must be defined here, because it requires the final parameter "?1"
    @Query(value = "SELECT c FROM Customer c WHERE c.username = ?1")
    Customer findByUsername(String username);
}
