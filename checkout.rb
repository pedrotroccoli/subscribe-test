require_relative 'taxes/basic_sales'
require_relative 'taxes/import_duty'
require_relative 'domain/tax_manager'

class Checkout
  def initialize(tax_manager)
    @tax_manager = tax_manager
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
      all_taxes = @tax_manager.apply_taxes(item.product)

      total += (item.product.price + all_taxes) * item.quantity
      taxes += all_taxes * item.quantity

      puts "#{item.quantity} #{item.product.name} #{item.product.price} - #{all_taxes.to_f.round(2)} - #{(all_taxes * item.quantity).to_f.round(2)}"
    end

    puts "\n"
    puts "Sales Taxes: $ #{taxes.to_f.round(2)}"
    puts "Total: $ #{total.to_f.round(2)} \n\n"
  end
end