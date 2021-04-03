package bookstore.controller;

import bookstore.entity.Country;
import bookstore.entity.Customer;
import bookstore.repo.CountryRepo;
import bookstore.service.UserService;
import java.util.List;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class RegistrationController {
    
    @Autowired
    UserService userService;
    
    @Autowired
    CountryRepo countryRepo;
    
    
    @GetMapping("/register")
    public String showRegisterForm(@ModelAttribute("customer") Customer newcustomer, Model model){
        
        List<Country> countries = countryRepo.findAll();
        
        model.addAttribute("countries", countries);
        
        return "register";
    }
    
    @PostMapping("/register")
    public String register(@Valid @ModelAttribute("customer") Customer newcustomer, BindingResult result
            , RedirectAttributes attributes
    ){
        
        //If there is a problem, show registration form again
        if(result.hasErrors()){
            return "register-form";
        }
        
        //save customer  to DB
        userService.saveCustomer(newcustomer);
        
        //redirect and add attribute to request
        attributes.addFlashAttribute("registered", "Successfully registered");
        
        return "redirect:/login";
    }
}
