package bookstore.service;

import bookstore.entity.Admin;
import bookstore.entity.Customer;
import org.springframework.security.core.userdetails.UserDetailsService;


public interface UserService extends UserDetailsService{
    
    Admin findAdminByUsername(String username);
    
    Customer findCustomerByUsername(String username);
    
    Admin saveUser(Admin newuser);
}
