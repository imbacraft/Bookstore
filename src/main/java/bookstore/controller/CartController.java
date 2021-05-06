/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bookstore.controller;

import bookstore.entity.Author;
import bookstore.entity.Bookdetails;
import bookstore.entity.Cartitem;
import bookstore.entity.Category;
import bookstore.entity.Country;
import bookstore.entity.Customer;
import bookstore.entity.Role;
import bookstore.entity.Visitor;
import bookstore.repo.AuthorRepo;
import bookstore.repo.BookdetailsRepo;
import bookstore.repo.CategoryRepo;
import bookstore.repo.CountryRepo;
import bookstore.repo.RoleRepo;
import bookstore.repo.VisitorRepo;
import bookstore.service.CartService;
import bookstore.service.UserService;
import java.security.Principal;
import java.util.List;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

/**
 *
 * @author Dell
 */
@Controller
@RequestMapping("/cart")
public class CartController {

    @Autowired
    BookdetailsRepo bookdetailsRepo;

    @Autowired
    CountryRepo countryRepo;

    @Autowired
    UserService userService;

    @Autowired
    VisitorRepo visitorRepo;

    @Autowired
    RoleRepo roleRepo;

    @Autowired
    CartService cartService;
    
    @Autowired
    CategoryRepo categoryRepo;
    
    @Autowired
    AuthorRepo authorRepo;

    @GetMapping("/index")
    public String showCart(Model model) {
        //all categories--for menu
        List<Category> categories = categoryRepo.findAll();
        
        //all authors-- for menu
        List<Author> allAuthors = authorRepo.findAll();
        
        model.addAttribute("categories", categories);
        model.addAttribute("authors", allAuthors);
        
        return "cart";

    }

    @PostMapping("/index")
    public String increaseQuantity(@RequestParam("bookid") String bookid, @RequestParam("formatid") String formatid, @RequestParam("quantity") String quantity, HttpSession session) {
        int updatedquantity = Integer.parseInt(quantity);
        int id = Integer.parseInt(bookid);
        int format = Integer.parseInt(formatid);

        List<Cartitem> cart = (List<Cartitem>) session.getAttribute("cart");

        //find where the book to be updated stands in cart index.
        int index = cartService.getBookIndex(id, format, cart);

        cart.get(index).setQuantity(updatedquantity);

        session.setAttribute("cart", cart);
        return "redirect:/cart/index";
    }

    @GetMapping("/buy/{id}")
    public String buyBook(@PathVariable("id") Integer id, @RequestParam("format") String format, HttpSession session) {

        int formatid = Integer.parseInt(format);

        //get book from db by id and format
        Bookdetails book = bookdetailsRepo.findByBookidandFormatid(id, formatid);

        //create or update cart, based on the book added to cart.
        List<Cartitem> cart = cartService.createOrUpdateCart(session, book, id, formatid);

        session.setAttribute("cart", cart);

        return "redirect:/cart/index";
    }

    @GetMapping("/remove/{id}/{format}")
    public String remove(@PathVariable("id") int id, @PathVariable("format") int format, HttpSession session) {

        List<Cartitem> cart = (List<Cartitem>) session.getAttribute("cart");
        int index = cartService.getBookIndex(id, format, cart);
        cart.remove(index);

        session.setAttribute("cart", cart);
        return "redirect:/cart/index";
    }

    @GetMapping("/address")
    public String showAddressPage(Model model, Principal principal, HttpSession session, RedirectAttributes redirectAttributes) {

        Customer customer = null;
        List<Cartitem> cart = (List<Cartitem>) session.getAttribute("cart");
        
        //menu tabs
        List<Category> categories = categoryRepo.findAll();
        List<Author> allAuthors = authorRepo.findAll();

        //check if cart contains only ebook, in order to judge if delivery options are required info.
        boolean containsOnlyEbook = cartService.cartContainsOnlyEbooks(cart);

        if (principal != null) {

            customer = userService.findCustomerByUsername(principal.getName());
        }

        List<Country> countries = countryRepo.findAll();

        model.addAttribute("countries", countries);
         model.addAttribute("categories", categories);
        model.addAttribute("authors", allAuthors);

        model.addAttribute("customer", customer);
        model.addAttribute("containsOnlyEbook", containsOnlyEbook);

        if (containsOnlyEbook == true && customer != null) {

            redirectAttributes.addAttribute("customer", customer);
            return "redirect:/payment";

        }

        if (cart.size() == 0) {

            return "redirect:/cart/index";
        }

        return "address";
    }

    @PostMapping("/address")
    public String proccessAddressDetails(@RequestParam(required = false, name = "delivery") String delivery,
            @RequestParam(required = false, name = "firstname") String firstname,
            @RequestParam(required = false, name = "lastname") String lastname,
            @RequestParam(required = false, name = "email") String email,
            @RequestParam(required = false, name = "phone") String phone,
            @RequestParam(required = false, name = "country") String country,
            @RequestParam(required = false, name = "city") String city,
            @RequestParam(required = false, name = "street") String street,
            @RequestParam(required = false, name = "streetnumber") String streetnr,
            @RequestParam(required = false, name = "postalcode") String postal,
            RedirectAttributes redirectAttributes, Principal principal, HttpSession session) {

        double shippingCost = 0.0;
        Visitor visitor = null;
        List<Cartitem> cart = (List<Cartitem>) session.getAttribute("cart");

        //Check if user is Customer or Visitor
        if (principal != null) {

            Customer customer = userService.findCustomerByUsername(principal.getName());
            redirectAttributes.addAttribute("customer", customer);

        } else {

            //this query has denied access for some reason
//            visitor = visitorRepo.findVisitorByEmail(email);
            Role role = roleRepo.findById(5).get();
            long phonenumber = Long.parseLong(phone);


            if (cartService.cartContainsOnlyEbooks(cart) == false) {

                int countryid = Integer.parseInt(country);
                int streetnumber = Integer.parseInt(streetnr);
                int postalcode = Integer.parseInt(postal);

                Country visitorCountry = countryRepo.findById(countryid).get();

                visitor = new Visitor(firstname, lastname, email, visitorCountry, city, street, streetnumber, postalcode, phonenumber, role);

            } else {

                visitor = new Visitor(firstname, lastname, email, phonenumber, role);
            }
            visitorRepo.save(visitor);
            System.out.println(">>>>>>Visitor to be added to DB: " + visitor);

            //save visitor to DB before passing to JSP
            redirectAttributes.addFlashAttribute("visitor", visitor);

        }

        //set shipping cost
        if (delivery != null) {

            shippingCost = cartService.calculateShippingCost(delivery);

        }
        redirectAttributes.addAttribute("shippingCost", shippingCost);

        return "redirect:/payment";
    }

}
