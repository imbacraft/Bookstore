/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bookstore.controller;

import bookstore.entity.Cart;
import bookstore.entity.Country;
import bookstore.entity.Customer;
import bookstore.repo.CartRepo;
import bookstore.repo.CountryRepo;
import bookstore.repo.CustomerRepo;
import bookstore.repo.VisitorRepo;
import bookstore.service.UserService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

/**
 *
 * @author Dell
 */
@RequestMapping("/service")
@Controller
public class CustomerServiceAgentController {
    
    @Autowired
    CartRepo cartRepo;
    
    @Autowired
    VisitorRepo visitorRepo;
    
    @Autowired
    CustomerRepo customerRepo;
    
    @Autowired
    UserService userService;
    
    @Autowired
    CountryRepo countryRepo;
    
    
    @GetMapping
    public String serviceAgentHome(){
        return "serviceagent-home";
    }
    
    @GetMapping("/carts")
    public String showCarts(Model model){
     List<Cart> carts = cartRepo.findAll();
    
    model.addAttribute("listOfCarts", carts);
            
    return "manage-carts";
    }
   
    @GetMapping("/carts/delete")
    public String delete(@RequestParam("id") int id, RedirectAttributes attributes){
        Cart cart = cartRepo.findById(id).get();
        
        cartRepo.delete(cart);
        String minima = "Cart successfully deleted!!";
        attributes.addFlashAttribute("message", minima);
        return "redirect:/stock/books";
    }
    
  @GetMapping("/customers")
    public String showCustomers(Model model){
    List<Customer> customers = customerRepo.findAll();
   
    model.addAttribute("listOfCustomers", customers);
        
    return "manage-customers";
    }
    
    @GetMapping("/customers/update")
    public String showUpdateCustomerForm(@RequestParam("id") int id, Model model){
        
        Customer customer = customerRepo.findById(id).get();
        List<Country> countries = countryRepo.findAll();
        
        model.addAttribute("countries", countries);
        
        model.addAttribute("customerToEdit", customer);
        
        return "create-customer";
    }
 
    @PostMapping("/customers/update")
    public String updateCustomer(Customer customer, RedirectAttributes attributes){
        
        
        System.out.println("Customer to be updated"+customer);
        
        userService.saveCustomer(customer);
        
        String successMessage = "Customer "+ customer.getFirstname()+" "+customer.getLastname()+" successfully updated!!";
        attributes.addFlashAttribute("successMessage", successMessage);
       
        return "redirect:/admin/customers";
    
    }   
    
}
