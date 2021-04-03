/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bookstore.controller;

import bookstore.entity.Book;
import bookstore.entity.Bookpercart;
import bookstore.repo.BookRepo;
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

    @GetMapping("/index")
    public String showCart() {

        return "cart-index";

    }
    
    
    //For some reason this method doesn't work
    @PostMapping("/index")
    public String increaseQuantity(@RequestParam("bookid") String bookid, @RequestParam("quantity") String quantity, HttpSession session) {
        int updatedquantity = Integer.parseInt(quantity);
        int id = Integer.parseInt(bookid);
        
        List<Bookpercart> cart = (List<Bookpercart>) session.getAttribute("cart");
        
        cart.get(id).setQuantity(updatedquantity);
        
        session.setAttribute("cart", cart);
        return "redirect:/cart/index";
    }

    @GetMapping("/buy/{id}")
    public String buyBook(@PathVariable("id") Integer id, HttpSession session) {
        //get book from db by id
        Book book = bookRepo.getOne(id);

        System.out.println(book);
        
        if (session.getAttribute("cart") == null) {

            //Create cart
            List<Bookpercart> cart = new ArrayList<>();

            //create bookpercart
            Bookpercart bookpercart = new Bookpercart();
            bookpercart.setBook(book);
            bookpercart.setQuantity(1);
            
            System.out.println("BookperCart to be added is :"+ bookpercart.toString());
            
            //add bookpercart to cart
            cart.add(bookpercart);

            
            
            //set cart as session attribute
            session.setAttribute("cart", cart);

        } else {

            List<Bookpercart> cart = (List<Bookpercart>) session.getAttribute("cart");

            int index = this.exists(id, cart);

            if (index == -1) {

                //create bookpercart
                Bookpercart bookpercart = new Bookpercart();
                bookpercart.setBook(book);
                bookpercart.setQuantity(1);
                
                System.out.println("BookperCart to be added is :"+ bookpercart.toString());

                cart.add(bookpercart);
                


            } else {

                int quantity = cart.get(index).getQuantity() + 1;
                cart.get(index).setQuantity(quantity);
            }
            
             System.out.println("Cart has "+ cart.toString());
             
            session.setAttribute("cart", cart);

        }
        return "redirect:/cart/index";
    }

    @GetMapping("/remove/{id}")
    public String remove(@PathVariable("id") int id, HttpSession session) {
        
        List<Bookpercart> cart = (List<Bookpercart>) session.getAttribute("cart");
        int index = this.exists(id, cart);
        cart.remove(index);
        
        session.setAttribute("cart", cart);
        return "redirect:/cart/index";
    }
    
    
    

    private int exists(int id, List<Bookpercart> cart) {
        for (int i = 0; i < cart.size(); i++) {
            if (id == cart.get(i).getBook().getBookid()) {
                return i;
            }
        }
        return -1;
    }

}
