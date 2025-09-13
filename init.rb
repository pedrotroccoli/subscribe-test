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

# Input 01
# 2 book at 12.49
# 1 music CD at 14.99
# 1 chocolate bar at 0.85

checkout.add_product(CheckoutItem.new(Product.new('Tranquility of Mind', 'book', 12.49, false), 2))
checkout.add_product(CheckoutItem.new(Product.new('Music CD', 'technology', 14.99, false), 1))
checkout.add_product(CheckoutItem.new(Product.new('Chocolate Bar', 'food', 0.85, false), 1))

checkout.generate_receipt
