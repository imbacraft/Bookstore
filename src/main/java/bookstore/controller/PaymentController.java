package bookstore.controller;

import bookstore.service.StripeService;
import bookstore.service.StripeResponse;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/payment")
public class PaymentController {

	@Value("${STRIPE_PUBLIC_KEY}")
	private String API_PUBLIC_KEY;

                   @Autowired
	StripeService stripeService;
                   

	public PaymentController(StripeService stripeService) {
		this.stripeService = stripeService;
	}


	@GetMapping
	public String chargePage(Model model) {
		model.addAttribute("stripePublicKey", API_PUBLIC_KEY);
                
                                       System.out.println(">>>>Sending API PUBLIC KEY to JSP: "+ API_PUBLIC_KEY);
		return "charge";
	}

	@PostMapping
	public @ResponseBody StripeResponse createCharge(String email, String token) {
            
                    System.out.println("email: "+ email+ "Token: "+ token);

		if (token == null) {
			return new StripeResponse(false, "Stripe payment token is missing. please try again later.");
		}

		String chargeId = stripeService.createCharge(email, token, 999);// 9.99 usd

		if (chargeId == null) {
			return new StripeResponse(false, "An error accurred while trying to charge.");
		}

		// You may want to store charge id along with order information

		return new StripeResponse(true, "Success your charge id is " + chargeId);
	}
}
