/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bookstore.service;

import bookstore.entity.Cart;
import bookstore.entity.Cartitem;
import bookstore.entity.Customer;
import bookstore.entity.Visitor;
import bookstore.repo.CustomerRepo;
import bookstore.repo.VisitorRepo;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author Dell
 */
@Transactional
@Service
public class PaymentService {

    @Autowired
    CustomerRepo customerRepo;

    @Autowired
    VisitorRepo visitorRepo;

    @Autowired
    StripeService stripeService;

    public double calculateBookPrice(List<Cartitem> cart) {

        double amount = 0;

        for (Cartitem item : cart) {

            //Amount must be multiplied by 100 because Stripe.com requires amount in cents (Ex. 48,51 Euro = 4851 cents).
            amount += item.getBookdetails().getPrice() * item.getQuantity() * 100;

        }

        //amount is rounded to correct java double primitive malfunctions
        double roundedamount = this.roundDouble(amount, 2);

        System.out.println(">>>>>>>>>>>>>>>Bookprice is: " + roundedamount + " Cents");

        return roundedamount;

    }

    public Customer chargeCustomer(String customerstring, double totalamount, Cart cart, String token) {
        Customer customer;
        String stripeCustomerID = "";
        String chargeId;

        int customerid = Integer.parseInt(customerstring);
        customer = customerRepo.findById(customerid).get();

        //First create Customer account in Stripe.com (Optional).
        //Check if email contains ".", as in hotmail.com, gmail.com, because Stripe rejects customer accountemails without .com, .gr etc endings.
        if (customer.getEmail().contains(".") == true) {
            stripeCustomerID = stripeService.createCustomer(customer.getEmail(), token);
            //Second, charge that account.
            chargeId = stripeService.createChargeForStripeCustomer(customer.getEmail(), totalamount, stripeCustomerID);
        }
        
        //if email is not a valid email, charge anyway
        chargeId = stripeService.createChargeForSimpleEmail(customer.getEmail(), totalamount, token);

        cart.setCustomer(customer);

        return customer;
    }

    public Visitor chargeVisitor(String visitorstring, double totalamount, Cart cart, String token) {
        Visitor visitor;
        String stripeCustomerID = "";
        String chargeId;
        System.out.println("Visitorstring is: "+ visitorstring);
        int visitorid = Integer.parseInt(visitorstring);
        
        System.out.println("Visitor INTEGER is :" + visitorid);
        visitor = visitorRepo.getOne(visitorid);

        //First create Customer account in Stripe.com (Optional).
        //Check if email contains ".", as in hotmail.com, gmail.com, because Stripe rejects customer accountemails without .com, .gr etc endings.
        if (visitor.getEmail().contains(".") == true) {
            stripeCustomerID = stripeService.createCustomer(visitor.getEmail(), token);
            //Second, charge that account.
            chargeId = stripeService.createChargeForStripeCustomer(visitor.getEmail(), totalamount, stripeCustomerID);
        }

        //if email is not a valid email, charge anyway
        chargeId = stripeService.createChargeForSimpleEmail(visitor.getEmail(), totalamount, token);
        
        cart.setVisitor(visitor);

        return visitor;
    }

//This method rounds a double, to max digits of places parameter.
    public double roundDouble(double value, int places) {
        if (places < 0) {
            throw new IllegalArgumentException();
        }

        long factor = (long) Math.pow(10, places);
        value = value * factor;
        long tmp = Math.round(value);
        return (double) tmp / factor;
    }

}
