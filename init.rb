require 'bigdecimal'

require_relative 'taxes/basic_sales'

puts "Hello Subscribe"

# First test

BasicSalesTaxClass = BasicSalesTax.new

without_tax = Struct.new(:category, :price).new('book', 10.00)
with_tax = Struct.new(:category, :price).new('technology', 15.32)

puts BasicSalesTaxClass.apply_tax(without_tax)
puts BasicSalesTaxClass.apply_tax(with_tax)