/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bookstore.controller;

import bookstore.entity.Customer;
import bookstore.repo.CustomerRepo;
import java.security.Principal;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 *
 * @author Dell
 */
@RequestMapping("/customer")
@Controller
public class CustomerController {
    
    @Autowired
    CustomerRepo customerRepo;
    
    @GetMapping
    public String customerAccount(Principal principal, Model model){
        Customer customer = customerRepo.findByUsername(principal.getName());
        
        model.addAttribute("customer", customer);
            
        return "customer-account";
    }
    
}
