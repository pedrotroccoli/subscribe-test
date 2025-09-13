require 'bigdecimal'

require_relative 'checkout'

# Second test

Product = Struct.new(:name, :category, :price, :imported)
CheckoutItem = Struct.new(:product, :quantity)

checkout = Checkout.new
checkout.add_product(CheckoutItem.new(Product.new('Tranquility of Mind', 'book', 10.00, false), 1))
checkout.add_product(CheckoutItem.new(Product.new('Headphone', 'technology', 15.32, false), 1))
checkout.add_product(CheckoutItem.new(Product.new('The Joy of Cooking', 'book', 10.00, true), 1))
checkout.add_product(CheckoutItem.new(Product.new('Chocolate Bar', 'food', 15.32, true), 1))
checkout.generate_receipt
