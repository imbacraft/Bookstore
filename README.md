# BookaPorta

## What is BookaPorta?

BookaPorta is a web-application that simulates the experience of an online bookstore.

## Views

It supports the following views:

1. Home page - Contains Suggested book categories, the Book of the Month, the Author of the Month and books from them.
2. Books by category
3. Books by author
4. Specific book page
5. Bestsellers page
6. Cart view
7. Shipping details page
8. Credit card page
9. Completed order page
10. Administration and other roles pages

## Features

1. Chat via websockets
2. Autocomplete for search bar (authors & book titles)
3. Credit card payment via Stripe.com

## Technologies used

1. Java SE v. 1.8
2. Spring Boot Security
3. MySQL database
4. JSPs for views

## Installation 

1. Import database (bookstore.sql file) with your favorite DB tool (MySQLWorkbench, DBeaver etc).
2. Set spring.datasource.username and spring.datasource.password in /Bookstore/src/main/resources/application.properties file, in order to get a successful connection with the database.
3. Build the project with your favorite IDE.
4. mvn spring-boot:run to run the application.
5. Application should be running at localhost:8080/bookstore.
