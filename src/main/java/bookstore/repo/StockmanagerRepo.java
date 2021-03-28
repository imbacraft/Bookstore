/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bookstore.repo;

import bookstore.entity.Customer;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import bookstore.entity.Stockmanager;
import org.springframework.data.jpa.repository.Query;

/**
 *
 * @author Dell
 */
@Repository
public interface StockmanagerRepo extends JpaRepository<Stockmanager, Integer> {
    
    //query must be defined here, because it requires the final parameter "?1"
    @Query(value = "SELECT st FROM Stockmanager st WHERE st.username = ?1")
    Stockmanager findStockmanagerByUsername(String username);
}
