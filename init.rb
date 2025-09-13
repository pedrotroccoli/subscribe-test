require 'bigdecimal'

require_relative 'checkout'

# Second test

Product = Struct.new(:category, :price, :imported)
CheckoutItem = Struct.new(:product, :quantity)

checkout = Checkout.new
checkout.add_product(CheckoutItem.new(Product.new('book', 10.00, false), 1))
checkout.add_product(CheckoutItem.new(Product.new('technology', 15.32, false), 1))
checkout.add_product(CheckoutItem.new(Product.new('book', 10.00, true), 1))
checkout.add_product(CheckoutItem.new(Product.new('book', 15.32, true), 1))
checkout.generate_receipt
