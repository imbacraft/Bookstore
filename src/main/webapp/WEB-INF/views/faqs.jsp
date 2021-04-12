<%-- 
    Document   : home
    Created on : Feb 18, 2021, 8:46:36 PM
    Author     : user
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h3>FAQs</h3>
        <hr/>

        <br>

        <h4>What is BookaPorta?</h4>
        <p>At BookaPorta, we love high street shopping. From browsing to buying, finding new shops to meeting passionate staff. If we could live in a bookshop, we’d probably do it. Therefore, we decided to open a bookshop ourselves.
            We're working hard to keep that fun and sociable shopping experience alive for 15 years. </p>

        <p>We hope the list of questions and answers below will provide the information you’re looking for.  
            If not, don’t worry! You can contact us either via e-mail at bookaporta@gmail.com, or you can press <a href="${pageContext.request.contextPath}/chat">here</a> to chat with our Customer Service Staff.</p>



        <h4>What products can I buy?</h4>
        <p>At BookaPorta we offer books, in all kinds of formats (paperpack, hardcover, leather bound , audio books, eBooks, eAudiobooks).

        <h4>How do I find what I’m looking for?</h4>
        <p>At BookaPorta you can search directly a book by its title or author name, or browse by category or author name. We also strongly encourage you to check our Best Sellers and Offers sections.</p>

     
        <h4>What are the benefits of having an account at BookaPorta?</h4>
        <p>We ask that all customers create an account and have made this process as simple and as quick as possible. 
            <br>
        Your account will enable you to:
        <br>
        Edit and change the name on your account,
        <br>
        Edit and change your contact details (for example, email address),
        <br>
        Edit and change delivery address(s),
        <br>
        View your order history,
        <br>
        Get discount coupons.
        <br>
        It’s easy to do and once an account has been registered, click Sign in to reach your account.</p>



        <h4>When will I have to contact customer service?</h4>
        <p>You will have to contact customer service – bookaportacustomerservice@gmail.com
            if you wish to cancel an order for an item which is showing as 'In stock' as it might not be possible to stop the order from being suppllied as orders are passed through to our fulfilment partner as soon as the order is placed. <p>

    
        <h4>Are prices inclusive of VAT?</h4>
        
        <p>All selling prices include VAT where relevant.  Books are not subject to VAT but it is included in the selling price of eBooks and eAudiobooks.</p>


        <h4>Which payment methods do you accept? </h4>
        <p>We accept credit/debit cards issued by Banks of Europe and the USA, via www.Stripe.com.</p>

        <h4>When will payment be taken?</h4>
        <p>When you pay by credit or debit card, the full amount of the order will be pre-authorised against your card - so you need to make sure there are sufficient funds in your account when the order is placed. </p>


        <h4> Where do you deliver? </h4>
        <p> We deliver within Greece, Europe and to many countries across the world. If your country is not supported, we will contact you as soon as possible.</p>
        
        <h4>How do I cancel an order?</h4>
        <p>To request cancellation of an order please email bookaportacustomerservice@gmail.com giving your order number. </p>
        
        <h4>How can I get a refund for a product bought online?</h4>
        <p>Items must be returned within 30 days of receipt and returned to Bookaporta and not to a Bookaporta Network retailer.</p>
        
        
        <a href="${pageContext.request.contextPath}/home">Home</a>


    </body>


</html>
