package bookstore.controller;

import bookstore.entity.Bookdetails;
import bookstore.entity.Cart;
import bookstore.entity.Cartitem;
import bookstore.entity.Customer;
import bookstore.entity.Visitor;
import bookstore.repo.CartRepo;
import bookstore.repo.CartitemRepo;
import bookstore.repo.CustomerRepo;
import bookstore.repo.VisitorRepo;
import bookstore.service.StripeService;
import java.time.LocalDateTime;
import java.util.HashMap;
import java.util.List;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("/payment")
public class PaymentController {

    @Value("${STRIPE_PUBLIC_KEY}")
    private String API_PUBLIC_KEY;

    @Autowired
    StripeService stripeService;

    @Autowired
    CustomerRepo customerRepo;

    @Autowired
    VisitorRepo visitorRepo;
    
    @Autowired
    CartRepo cartRepo;
    
    @Autowired
    CartitemRepo cartitemRepo;

    public PaymentController(StripeService stripeService) {
        this.stripeService = stripeService;
    }

    @GetMapping
    public String showchargePage(@RequestParam("shippingCost") String shippingCost, @ModelAttribute Customer customer, @ModelAttribute Visitor visitor, Model model, HttpSession session) {

        double shippingCostNumber = Double.parseDouble(shippingCost);
        List<Cartitem> cart = (List<Cartitem>) session.getAttribute("cart");

        double amount = 0;

        for (Cartitem item : cart) {

            amount += item.getBookdetails().getPrice() * item.getQuantity();

        }

        //Amount is rounded and multiplied by 100 because Stripe.com requires amount in cents (Ex. 48,51 Euro = 4851 cents).
        double roundedamount = this.round(amount, 2) * 100;

        System.out.println(">>>>>>>>>>>>>>>Bookprice is: " + this.round(roundedamount, 0) + " Cents");

        model.addAttribute("stripePublicKey", API_PUBLIC_KEY);
        model.addAttribute("amount", this.round(roundedamount, 0));
        model.addAttribute("customer", customer);
        model.addAttribute("visitor", visitor);
        
        System.out.println("Shippingcost to be sent to JSP: "+ shippingCostNumber);
        model.addAttribute("shippingCost", shippingCostNumber);

        return "charge";
    }

    @PostMapping
    public String createCharge(@RequestParam(required=false, name="shippingcost") String shipping, @RequestParam(required = false, name="customer") String customerstring, @RequestParam(required = false, name="visitor") String visitorstring, 
            @RequestParam String token, String amount, String total, RedirectAttributes redirectAttributes, HttpSession session) {
        
        System.out.println(">>>>>>>>>>>>Total is: "+ total + "Bookprice is: "+ amount + " Shipping cost is: "+ shipping);
        List<Cartitem> shoppingCart = (List<Cartitem>) session.getAttribute("cart");
        double bookprice = Double.parseDouble(amount) /100;
        double totalamount = Double.parseDouble(total);
        double shippingcost = Double.parseDouble(shipping);
        String stripeCustomerID;
        String chargeId;
        Customer customer = null;
         Visitor visitor = null;
         LocalDateTime orderdatetime = LocalDateTime.now();
         
         Cart cart = new Cart();
         
         cart.setDatetime(orderdatetime);
         cart.setBookprice(bookprice);
         cart.setShippingcost(shippingcost);
         cart.setTotalprice(totalamount);
         
         
         //Setting CartItemList for db insertion
         cart.setCartitemList(shoppingCart); 

        

        if (visitorstring == "") {
            int customerid = Integer.parseInt(customerstring);
            customer = customerRepo.findById(customerid).get();

            //First create Customer account in Stripe.com (Optional).
            stripeCustomerID = stripeService.createCustomer(customer.getEmail(), token);

            //Second, charge that account.
            chargeId = stripeService.createCharge(customer.getEmail(), totalamount, stripeCustomerID);
            
            cart.setCustomer(customer);
            cart.setPayment(chargeId);
            
        } else {

            int visitorid = Integer.parseInt(visitorstring);
            visitor = visitorRepo.findById(visitorid).get();
             //First create Customer account in Stripe.com (Optional).
            stripeCustomerID = stripeService.createCustomer(visitor.getEmail(), token);

            //Second, charge that account.
            chargeId = stripeService.createCharge(visitor.getEmail(), totalamount, stripeCustomerID);
            cart.setVisitor(visitor);
            cart.setPayment(chargeId);
            
        }

        if (token == null) {
            redirectAttributes.addAttribute("message", "Stripe payment token is missing. please try again later.");
        }

        if (chargeId == null) {
            redirectAttributes.addAttribute("message", "An error accurred while trying to charge.");
        }

       
        
        //Save order to db
        cartRepo.save(cart);
        

       //save cartitem to db
        for (Cartitem item : cart.getCartitemList()){
            
            item.setCart(cart);
             cartitemRepo.save(item);
        }
        
       
        redirectAttributes.addAttribute("message", "Successfully paid amount: " + this.round(totalamount,2) + " \u20ac. <br> Your charge id in Stripe.com is: " + chargeId);
        redirectAttributes.addAttribute("customer", customer);
        redirectAttributes.addAttribute("visitor", visitor);
        redirectAttributes.addAttribute("shippingCost", cart.getShippingcost());

        return "redirect:/payment/complete";
    }

    @GetMapping("/complete")
    public String showOrderCompletedPage(@ModelAttribute Customer customer, @ModelAttribute Visitor visitor, @RequestParam("message") String message,@RequestParam("shippingCost") String shipping, Model model, HttpSession session) {
        double shippingCost = Double.parseDouble(shipping);
        String downloadURL = "https://peoplecertproject.s3.eu-central-1.amazonaws.com/git.txt";
        
        //check if there are ebooks in the shopping cart, so that I pass the links to download them to the JSP.
        List<Cartitem> shoppingCart = (List<Cartitem>) session.getAttribute("cart");
        HashMap<Cartitem,String> ebooks = new HashMap();
        
        //  (4) is the number of ebook format in the DB.
        // for every ebook, put it with its download link in a new map.
        for (Cartitem item : shoppingCart){
        
        if (item.getBookdetails().getFormat().getFormatid()==4){
        
            ebooks.put(item, downloadURL);
        
        }
        
        }
        
        System.out.println(">>>>>>>>>>>>>>>Customer is: "+ customer+ "Visitor is : "+ visitor + " Shipping cost is: "+ shippingCost);
        
        model.addAttribute("message", message);
        model.addAttribute("customer", customer);
        model.addAttribute("visitor", visitor);
        model.addAttribute("shippingCost", shippingCost);
        model.addAttribute("ebooks", ebooks );

        //need to add order details
        //need to add link to ebook, if ordered book is ebook.
        return "order-completed";
    }

    public double round(double value, int places) {
        if (places < 0) {
            throw new IllegalArgumentException();
        }

        long factor = (long) Math.pow(10, places);
        value = value * factor;
        long tmp = Math.round(value);
        return (double) tmp / factor;
    }
}
