# Introduction

Hello everyone, my name is Pedro Troccoli and I'll let my thoughts and why I took some project/architeture decisions written is some `md` files in this project,
this is the main file so my initial review would be here.


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

1. Numbers - I saw that we're dealing with numbers and decimal values I can see that we have to use `BigDecimal` ruby class to deal with sums, substractions and multiplications of numbers
with many floating points. Since it's a class made for precision I think we'll not have problems dealing with the products price and the total amount of taxes and products.
2. Rounding - One important behavior of the application is the rounding described in the documentation, "The rounding rules for sales tax are that for a tax rate of n%, a shelf price 
of p contains (np/100 rounded up to the nearest 0.05) amount of sales tax.", I read it sometimes and the calculated tax would be rounded in some products, a simple example would be a product
with a price of $ 6.22, the tax for this products if we apply the tax of 10% is $ 0.622, but, we need to round it to the nearest value with 0.05 precision, this would turn our Tax to $ 0.625,

I would create a utils for this, since it's a function that maybe could be used in many places.
