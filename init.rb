require 'bigdecimal'

require_relative 'checkout'
require_relative 'domain/tax_manager'
require_relative 'taxes/basic_sales'
require_relative 'taxes/import_duty'

# Second test

Product = Struct.new(:name, :category, :price, :imported)
CheckoutItem = Struct.new(:product, :quantity)

tax_manager = TaxManager.new([BasicSalesTax.new, ImportDutyTax.new])

checkout = Checkout.new(tax_manager)

checkout.add_product(CheckoutItem.new(Product.new('Tranquility of Mind', 'book', 10.00, false), 1))
checkout.add_product(CheckoutItem.new(Product.new('Headphone', 'technology', 15.32, false), 1))
checkout.add_product(CheckoutItem.new(Product.new('The Joy of Cooking', 'book', 10.00, true), 3))
checkout.add_product(CheckoutItem.new(Product.new('Chocolate Bar', 'food', 15.32, true), 1))

checkout.generate_receipt
