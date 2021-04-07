

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<head>
    <title>Charge</title>
    <!--Bootstrap 4 CSS-->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">

    <!--Bootstrap 4 JavaScript-->
    <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

    <!--Stripe JavaScript Library-->
    <script src="https://js.stripe.com/v3/"></script>
</head>
<body class="bg-light pt-5">

    <!--hero section-->
    <section class="py-5">
        <div class="container">
            <div class="row">
                <div class="col-lg-6 col-md-8 col-12 my-auto mx-auto">
                    <h1>
                        Pay with Stripe
                    </h1>



                    <!-- Cart contents here -->
                    <div class="card mb-4">
                        <div class="card-body">
                          
        
     
        Cart  Details
         <table cellpadding="2" cellspacing="2" border="1">
            <tr>
                <th>Book</th>
                <th>Title</th>
                <th>Format</th>
                <th>Quantity</th>
                <th>Subtotal</th>
            </tr>

            <% double total = 0.0; %>

            <c:forEach var="cartitem" items="${sessionScope.cart}">


                <c:set var="subtotal" value="${cartitem.bookdetails.price * cartitem.quantity}"></c:set>

              

                <% total = total + (double) pageContext.getAttribute("subtotal");  %>

                <tr>
                    <td><a href="${pageContext.request.contextPath}/books/search/${cartitem.bookdetails.book.bookid}"><img src="${cartitem.bookdetails.frontcover}" width="100"></a></td>
                    <td>${cartitem.bookdetails.book.title}</td>
                    <td>${cartitem.bookdetails.format.name}</td>
                    <td> ${cartitem.quantity } </td>
                    <td> <fmt:formatNumber value="${subtotal}" maxFractionDigits="3"/>&euro;</td>
                   
                </tr>
            </c:forEach>

                <% pageContext.setAttribute("total", total); %>
            <tr>
                <td colspan="6">
                    Total: <fmt:formatNumber value="${total}" maxFractionDigits="3"/>&euro;
                </td>

            </tr>


        </table>
                
        Delivery Address
        <table cellpadding="2" cellspacing="2" border="1">
             <tr>
                <th>Country</th>
                <th>City</th>
                <th>Street</th>
                <th>Street number</th>
                <th>Postal Code</th>
            </tr>
            
            
            
        </table>
                
                
                        </div>
                    </div>


                    <!-- Payment Form -->
                    <form:form action="${pageContext.request.contextPath}/payment" method="post" id="payment-form">
                        <input id="api-key" name="api-key" value="${stripePublicKey}" hidden>
                        <input id="token" name="token" value="" hidden>
                        <input id="amount" name="amount" value="${amount}" hidden>

                        <div class="form-group">
                            <label class="font-weight-medium" for="card-element">
                                Enter credit or debit card below
                            </label>

                            <div class="w-100" id="card-element">
                                <!-- A Stripe Element will be inserted here. -->
                            </div>
                        </div>

                        <div class="form-group">
                            <input class="form-control" id="email" name="email"
                                   placeholder="Email Address" type="email" required>
                        </div>

                        <!-- Used to display Element errors. -->
                        <div class="text-danger w-100" id="card-errors" role="alert"></div>
                        <div class="form-group pt-2">

                            <button class="btn btn-primary btn-block" id="submitButton" type="submit">
                                Pay With Your Card
                            </button>


                        </div>


                    </form:form>

                </div>
            </div>
        </div>
    </section>

    <!--custom javascript for handling subscription-->
    <script>
        $(function () {
            var API_KEY = $('#api-key').val();
            // Create a Stripe client.
            var stripe = Stripe(API_KEY);

            // Create an instance of Elements.
            var elements = stripe.elements();

            // Create an instance of the card Element.
            var card = elements.create('card');

            // Add an instance of the card Element into the `card-element` <div>.
            card.mount('#card-element');

            // Handle real-time validation errors from the card Element.
            card.addEventListener('change', function (event) {
                var displayError = document.getElementById('card-errors');
                if (event.error) {
                    displayError.textContent = event.error.message;
                } else {
                    displayError.textContent = '';
                }
            });

            // Handle form submission.
            var form = document.getElementById('payment-form');
            form.addEventListener('submit', function (event) {
                event.preventDefault();

                stripe.createToken(card).then(function (result) {
                    if (result.error) {
                        // Inform the customer that there was an error.
                        var errorElement = document.getElementById('card-errors');
                        errorElement.textContent = result.error.message;
                    } else {
                        // Send the token to your server.
                        stripeTokenHandler(result.token);
                    }
                });

                function stripeTokenHandler(token) {
                    // Insert the token ID into the form so it gets submitted to the server
                    var formvalue = document.getElementById('token');
                    formvalue.setAttribute ('value', token.id);


                    // Submit the form
                    form.submit();
                }
            });

        });
    </script>


</body>
</html>