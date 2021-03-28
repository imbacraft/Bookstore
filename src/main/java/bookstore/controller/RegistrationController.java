package bookstore.controller;

import bookstore.entity.Customer;
import bookstore.service.UserService;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class RegistrationController {
    
    @Autowired
    UserService userService;
    
    @GetMapping("/register")
    public String showRegisterForm(@ModelAttribute("customer") Customer newcustomer){
        return "register-form";
    }
    
    @PostMapping("/register")
    public String register(@Valid @ModelAttribute("customer") Customer newcustomer, BindingResult result
            , RedirectAttributes attributes
    ){
        
        //If there is a problem, show registration form again
        if(result.hasErrors()){
            return "register-form";
        }
        
//        System.out.println(">>>>> customer:"+ newcustomer);
        
        //save customer  to DB
        userService.saveUser(newcustomer);
        
        //redirect and add attribute to request
        attributes.addFlashAttribute("registered", "Successfully registered");
        
        return "redirect:/login";
    }
}
