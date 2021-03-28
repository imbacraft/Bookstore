/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bookstore.service;

import bookstore.entity.Admin;
import bookstore.entity.Customer;
import bookstore.entity.Customerserviceagent;
import bookstore.entity.Role;
import bookstore.entity.Stockmanager;
import bookstore.repo.AdminRepo;
import bookstore.repo.CustomerRepo;
import bookstore.repo.CustomerServiceAgentRepo;
import bookstore.repo.StockmanagerRepo;
import java.util.ArrayList;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class UserServiceImpl implements UserService {

    @Autowired
    AdminRepo adminRepo;

    @Autowired
    CustomerRepo customerRepo;

    @Autowired
    CustomerServiceAgentRepo customerServiceAgentRepo;
    
    @Autowired
    StockmanagerRepo stockmanagerRepo;

    @Autowired
    PasswordEncoder passwordEncoder;

    @Override
    public Admin findAdminByUsername(String username) {
        return adminRepo.findByUsername(username);
    }

    @Override
    public Customer findCustomerByUsername(String username) {
        return customerRepo.findByUsername(username);
    }

    @Override
    public Customerserviceagent findCustomerserviceagentByUsername(String username) {
        return customerServiceAgentRepo.findCustomerserviceagentByUsername(username);
    }
    
        @Override
    public Stockmanager findStockmanagerByUsername(String username) {
        return stockmanagerRepo.findStockmanagerByUsername(username);
    }

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        User userOfSpringSecurity;

        //Try to get Admin from DB
        Admin admin = findAdminByUsername(username);

        Customer customer = findCustomerByUsername(username);

        Customerserviceagent customerServiceAgent = findCustomerserviceagentByUsername(username);
        
        Stockmanager stockmanager = findStockmanagerByUsername(username);

        //Check what kind of user it is (admin, customer, customerserviceagent, stockmanager, else return error mesage)
        if (admin != null) {

            List<GrantedAuthority> authorities = convertRolesToGrantedAuthorities(admin.getRole());

            userOfSpringSecurity = new User(admin.getUsername(), admin.getPassword(), authorities);

        } else if (customer != null) {

            List<GrantedAuthority> authorities = convertRolesToGrantedAuthorities(customer.getRole());

            userOfSpringSecurity = new User(customer.getUsername(), customer.getPassword(), authorities);
        } else if (customerServiceAgent != null) {

            List<GrantedAuthority> authorities = convertRolesToGrantedAuthorities(customerServiceAgent.getRole());

            userOfSpringSecurity = new User(customerServiceAgent.getUsername(), customerServiceAgent.getPassword(), authorities);

        } else if (stockmanager !=null ){
        
            List<GrantedAuthority> authorities = convertRolesToGrantedAuthorities(stockmanager.getRole());

            userOfSpringSecurity = new User(stockmanager.getUsername(), stockmanager.getPassword(), authorities);
        
        }
        
        
        else {
            throw new UsernameNotFoundException("Invalid username");
        }

        return userOfSpringSecurity;
    }

    private List<GrantedAuthority> convertRolesToGrantedAuthorities(Role role) {

        List<GrantedAuthority> authorities = new ArrayList();

        GrantedAuthority authority = new SimpleGrantedAuthority(role.getRolename());

        authorities.add(authority);

        return authorities;
    }

    @Override
    public Admin saveUser(Admin newadmin) {

        return null;
//        String plainPassword = admin.getPassword();
//        String hashedPassword = passwordEncoder.encode(plainPassword);
//        admin.setPassword(hashedPassword);
//        Role role = roleRepo.findByRolenameContaining("USER");
//        admin.addRole(role);
//        admin = userRepo.save(admin);
//        return admin;
    }



}
