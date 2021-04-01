package bookstore.service;

import bookstore.entity.Admin;
import bookstore.entity.Customer;
import bookstore.entity.Customerserviceagent;
import bookstore.entity.Stockmanager;
import org.springframework.security.core.userdetails.UserDetailsService;


public interface UserService extends UserDetailsService{
    
    Admin findAdminByUsername(String username);
    
    Customer findCustomerByUsername(String username);
    
    Customerserviceagent findCustomerserviceagentByUsername(String username);
    
    Stockmanager findStockmanagerByUsername(String username);
    
    Customer saveCustomer(Customer customer);
    
    Stockmanager saveStockmanager(Stockmanager stockmanager);
}
