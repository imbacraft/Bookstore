package bookstore.service;

import bookstore.entity.Admin;
import org.springframework.context.annotation.Bean;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


public interface UserService extends UserDetailsService{
    
    Admin findByUsername(String username);
    
    Admin saveUser(Admin newadmin);
}
