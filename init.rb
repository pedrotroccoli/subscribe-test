require 'bigdecimal'

require_relative 'checkout'
require_relative 'domain/index'
require_relative 'implementations/index'

tax_manager = TaxManager.new([BasicSalesTax.new, ImportDutyTax.new])
checkout = Checkout.new(tax_manager)

puts "\n--------------------------------\n"

# Input 01
# 2 book at 12.49
# 1 music CD at 14.99
# 1 chocolate bar at 0.85
book = Product.new('Tranquility of Mind', 'book', 12.49, false)
music_cd = Product.new('Music CD', 'technology', 14.99, false)
chocolate_bar = Product.new('Chocolate Bar', 'food', 0.85, false)

checkout.add_product(CheckoutItem.new(book, 2))
checkout.add_product(CheckoutItem.new(music_cd, 1))
checkout.add_product(CheckoutItem.new(chocolate_bar, 1))

BasicPrinter.print(checkout.generate_receipt)


puts "\n--------------------------------\n"

checkout.clear

# Input 02
# 1 imported box of chocolates at 10.00
# 1 imported bottle of perfume at 47.50
perfume = Product.new('Perfume', 'technology', 47.50, true)
chocolate_box = Product.new('Box of Chocolates', 'food', 10.00, true)

checkout.add_product(CheckoutItem.new(chocolate_box, 1))
checkout.add_product(CheckoutItem.new(perfume, 1))

BasicPrinter.print(checkout.generate_receipt)

puts "\n--------------------------------\n"

checkout.clear

# Input 03
# 1 imported bottle of perfume at 27.99
# 1 bottle of perfume at 18.99
# 1 packet of headache pills at 9.75
# 3 imported boxes of chocolates at 11.25
imported_perfume = Product.new('Imported bottle of perfume', 'cosmetics', 27.99, true)
perfume = Product.new('bottle of perfume', 'cosmetics', 18.99, false)
headache_pills = Product.new('packet of headache pills', 'medical', 9.75, false)
chocolate_box = Product.new('imported boxes of chocolates', 'food', 11.25, true)

checkout.add_product(CheckoutItem.new(imported_perfume, 1))
checkout.add_product(CheckoutItem.new(perfume, 1))
checkout.add_product(CheckoutItem.new(headache_pills, 1))
checkout.add_product(CheckoutItem.new(chocolate_box, 3))

BasicPrinter.print(checkout.generate_receipt)

puts "\n--------------------------------\n"