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

checkout_result = checkout.generate_receipt

checkout_result.lines.each do |line|
  puts "#{line.quantity} #{line.text} #{line.total_with_tax.to_f.round(2)}"
end
puts "Sales Taxes: $ #{checkout_result.taxes.to_f.round(2)}"
puts "Total: $ #{checkout_result.total.to_f.round(2)}"


# checkout.clear

# puts "--------------------------------"

# # Input 02

# # 1 imported box of chocolates at 10.00
# # 1 imported bottle of perfume at 47.50

# checkout.add_product(CheckoutItem.new(Product.new('Box of Chocolates', 'food', 10.00, true), 1))
# checkout.add_product(CheckoutItem.new(Product.new('Perfume', 'technology', 47.50, true), 1))

# checkout.generate_receipt

# checkout.clear

# # Input 03

# puts "--------------------------------"

# # 1 imported bottle of perfume at 27.99
# # 1 bottle of perfume at 18.99
# # 1 packet of headache pills at 9.75
# # 3 imported boxes of chocolates at 11.25

# checkout.add_product(CheckoutItem.new(Product.new('Imported bottle of perfume', 'cosmetics', 27.99, true), 1))
# checkout.add_product(CheckoutItem.new(Product.new('bottle of perfume', 'cosmetics', 18.99, false), 1))
# checkout.add_product(CheckoutItem.new(Product.new('packet of headache pills', 'medical', 9.75, false), 1))
# checkout.add_product(CheckoutItem.new(Product.new('imported boxes of chocolates', 'food', 11.25, true), 3))

# checkout.generate_receipt

# checkout.clear