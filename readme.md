# Introduction

Hello everyone, my name is Pedro Troccoli and I'll let my thoughts and why I took some project/architecture decisions written in some `md` files in this project,
this is the main file so my initial review would be here.

### For a quick guide in how to run:

**[See the complete setup and running guide →](how-to-run.md)**

This guide includes:
- Prerequisites and installation steps
- How to run the application and tests
- Project structure overview
- Troubleshooting common issues

## About the problem

I read the description of the problem. From what I understand, this is almost like a checkout process, where we can add `products` and receive `receipts`, 
in addition to the checkout calculating fees and returning the results to the customer.

Since we are going to follow a class approach, I can think of an initial structure with a few classes:

- Checkout (Responsible for managing everything)
- TaxManager (Responsible for applying taxes to products)
- ReceiptPrinter (Responsible for generating the customer's receipt)
- Tax (Responsible for managing a specific Tax)

In addition, we would have some objects, at least their representation. The `product` and the `receipt`, so that all products and receipts have the same 
structure and we can create classes that deal only with “products” and ‘receipts’ and not with a specific type of "product" or “receipt.”

We would also have the `BasicSalesTax` and `ImportDutyTax` classes to manage the taxes applied to products separately. They would “inherit” or have the same structure 
as a generic ‘Tax’ class, so the “TaxManager” could decide which taxes to apply to which products.

### Specific behaviors

1. Numbers - I saw that we're dealing with numbers and decimal values. I can see that we have to use the `BigDecimal` Ruby class to deal with sums, subtractions and multiplications of numbers
with many floating points. Since it's a class made for precision I think we'll not have problems dealing with the products price and the total amount of taxes and products.
2. Rounding - One important behavior of the application is the rounding described in the documentation, "The rounding rules for sales tax are that for a tax rate of n%, a shelf price 
of p contains (np/100 rounded up to the nearest 0.05) amount of sales tax.", I read it sometimes and the calculated tax would be rounded in some products, a simple example would be a product
with a price of $6.22, the tax for this product if we apply the tax of 10% is $0.622, but we need to round it to the nearest value with 0.05 precision, this would turn our tax to $0.625.

I would create a utility for this, since it's a function that could be used in many places.

## Additional Documentation

For more detailed information about the project structure and implementation decisions, check out these documentation files:

- **[Domain Architecture](domain/domain.md)** - Explains the core domain classes and business rules
- **[Implementation Details](implementations/implementations.md)** - Describes the concrete implementations of taxes and printing
- **[How to Run](how-to-run.md)** - Complete setup and running instructions

## Historic

This section is basically a history of when I was creating the application. From when I started until the moment I finished. It shows some of my decisions.

1. Ok, I'll start now, maybe I'll come back and check all my initial thoughts and change something in the middle of the process. But this is the main structure.
2. Now I created the main tax classes that calculate all the required taxes for products. I'll start to create the Checkout now.
3. I noticed one more structure is important, a "CheckoutItem" to match a product and a quantity of a product. I already created it.
4. I finished the first version of it, all the common scenarios that were passed to it are working. I was focused on it but I'll assume that I forgot to create the tests first and then the classes,
so my focus now is creating the tests for all the classes. And also, I'm missing the ReceiptPrinter, I'll implement it too.
5. I finished all the important tests, I'll implement the ReceiptPrinter in the checkout.
6. With the implementation of the Receipt class, I think I have finished all the tests and the application. Now I will check again for inconsistencies and probably I'll give
a double check in the problem statement to check if I'm missing something.
7. I'm filling more documentation `.md` files to give you the reasons for the creation of some `files`/`classes` and show you my thoughts.
8. Well, as I was reading the problem statement, the last change that I would do is keeping the checkout immutable for thread safety.
9. I added the last tests for checkout now.
10. I think I'll keep the project like this, I can create more abstractions or more tests just to verify the structure of the objects and many other things,
but I saw in the GitHub problem statement that you want to keep it simple, not over-engineered, so that would be my final answer.
