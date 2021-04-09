/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bookstore.service;

import bookstore.entity.Book;
import bookstore.entity.Bookdetails;
import bookstore.entity.Cartitem;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author Dell
 */
@Service
@Transactional
public class CartService {
    
    //This method checks if there are ebooks in the shopping cart, and puts them, along with their download links, into a map.
    public HashMap<Cartitem, String> getEbookDownloadLinks(List<Cartitem> cart) {
        String downloadURL = "https://peoplecertproject.s3.eu-central-1.amazonaws.com/git.txt";
        HashMap<Cartitem, String> ebooks = new HashMap();

        //  (4) is the number of ebook format in the DB.
        // for every ebook, put it with its download link in a new map.
        for (Cartitem item : cart) {

            if (item.getBookdetails().getFormat().getFormatid() == 4) {

                ebooks.put(item, downloadURL);

            }

        }
        return ebooks;
    }
    
 public boolean cartContainsOnlyEbooks(List<Cartitem> cart){
        List<Cartitem> ebooks = new ArrayList<>();
     
        for (Cartitem item : cart) {

            if (item.getBookdetails().getFormat().getFormatid() == 4) {

                ebooks.add(item);

            }
        }
   if (ebooks.size() == cart.size()){
    
    return true;
    
    } else {
   
   return false;
   }        
            
 }
 
 public List<Cartitem> createOrUpdateCart(HttpSession session, Bookdetails book, int id, int formatid){
     List<Cartitem> cart;
     
       if (session.getAttribute("cart") == null) {

            //Create cart
             cart = new ArrayList<>();

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

            cart = (List<Cartitem>) session.getAttribute("cart");

            int index = this.getBookIndex(id, formatid, cart);

            if (index == -1) {

                //create cartitem
                Cartitem cartitem = new Cartitem();
                cartitem.setBookdetails(book);
                cartitem.setQuantity(1);

                System.out.println("BookperCart to be added is :" + cartitem.toString());

                cart.add(cartitem);

            } else {
                
                //if book is not an ebook, increase quantity by 1
                if(book.getFormat().getFormatid() !=4 ){
                int quantity = cart.get(index).getQuantity() + 1;
                cart.get(index).setQuantity(quantity);
                }
            }

}
        return cart;
 
}
 
 public double calculateShippingCost(String delivery){
     
     double shippingCost;
     
     if (delivery.equals("standard")) {

            shippingCost = 15.00;

        } else {

            shippingCost = 35.00;

        }
        return shippingCost;
 
 }
 
 //This method gets a Bookid and finds at which index position the book stands in Cart list.
    //If the book doesnt exist in the cart, returns -1.
    public  int getBookIndex(int id, int format, List<Cartitem> cart) {

        for (int i = 0; i < cart.size(); i++) {

            if (id == cart.get(i).getBookdetails().getBook().getBookid()
                    && format == cart.get(i).getBookdetails().getFormat().getFormatid()) {
                return i;
            }
        }

        return -1;
    }
}
