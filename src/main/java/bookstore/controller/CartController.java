/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bookstore.controller;

import bookstore.entity.Book;
import bookstore.entity.Bookdetails;
import bookstore.entity.Cartitem;
import bookstore.entity.Country;
import bookstore.entity.Customer;
import bookstore.entity.Role;
import bookstore.entity.Visitor;
import bookstore.repo.BookRepo;
import bookstore.repo.BookdetailsRepo;
import bookstore.repo.CountryRepo;
import bookstore.repo.CustomerRepo;
import bookstore.repo.RoleRepo;
import bookstore.repo.VisitorRepo;
import bookstore.service.UserService;
import java.security.Principal;
import java.util.ArrayList;
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
    BookRepo bookRepo;

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

    @GetMapping("/index")
    public String showCart() {

        return "cart-index";

    }

    @PostMapping("/index")
    public String increaseQuantity(@RequestParam("bookid") String bookid, @RequestParam("formatid") String formatid, @RequestParam("quantity") String quantity, HttpSession session) {
        int updatedquantity = Integer.parseInt(quantity);
        int id = Integer.parseInt(bookid);
        int format = Integer.parseInt(formatid);

        List<Cartitem> cart = (List<Cartitem>) session.getAttribute("cart");

        int index = this.getBookIndex(id, format, cart);

        cart.get(index).setQuantity(updatedquantity);

        session.setAttribute("cart", cart);
        return "redirect:/cart/index";
    }

    @GetMapping("/buy/{id}")
    public String buyBook(@PathVariable("id") Integer id, @RequestParam("format") String format, HttpSession session) {

        System.out.println("Format is : " + format);

        int formatid = Integer.parseInt(format);

        //get book from db by id and format
        Bookdetails book = bookdetailsRepo.findByBookidandFormatid(id, formatid);

        System.out.println(book);

        if (session.getAttribute("cart") == null) {

            //Create cart
            List<Cartitem> cart = new ArrayList<>();

            //create cartitem
            Cartitem cartitem = new Cartitem();
            cartitem.setBookdetails(book);
            cartitem.setQuantity(1);

            System.out.println("Cartitem to be added is :" + cartitem.toString());

            //add cartitem to cart
            cart.add(cartitem);

            //set cart as session attribute
            session.setAttribute("cart", cart);

        } else {

            List<Cartitem> cart = (List<Cartitem>) session.getAttribute("cart");

            int index = this.getBookIndex(id, formatid, cart);

            if (index == -1) {

                //create cartitem
                Cartitem cartitem = new Cartitem();
                cartitem.setBookdetails(book);
                cartitem.setQuantity(1);

                System.out.println("BookperCart to be added is :" + cartitem.toString());

                cart.add(cartitem);

            } else {

                int quantity = cart.get(index).getQuantity() + 1;
                cart.get(index).setQuantity(quantity);
            }

            System.out.println("Cart has " + cart.toString());

            session.setAttribute("cart", cart);

        }
        return "redirect:/cart/index";
    }

    @GetMapping("/remove/{id}/{format}")
    public String remove(@PathVariable("id") int id, @PathVariable("format") int format, HttpSession session) {

        List<Cartitem> cart = (List<Cartitem>) session.getAttribute("cart");
        int index = this.getBookIndex(id, format, cart);
        cart.remove(index);

        session.setAttribute("cart", cart);
        return "redirect:/cart/index";
    }

    @GetMapping("/address")
    public String showAddressPage(Model model, Principal principal, HttpSession session, RedirectAttributes redirectAttributes) {

        Customer customer = null;

        //check if cart contains only ebook, in order to judge if delivery options are required info.
        boolean containsOnlyEbook = false;
        List<Cartitem> cart = (List<Cartitem>) session.getAttribute("cart");
        for (Cartitem item : cart) {

            if (item.getBookdetails().getFormat().getName().equalsIgnoreCase("ebook") && cart.size() == 1) {

                containsOnlyEbook = true;

            }

        }

        if (principal != null) {

            customer = userService.findCustomerByUsername(principal.getName());
        }

        List<Country> countries = countryRepo.findAll();

        model.addAttribute("countries", countries);

        model.addAttribute("customer", customer);
        model.addAttribute("containsOnlyEbook", containsOnlyEbook);

        if (containsOnlyEbook == true && customer != null) {

            redirectAttributes.addAttribute("customer", customer);
            return "redirect:/payment";

        } else {

            return "address";
        }

    }

    @PostMapping("/address")
    public String getAddressDetails(@RequestParam("delivery") String delivery,
            @RequestParam(required = false, name = "firstname") String firstname,
            @RequestParam(required = false, name = "lastname") String lastname,
            @RequestParam(required = false, name = "email") String email,
            @RequestParam(required = false, name = "phone") String phone,
            @RequestParam(required = false, name = "country") String country,
            @RequestParam(required = false, name = "city") String city,
            @RequestParam(required = false, name = "street") String street,
            @RequestParam(required = false, name = "streetnumber") String streetnr,
            @RequestParam(required = false, name = "postalcode") String postal,
            RedirectAttributes redirectAttributes, Principal principal) {

        double shippingCost;
        Visitor visitor = null;

        //Check if user is Customer or Visitor
        if (principal != null) {

            Customer customer = userService.findCustomerByUsername(principal.getName());
            redirectAttributes.addAttribute("customer", customer);

        } else {
            visitor = visitorRepo.findVisitorByEmail(email);
            
            if (visitor == null) {

                int countryid = Integer.parseInt(country);
                int streetnumber = Integer.parseInt(streetnr);
                int postalcode = Integer.parseInt(postal);
                int phonenumber = Integer.parseInt(phone);
                Country visitorCountry = countryRepo.findById(countryid).get();
                Role role = roleRepo.findById(5).get();
                visitor = new Visitor(firstname, lastname, email, visitorCountry, city, street, streetnumber, postalcode, phonenumber, role);
                
                visitorRepo.save(visitor);
            }

            System.out.println(">>>>>>Visitor to be added to DB: " + visitor);

            //save visitor to DB before passing to JSP
            
            redirectAttributes.addAttribute("visitor", visitor);

        }

        //set shipping cost
        if (delivery.equals("standard")) {

            shippingCost = 15.00;

        } else {

            shippingCost = 35.00;

        }
        redirectAttributes.addAttribute("shippingCost", shippingCost);

        return "redirect:/payment";
    }

    //This method gets a Bookid and finds at which index position the book stands in Cart list.
    //If the book doesnt exist in the cart, returns -1.
    private int getBookIndex(int id, int format, List<Cartitem> cart) {

        for (int i = 0; i < cart.size(); i++) {

            if (id == cart.get(i).getBookdetails().getBook().getBookid()
                    && format == cart.get(i).getBookdetails().getFormat().getFormatid()) {
                return i;
            }
        }

        return -1;
    }

}
