## Domain

I decided to keep all the rules and the "structural" classes here, in a folder called domain, because these are literally the domain classes with 
the business rules and also the base for other classes.

I created some files and I'll give you the reason for it.

1. TaxBase - An abstract class to manage every tax in the application, other classes would use it to create their own rules of taxes.
2. TaxManager - This class receives a list of taxes (TaxBase) and apply every tax into a single product returning the final tax after all taxes are applied.
3. Receipt - Just keeping the Receipt and ReceiptItem structure in a separate file so other files can use it.
4. ReceiptPrinter - An abstract class to manage the printing of checkouts
5. Product - Just keeping the Product structure in a separate file so other files can use it.
6. CheckoutItem - Since I separated a product representation form it's quantity in the checkout I created a CheckoutItem that can receives a product and a quantity, so it's a structure that can be imported to other files.