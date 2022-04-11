package bookstore.controller;

import bookstore.entity.Cart;
import bookstore.entity.Cartitem;
import bookstore.entity.Customer;
import bookstore.entity.Visitor;
import bookstore.repo.CartRepo;
import bookstore.repo.CartitemRepo;
import bookstore.service.CartService;
import bookstore.service.PaymentService;
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
    CartRepo cartRepo;

    @Autowired
    CartService cartService;

    @Autowired
    CartitemRepo cartitemRepo;

    @Autowired
    PaymentService paymentService;

    @GetMapping
    public String showchargePage(@RequestParam(required = false, name = "shippingCost") String shippingCost,
            @ModelAttribute Customer customer, @ModelAttribute Visitor visitor, Model model, HttpSession session) {
        List<Cartitem> cart = (List<Cartitem>) session.getAttribute("cart");
        boolean containsOnlyEbook = cartService.cartContainsOnlyEbooks(cart);
        double shippingCostNumber = 0.0;
        double bookprice = paymentService.calculateBookPrice(cart);

        if (shippingCost != null) {
            shippingCostNumber = Double.parseDouble(shippingCost);

        }
        System.out.println(">>>>>>>Visitor to be sent to JSP=" + visitor);
        model.addAttribute("stripePublicKey", API_PUBLIC_KEY);
        model.addAttribute("amount", bookprice);
        model.addAttribute("customer", customer);
        model.addAttribute("visitor", visitor);
        model.addAttribute("shippingCost", shippingCostNumber);
        model.addAttribute("containsOnlyEbook", containsOnlyEbook);

        return "charge";
    }

    @PostMapping
    public String createCharge(@RequestParam(required = false, name = "shippingcost") String shipping,
            @RequestParam(required = false, name = "customer") String customerstring,
            @RequestParam(required = false, name = "visitor") String visitorstring,
            @RequestParam String token, String amount, String total, RedirectAttributes redirectAttributes,
            HttpSession session) {

        Customer customer = null;
        Visitor visitor = null;

        // Bookprice is divided by 100 and rounded because the price must be turned from
        // Cents to Euros.
        double bookprice = paymentService.roundDouble(Double.parseDouble(amount) / 100, 2);
        double totalamount = Double.parseDouble(total);
        double shippingcost = Double.parseDouble(shipping);
        LocalDateTime orderdatetime = LocalDateTime.now();
        List<Cartitem> shoppingCart = (List<Cartitem>) session.getAttribute("cart");

        System.out.println(
                ">>>>>>>>>>>>Total is: " + total + "Bookprice is: " + bookprice + " Shipping cost is: " + shipping);

        // Order object (Cart) must be constructed with available parameters.
        Cart cart = new Cart();

        cart.setDatetime(orderdatetime);
        cart.setBookprice(bookprice);
        cart.setShippingcost(shippingcost);
        cart.setTotalprice(totalamount);
        // Setting CartItemList for db insertion later
        cart.setCartitemList(shoppingCart);

        // If visitorstring is empty, it means a customer made the order, therefore
        // charge the customer.
        if (visitorstring == "") {

            customer = paymentService.chargeCustomer(customerstring, totalamount, cart, token);

        } else {

            visitor = paymentService.chargeVisitor(visitorstring, totalamount, cart, token);

        }

        if (token == null) {
            redirectAttributes.addAttribute("message", "Stripe payment token is missing. please try again later.");
        }

        System.out.println("Order details: " + cart.toString());

        // Save order to db
        cartRepo.save(cart);

        // save all cartitems to db
        for (Cartitem item : cart.getCartitemList()) {

            item.setCart(cart);
            cartitemRepo.save(item);
        }

        redirectAttributes.addAttribute("message",
                "Successfully paid amount: " + paymentService.roundDouble(totalamount, 2));
        redirectAttributes.addAttribute("customer", customer);
        redirectAttributes.addAttribute("visitor", visitor);
        redirectAttributes.addAttribute("shippingCost", cart.getShippingcost());

        return "redirect:/payment/complete";
    }

    @GetMapping("/complete")
    public String showOrderCompletedPage(@ModelAttribute Customer customer, @ModelAttribute Visitor visitor,
            @RequestParam("message") String message,
            @RequestParam(required = false, name = "shippingCost") String shipping, Model model, HttpSession session) {
        double shippingCost = Double.parseDouble(shipping);
        List<Cartitem> shoppingCart = (List<Cartitem>) session.getAttribute("cart");
        HashMap<Cartitem, String> ebooks = new HashMap();

        // This method checks if there are ebooks in the shopping cart, and puts them,
        // along with their download links, into a map.
        ebooks = cartService.getEbookDownloadLinks(shoppingCart);

        model.addAttribute("message", message);
        model.addAttribute("customer", customer);
        model.addAttribute("visitor", visitor);

        model.addAttribute("ebooks", ebooks);
        model.addAttribute("shippingCost", shippingCost);
        // need to add order details
        // need to add link to ebook, if ordered book is ebook.
        return "order-completed";
    }

}
