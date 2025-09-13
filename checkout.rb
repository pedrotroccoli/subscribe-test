require_relative 'taxes/basic_sales'
require_relative 'taxes/import_duty'

class Checkout
  def initialize
    @items = []
  end

  def add_product(checkout_item)
    @items << checkout_item
  end

  def generate_receipt
    puts "All products: \n\n"
    total = 0
    taxes = 0

    @items.each do |item|
      basic_tax = BasicSalesTax.new.apply_tax(item.product)
      import_duty = ImportDutyTax.new.apply_tax(item.product)

      all_taxes = basic_tax + import_duty

      total += (item.product.price + all_taxes) * item.quantity
      taxes += all_taxes * item.quantity

      puts "#{item.quantity} #{item.product.name} #{item.product.price} - #{basic_tax.to_f.round(2)} + #{import_duty.to_f.round(2)} - #{(all_taxes * item.quantity).to_f.round(2)}"
    end

    puts "\n"
    puts "Sales Taxes: $ #{taxes.to_f.round(2)}"
    puts "Total: $ #{total.to_f.round(2)} \n\n"
  end
end