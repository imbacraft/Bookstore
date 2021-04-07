/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bookstore.controller;

import bookstore.entity.Book;
import bookstore.entity.Bookdetails;
import bookstore.entity.Cartitem;
import bookstore.repo.BookRepo;
import bookstore.repo.BookdetailsRepo;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

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

    @GetMapping("/buy/{id}/{format}")
    public String buyBook(@PathVariable("id") Integer id, @PathVariable("format") Integer format, HttpSession session) {
        //get book from db by id
      
        Bookdetails book = bookdetailsRepo.findByBookidandFormatid(id, format);
        

        System.out.println(book);
        
        if (session.getAttribute("cart") == null) {

            //Create cart
            List<Cartitem> cart = new ArrayList<>();

            //create cartitem
            Cartitem cartitem = new Cartitem();
            cartitem.setBookdetails(book);
            cartitem.setQuantity(1);
            
            System.out.println("Cartitem to be added is :"+ cartitem.toString());
            
            //add cartitem to cart
            cart.add(cartitem);
            
            //set cart as session attribute
            session.setAttribute("cart", cart);

        } else {

            List<Cartitem> cart = (List<Cartitem>) session.getAttribute("cart");

            int index = this.getBookIndex(id, format, cart);

            if (index == -1) {

                //create cartitem
                Cartitem cartitem = new Cartitem();
                cartitem.setBookdetails(book);
                cartitem.setQuantity(1);
                
                System.out.println("BookperCart to be added is :"+ cartitem.toString());

                cart.add(cartitem);
                


            } else {

                int quantity = cart.get(index).getQuantity() + 1;
                cart.get(index).setQuantity(quantity);
            }
            
             System.out.println("Cart has "+ cart.toString());
             
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
    
    
    
    //This method gets a Bookid and finds at which index position the book stands in Cart list.
    //If the book doesnt exist in the cart, returns -1.
    private int getBookIndex(int id, int format, List<Cartitem> cart) {
        
        for (int i = 0; i < cart.size(); i++) {
            
            if (id == cart.get(i).getBookdetails().getBook().getBookid()
                    
                    && format == cart.get(i).getBookdetails().getFormat().getFormatid()
                    ) {
                return i;
            }
        }
        
        return -1;
    }

}
