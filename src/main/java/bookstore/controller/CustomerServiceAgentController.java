/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bookstore.controller;

import bookstore.entity.Cart;
import bookstore.repo.CartRepo;
import bookstore.repo.VisitorRepo;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
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
   
    @GetMapping("/carts/delete")
    public String delete(@RequestParam("id") int id, RedirectAttributes attributes){
        Cart cart = cartRepo.findById(id).get();
        
        cartRepo.delete(cart);
        String minima = "Cart successfully deleted!!";
        attributes.addFlashAttribute("message", minima);
        return "redirect:/stock/books";
    }
    
}
