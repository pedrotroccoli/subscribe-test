require 'bigdecimal'

require_relative 'taxes/basic_sales'
require_relative 'taxes/import_duty'

puts "Hello Subscribe"

# First test

BasicSalesTaxClass = BasicSalesTax.new
ImportDutyTaxClass = ImportDutyTax.new

without_basic_sales_tax = Struct.new(:category, :price, :imported).new('book', 10.00, false)
with_basic_sales_tax = Struct.new(:category, :price, :imported).new('technology', 15.32, false)

without_import_duty_tax = Struct.new(:category, :price, :imported).new('book', 10.00, false)
with_import_duty_tax = Struct.new(:category, :price, :imported).new('book', 15.32, true)

puts BasicSalesTaxClass.apply_tax(without_basic_sales_tax)
puts BasicSalesTaxClass.apply_tax(with_basic_sales_tax)
puts ImportDutyTaxClass.apply_tax(without_import_duty_tax)
puts ImportDutyTaxClass.apply_tax(with_import_duty_tax)