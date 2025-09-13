class Checkout
  def initialize(tax_manager)
    @tax_manager = tax_manager
    @items = []
  end

  def add_product(checkout_item)
    @items << checkout_item
  end

  def clear
    @items = []
  end

  def generate_receipt
    total = 0
    taxes = 0

    puts "All products: \n\n"

    @items.each do |item|
      all_taxes = @tax_manager.apply_taxes(item.product)

      product_after_taxes = item.product.price + all_taxes
      total_products = product_after_taxes * item.quantity

      total += total_products
      taxes += all_taxes * item.quantity

      puts "#{item.quantity} #{item.product.name} #{total_products.to_f.round(2)}"
    end

    puts "\n"
    puts "Sales Taxes: $ #{taxes.to_f.round(2)}"
    puts "Total: $ #{total.to_f.round(2)} \n\n"
  end
end