package bookstore.service;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import com.stripe.Stripe;
import com.stripe.model.Charge;
import com.stripe.model.Customer;
import com.stripe.model.CustomerCollection;
import java.util.List;

@Service
public class StripeService {

    @Value("${STRIPE_SECRET_KEY}")
    private String API_SECRET_KEY;

    public StripeService() {

    }

    public String createCustomer(String email, String token) {

        String id = null;

        try {
            Stripe.apiKey = API_SECRET_KEY;
            
            //set new Customer data
            Map<String, Object> customerParams = new HashMap<>();
            customerParams.put("description", "Customer for " + email);
            customerParams.put("email", email);
            customerParams.put("source", token);  // obtained with stripe.js

            //Get Customer List from Stripe.com
            Map<String, Object> params = new HashMap<>();
            params.put("email", email); 
            CustomerCollection customerMap = Customer.list(params);
            
           List<Customer> customerList =  customerMap.getData();
           
           //Check if given email already exists in customer list. If yes, get that customer's id.
           for (Customer c : customerList){
           
               if (c.getEmail().equalsIgnoreCase(email)) {
               
               
               id = c.getId();
               
               }
               
           }
           
           //If the given email is not in the customer list, which means id will be null, create new Stripe Customer.
           if (id==null){
               
                Customer customer = Customer.create(customerParams);

                 id = customer.getId();
           }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return id;
    }

    public String createChargeForStripeCustomer(String email, double amount, String customerID) {

        String chargeId = null;
        
        int finalAmount = (int) (amount * 100);
        
        
        try {
            Stripe.apiKey = API_SECRET_KEY;

            Map<String, Object> chargeParams = new HashMap<>();
            chargeParams.put("description", "Charge for " + email);
            chargeParams.put("currency", "EUR");
            chargeParams.put("amount", finalAmount);
//			chargeParams.put("source",token);
            chargeParams.put("customer", customerID);

            Charge charge = Charge.create(chargeParams);

            chargeId = charge.getId();
        } catch (Exception e) {
            e.printStackTrace();
        }

        System.out.println(">>>>Charge id is: "+chargeId);
        return chargeId;
    }
    
     public String createChargeForSimpleEmail(String email, double amount, String token) {

        String chargeId = null;
        
        int finalAmount = (int) (amount * 100);
        
        
        try {
            Stripe.apiKey = API_SECRET_KEY;

            Map<String, Object> chargeParams = new HashMap<>();
            chargeParams.put("description", "Charge for " + email);
            chargeParams.put("currency", "EUR");
            chargeParams.put("amount", finalAmount);
//			chargeParams.put("source",token);
            chargeParams.put("source",token);

            Charge charge = Charge.create(chargeParams);

            chargeId = charge.getId();
        } catch (Exception e) {
            e.printStackTrace();
        }

        System.out.println(">>>>Charge id is: "+chargeId);

        return chargeId;
    }

}
