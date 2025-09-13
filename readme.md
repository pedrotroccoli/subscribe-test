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
