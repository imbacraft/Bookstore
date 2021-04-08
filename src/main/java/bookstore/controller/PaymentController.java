package bookstore.controller;

import bookstore.entity.Bookdetails;
import bookstore.entity.Cartitem;
import bookstore.entity.Customer;
import bookstore.repo.CustomerRepo;
import bookstore.service.StripeService;
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

    public PaymentController(StripeService stripeService) {
        this.stripeService = stripeService;
    }

    @GetMapping
    public String showchargePage(@ModelAttribute Customer customer, Model model, HttpSession session) {

        List<Cartitem> cart = (List<Cartitem>) session.getAttribute("cart");

        double amount = 0;

        for (Cartitem item : cart) {

            amount += item.getBookdetails().getPrice() * item.getQuantity();

        }

        //Amount is rounded and multiplied by 100 because Stripe.com requires amount in cents (Ex. 48,51 Euro = 4851 cents).
        double roundedamount = this.round(amount, 2) * 100;

        System.out.println(">>>Amount to be payed: " + this.round(roundedamount, 0) + " Cents");

        model.addAttribute("stripePublicKey", API_PUBLIC_KEY);
        model.addAttribute("amount", this.round(roundedamount, 0));
        model.addAttribute("customer", customer);

        return "charge";
    }

    @PostMapping
    public String createCharge(@RequestParam String customerid, @RequestParam String email, String token, String amount, RedirectAttributes redirectAttributes) {

        int intcustomerid = Integer.parseInt(customerid);
        double totalamount = Double.parseDouble(amount) / 100;

        Customer customer = customerRepo.findById(intcustomerid).get();

        //First create Customer account in Stripe.com (Optional).
        String stripeCustomerID = stripeService.createCustomer(email, token);

        //Second, charge that account.
        String chargeId = stripeService.createCharge(email, totalamount, stripeCustomerID);

        System.out.println("email: " + email + " Token: " + token);

        if (token == null) {
            redirectAttributes.addAttribute("message", "Stripe payment token is missing. please try again later.");
        }

        if (chargeId == null) {
            redirectAttributes.addAttribute("message", "An error accurred while trying to charge.");
        }

        // You may want to store charge id along with order information
        redirectAttributes.addAttribute("message", "Successfully paid amount: " + totalamount + " \u20ac. <br> Your charge id in Stripe.com is: " + chargeId);
        redirectAttributes.addAttribute("customer", customer);

        return "redirect:/payment/complete";
    }

    @GetMapping("/complete")
    public String showOrderCompletedPage(@ModelAttribute Customer customer, @RequestParam("message") String message, Model model) {

        model.addAttribute("message", message);

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
