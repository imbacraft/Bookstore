/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bookstore.controller;

import bookstore.entity.Cart;
import bookstore.entity.Customer;
import bookstore.repo.CartRepo;
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
    
     @GetMapping("/carts/create")
    public String showCreateCartForm(@ModelAttribute("cartToEdit") Cart cart, BindingResult result){
        
        return "create-update-cart";
    }
    
    
    @GetMapping("/carts/update")
    public String showUpdateCartForm(@RequestParam("id") int id, Model model){
        
        Cart cart = cartRepo.findById(id).get();
        
        model.addAttribute("cartToEdit", cart);
        
        return "create-update-cart";
    }
 
    @PostMapping("/carts/update")
    public String updateCustomer(Cart cart, RedirectAttributes attributes){
        
        
        System.out.println("Cart to be updated"+cart);
        
        
        cartRepo.save(cart);
        
        
        String successMessage = "Customer "+ cart.getCartid()+" successfully created/updated!!";
        
        attributes.addFlashAttribute("successMessage", successMessage);
       
        return "redirect:/admin/customers";
    
    }
    
}
