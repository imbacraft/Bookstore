package bookstore.controller;

import bookstore.entity.Book;
import bookstore.entity.Customer;
import bookstore.entity.Cart;
import bookstore.entity.Customerserviceagent;
import bookstore.entity.Stockmanager;
import bookstore.repo.BookRepo;
import bookstore.repo.CustomerRepo;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import bookstore.repo.CartRepo;
import bookstore.repo.CustomerServiceAgentRepo;
import bookstore.repo.StockmanagerRepo;
import bookstore.service.UserService;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@RequestMapping("/admin")
@Controller
public class AdminController {
    
    @Autowired
    BookRepo bookRepo;
    
    @Autowired
    CustomerRepo customerRepo;
    
    @Autowired
    CartRepo cartRepo;
    
    @Autowired
    UserService userService;
    
    @Autowired
    StockmanagerRepo stockmanagerRepo;
    
    @Autowired
    CustomerServiceAgentRepo customerServiceAgentRepo;
    
    
    @GetMapping
    public String adminHome(){
        return "admin-home";
    }
    //////////
    //BOOKS
    /////////
    @GetMapping("/books")
    public String showAllBooks(Model model){

    return "redirect:/stock/books";
    }
    
    
     //////////////
    //CUSTOMERS
    ///////////////
    
    @GetMapping("/customers")
    public String showCustomers(Model model){
    List<Customer> customers = customerRepo.findAll();
    
    model.addAttribute("listOfCustomers", customers);
        
    return "manage-customers";
    }
    
    
  
    
    @GetMapping("/customers/create")
    public String showCreateCustomerForm(@ModelAttribute("customerToEdit") Customer customer, BindingResult result){
        
        return "create-customer";
    }
    
    
    @GetMapping("/customers/delete")
    public String deleteCustomer(@RequestParam("id") int id, RedirectAttributes attributes){
        
        Customer customer = customerRepo.findById(id).get();
        
        String successMessage = "Customer "+ customer.getFirstname()+" "+customer.getLastname()+" successfully deleted!!";
        attributes.addFlashAttribute("successMessage", successMessage);
        
        customerRepo.deleteById(id);
        
        return "redirect:/admin/customers";
    }
    
    @GetMapping("/customers/update")
    public String showUpdateCustomerForm(@RequestParam("id") int id, Model model){
        
        Customer customer = customerRepo.findById(id).get();
        
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
    
     ////////////////////
    //CARTS
    ////////////////////
    
      @GetMapping("/carts")
    public String showCarts(Model model){

    return "redirect:/service/carts";
    }
    
     ////////////////////
    //STOCKMANAGERS
    ////////////////////
    
    @GetMapping("/stockmanagers")
    public String showAllStockmanagers(Model model){
        List<Stockmanager> stockmanagers = stockmanagerRepo.findAll();
        
        model.addAttribute("listOfStockmanagers", stockmanagers);
        
        return "manage-stockmanagers";
    
    }
    
    @GetMapping("/stockmanagers/create")
    public String showStockmanagerCreateUpdateForm(@ModelAttribute("stockmanagerToEdit") Stockmanager stockmanager, BindingResult result){
        
        return "create-update-stockmanager";
    }
    
    @GetMapping("/stockmanagers/delete")
    public String deleteStockmanager(@RequestParam("id") int id, RedirectAttributes attributes){
        
        Stockmanager stockmanager = stockmanagerRepo.findById(id).get();
        
        String successMessage = "Stockmanager "+ stockmanager.getUsername() +" successfully deleted!!";
        attributes.addFlashAttribute("successMessage", successMessage);
        
        stockmanagerRepo.deleteById(id);
        
        return "redirect:/admin/stockmanagers";
    }
    
    @GetMapping("/stockmanagers/update")
    public String showUpdateStockmanagerForm(@RequestParam("id") int id, Model model){
        
        Stockmanager stockmanager = stockmanagerRepo.findById(id).get();
        
        model.addAttribute("stockmanagerToEdit", stockmanager);
        
        return "create-update-stockmanager";
    }
 
    @PostMapping("/stockmanagers/update")
    public String updateCustomer(Stockmanager stockmanager, RedirectAttributes attributes){
       
        userService.saveStockmanager(stockmanager);
        
        String successMessage = "Stockmanager "+ stockmanager.getUsername()+" successfully updated!!";
        attributes.addFlashAttribute("successMessage", successMessage);
       
        return "redirect:/admin/stockmanagers";
    
    }
    
     ////////////////////
    //SERVICE AGENTS
    ////////////////////
    
      @GetMapping("/serviceagents")
    public String showAllServiceAgents(Model model){
        List<Customerserviceagent> serviceagents = customerServiceAgentRepo.findAll();
        
        model.addAttribute("listOfServiceagents", serviceagents);
        
        return "manage-serviceagents";
    
    }
    
    @GetMapping("/serviceagents/create")
    public String showServiceagentCreateUpdateForm(@ModelAttribute("serviceagentToEdit") Customerserviceagent serviceagent, BindingResult result){
        
        return "create-update-serviceagent";
    }
    
    @GetMapping("/serviceagents/delete")
    public String deleteServiceagent(@RequestParam("id") int id, RedirectAttributes attributes){
        
        Customerserviceagent serviceagent = customerServiceAgentRepo.findById(id).get();
        
        String successMessage = "Stockmanager "+ serviceagent.getUsername() +" successfully deleted!!";
        attributes.addFlashAttribute("successMessage", successMessage);
        
        stockmanagerRepo.deleteById(id);
        
        return "redirect:/admin/serviceagents";
    }
    
    @GetMapping("/serviceagents/update")
    public String showUpdateServiceagentForm(@RequestParam("id") int id, Model model){
        
        Customerserviceagent serviceagent = customerServiceAgentRepo.findById(id).get();
        
        model.addAttribute("serviceagentToEdit", serviceagent);
        
        return "create-update-serviceagent";
    }
 
    @PostMapping("/serviceagents/update")
    public String updateCustomer(Customerserviceagent serviceagent, RedirectAttributes attributes){
       
        userService.saveServiceagent(serviceagent);
        
        String successMessage = "Customer Service Agent "+ serviceagent.getUsername()+" successfully updated!!";
        attributes.addFlashAttribute("successMessage", successMessage);
       
        return "redirect:/admin/serviceagents";
    
    }
    
}
    

